import argparse
import os
import subprocess
import sys
import time
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET

TEST_TYPES = ["test", "integrationTest", "contractTest"]

SERVICES = {
    "ordering": {
        "path": "microservices/ordering",
        "xml_report": "microservices/ordering/build/reports/jacoco/test/jacocoTestReport.xml",
        "test_tasks": ["test", "integrationTest", "contractTest"],
        "requires_wiremock": True,
    },
    "billing": {
        "path": "microservices/billing",
        "xml_report": "microservices/billing/build/reports/jacoco/test/jacocoTestReport.xml",
        "test_tasks": ["test", "integrationTest"],
        "requires_wiremock": False,
    },
    "product-catalog": {
        "path": "microservices/product-catalog",
        "xml_report": "microservices/product-catalog/build/reports/jacoco/test/jacocoTestReport.xml",
        "test_tasks": ["test", "contractTest"],
        "requires_wiremock": False,
    },
}


def free_ordering_wiremock_ports():
    """Stop Docker WireMock so OrderControllerIT can bind 8780/8781 itself."""
    health_url = "http://localhost:8780/__admin/mappings"

    def port_in_use():
        try:
            with urllib.request.urlopen(health_url, timeout=2) as response:
                return response.status == 200
        except (urllib.error.URLError, TimeoutError, ConnectionResetError):
            return False

    if not port_in_use():
        return True

    try:
        subprocess.run(
            ["docker", "compose", "stop", "wiremock"],
            check=True,
            capture_output=True,
            text=True,
        )
    except (subprocess.CalledProcessError, FileNotFoundError) as error:
        print(f"Warning: could not stop WireMock via docker compose: {error}")
        return False

    for _ in range(30):
        if not port_in_use():
            return True
        time.sleep(1)

    print("Warning: WireMock port 8780 is still in use; OrderControllerIT may fail to bind")
    return False


def parse_args(argv):
    parser = argparse.ArgumentParser(
        description="Run tests and check Jacoco coverage for the microservices."
    )
    parser.add_argument(
        "services",
        nargs="*",
        metavar="service",
        help=f"Services to check (default: all). Available: {', '.join(SERVICES.keys())}",
    )
    parser.add_argument(
        "-t",
        "--tests",
        default="all",
        metavar="TYPES",
        help=(
            "Comma-separated test types to run: "
            f"{', '.join(TEST_TYPES)} or 'all' (default: all). "
            "Example: --tests test,contractTest"
        ),
    )
    return parser.parse_args(argv)


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


def resolve_test_types(tests_arg):
    if tests_arg.strip().lower() == "all":
        return list(TEST_TYPES)

    selected = []
    for raw in tests_arg.split(","):
        name = raw.strip()
        if not name:
            continue
        matched = next((t for t in TEST_TYPES if t.lower() == name.lower()), None)
        if matched is None:
            available = ", ".join(TEST_TYPES)
            print(f"Error: unknown test type '{name}'. Available types: {available}, all")
            sys.exit(1)
        if matched not in selected:
            selected.append(matched)

    if not selected:
        print("Error: no test type selected.")
        sys.exit(1)

    return selected


def run_gradle_tasks(service_name, test_types):
    """Run Gradle tasks to generate Jacoco coverage report for a microservice."""
    service = SERVICES[service_name]
    repo_root = os.getcwd()

    test_tasks = [t for t in test_types if t in service["test_tasks"]]
    if not test_tasks:
        print(
            f"\nSkipping {service_name}: it does not support any of the selected "
            f"test types ({', '.join(test_types)})."
        )
        return None

    if service["requires_wiremock"] and "integrationTest" in test_tasks:
        free_ordering_wiremock_ports()

    gradle_tasks = ["clean", *test_tasks, "jacocoTestReport"]
    # jacocoTestReport depends on all test tasks, so explicitly exclude the
    # unselected ones to keep Gradle from running them anyway.
    for excluded in service["test_tasks"]:
        if excluded not in test_tasks:
            gradle_tasks += ["-x", excluded]
    print(f"\nRunning {', '.join(test_tasks)} and coverage for {service_name}...")
    os.chdir(service["path"])
    try:
        subprocess.run(
            ["./gradlew", "--stop"],
            check=False,
            capture_output=True,
            text=True,
        )
        subprocess.run(
            ["./gradlew", "--no-daemon", *gradle_tasks],
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
    cli_args = parse_args(sys.argv[1:])
    selected_services = resolve_services(cli_args.services)
    selected_test_types = resolve_test_types(cli_args.tests)
    all_success = True

    for service_name in selected_services:
        result = run_gradle_tasks(service_name, selected_test_types)
        if result is None:
            continue
        if not result:
            all_success = False
            continue

        xml_report = SERVICES[service_name]["xml_report"]
        if not analyze_coverage(service_name, xml_report):
            all_success = False

    sys.exit(0 if all_success else 1)
