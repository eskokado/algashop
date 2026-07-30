import os
import subprocess
import sys
import time
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET

SERVICES = {
    "ordering": {
        "path": "microservices/ordering",
        "xml_report": "microservices/ordering/build/reports/jacoco/test/jacocoTestReport.xml",
        "gradle_tasks": ["clean", "test", "integrationTest", "jacocoTestReport"],
        "requires_wiremock": True,
    },
    "billing": {
        "path": "microservices/billing",
        "xml_report": "microservices/billing/build/reports/jacoco/test/jacocoTestReport.xml",
        "gradle_tasks": ["clean", "test", "integrationTest", "jacocoTestReport"],
        "requires_wiremock": False,
    },
    "product-catalog": {
        "path": "microservices/product-catalog",
        "xml_report": "microservices/product-catalog/build/reports/jacoco/test/jacocoTestReport.xml",
        "gradle_tasks": ["clean", "test", "contractTest", "jacocoTestReport"],
        "requires_wiremock": False,
    },
}


def ensure_rapidex_wiremock():
    """Start WireMock (Rapidex API stub) via docker compose if not already reachable."""
    health_url = "http://localhost:8780/__admin/mappings"
    for _ in range(3):
        try:
            with urllib.request.urlopen(health_url, timeout=2) as response:
                if response.status == 200:
                    return True
        except (urllib.error.URLError, TimeoutError, ConnectionResetError):
            pass

    try:
        subprocess.run(
            ["docker", "compose", "up", "-d", "rapidexapi"],
            check=True,
            capture_output=True,
            text=True,
        )
    except (subprocess.CalledProcessError, FileNotFoundError) as error:
        print(f"Warning: could not start WireMock via docker compose: {error}")
        return False

    for _ in range(30):
        try:
            with urllib.request.urlopen(health_url, timeout=2) as response:
                if response.status == 200:
                    return True
        except (urllib.error.URLError, TimeoutError, ConnectionResetError):
            time.sleep(1)

    print("Warning: WireMock did not become ready on http://localhost:8780")
    return False


def resolve_services(args):
    if not args:
        return list(SERVICES.keys())

    selected = []
    for arg in args:
        service = arg.lower()
        if service not in SERVICES:
            available = ", ".join(SERVICES.keys())
            print(f"Error: unknown service '{arg}'. Available services: {available}")
            sys.exit(1)
        if service not in selected:
            selected.append(service)

    return selected


def run_gradle_tasks(service_name):
    """Run Gradle tasks to generate Jacoco coverage report for a microservice."""
    service = SERVICES[service_name]
    repo_root = os.getcwd()

    if service["requires_wiremock"]:
        ensure_rapidex_wiremock()

    print(f"\nRunning tests and coverage for {service_name}...")
    os.chdir(service["path"])
    try:
        subprocess.run(
            ["./gradlew", "--stop"],
            check=False,
            capture_output=True,
            text=True,
        )
        subprocess.run(
            ["./gradlew", "--no-daemon", *service["gradle_tasks"]],
            check=True,
            capture_output=True,
            text=True,
        )
        print(f"Gradle tasks completed successfully for {service_name}!")
        return True
    except subprocess.CalledProcessError as error:
        print(f"Error running Gradle tasks for {service_name}:")
        print(error.stdout)
        print(error.stderr)
        return False
    finally:
        os.chdir(repo_root)


def analyze_coverage(service_name, xml_path):
    if not os.path.exists(xml_path):
        print(f"Error: XML report not found at {xml_path}")
        return False

    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
    except Exception as error:
        print(f"Error parsing XML for {service_name}: {error}")
        return False

    print("=" * 60)
    print(f"JACOCO CODE COVERAGE REPORT SUMMARY - {service_name.upper()}")
    print("=" * 60)

    overall_counters = root.findall("./counter")
    for counter in overall_counters:
        counter_type = counter.get("type")
        missed = int(counter.get("missed", 0))
        covered = int(counter.get("covered", 0))
        total = missed + covered
        percentage = (covered / total * 100) if total > 0 else 100.0
        print(
            f"{counter_type:15} | Covered: {covered:5} | Missed: {missed:5} | "
            f"Total: {total:5} | Coverage: {percentage:6.2f}%"
        )

    print("-" * 60)
    print("CLASSES NOT AT 100% COVERAGE:")
    print("-" * 60)

    not_fully_covered_count = 0
    all_classes_count = 0

    for pkg in root.findall(".//package"):
        pkg_name = pkg.get("name").replace("/", ".")
        for cls in pkg.findall("./class"):
            cls_name = cls.get("name").split("/")[-1]
            all_classes_count += 1

            line_counter = cls.find("./counter[@type='LINE']")
            branch_counter = cls.find("./counter[@type='BRANCH']")

            missed_lines = 0
            covered_lines = 0
            missed_branches = 0
            covered_branches = 0

            if line_counter is not None:
                missed_lines = int(line_counter.get("missed", 0))
                covered_lines = int(line_counter.get("covered", 0))
            if branch_counter is not None:
                missed_branches = int(branch_counter.get("missed", 0))
                covered_branches = int(branch_counter.get("covered", 0))

            total_lines = missed_lines + covered_lines
            line_pct = (covered_lines / total_lines * 100) if total_lines > 0 else 100.0

            total_branches = missed_branches + covered_branches
            branch_pct = (covered_branches / total_branches * 100) if total_branches > 0 else 100.0

            if line_pct < 100.0 or branch_pct < 100.0:
                not_fully_covered_count += 1
                pkg_cls = f"{pkg_name}.{cls_name}"
                print(f"{pkg_cls:<60}")
                if total_lines > 0 and line_pct < 100.0:
                    print(
                        f"  - Lines:      {covered_lines}/{total_lines} covered "
                        f"({line_pct:.2f}%) - {missed_lines} missed"
                    )
                if total_branches > 0 and branch_pct < 100.0:
                    print(
                        f"  - Branches:   {covered_branches}/{total_branches} covered "
                        f"({branch_pct:.2f}%) - {missed_branches} missed"
                    )

    print("=" * 60)
    if not_fully_covered_count == 0:
        print(f"SUCCESS: All {all_classes_count} classes have 100% code coverage in {service_name}!")
        return True

    print(
        f"WARNING: {not_fully_covered_count}/{all_classes_count} classes do not have "
        f"100% coverage in {service_name}."
    )
    return False


if __name__ == "__main__":
    selected_services = resolve_services(sys.argv[1:])
    all_success = True

    for service_name in selected_services:
        if not run_gradle_tasks(service_name):
            all_success = False
            continue

        xml_report = SERVICES[service_name]["xml_report"]
        if not analyze_coverage(service_name, xml_report):
            all_success = False

    sys.exit(0 if all_success else 1)
