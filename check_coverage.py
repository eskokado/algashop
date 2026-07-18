import os
import xml.etree.ElementTree as ET
import subprocess
import sys

import os
import xml.etree.ElementTree as ET
import subprocess
import sys
import time
import urllib.error
import urllib.request

def ensure_rapidex_wiremock():
    """Start WireMock (Rapidex API stub) via docker compose if not already reachable."""
    health_url = "http://localhost:8780/__admin/mappings"
    for _ in range(3):
        try:
            with urllib.request.urlopen(health_url, timeout=2) as response:
                if response.status == 200:
                    return True
        except (urllib.error.URLError, TimeoutError):
            pass

    try:
        subprocess.run(
            ["docker", "compose", "up", "-d", "rapidexapi"],
            check=True,
            capture_output=True,
            text=True
        )
    except (subprocess.CalledProcessError, FileNotFoundError) as error:
        print(f"Warning: could not start WireMock via docker compose: {error}")
        return False

    for _ in range(30):
        try:
            with urllib.request.urlopen(health_url, timeout=2) as response:
                if response.status == 200:
                    return True
        except (urllib.error.URLError, TimeoutError):
            time.sleep(1)

    print("Warning: WireMock did not become ready on http://localhost:8780")
    return False

def run_gradle_tasks():
    """Run Gradle tasks to generate Jacoco coverage report (including integration tests)."""
    ensure_rapidex_wiremock()
    os.chdir("microservices/ordering")
    try:
        result = subprocess.run(
            ["./gradlew", "clean", "test", "integrationTest", "jacocoTestReport"],
            check=True,
            capture_output=True,
            text=True
        )
        print("Gradle tasks completed successfully!")
        return True
    except subprocess.CalledProcessError as e:
        print("Error running Gradle tasks:")
        print(e.stdout)
        print(e.stderr)
        return False
    finally:
        os.chdir("../..")

def analyze_coverage(xml_path):
    if not os.path.exists(xml_path):
        print(f"Error: XML report not found at {xml_path}")
        return False

    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
    except Exception as e:
        print(f"Error parsing XML: {e}")
        return False

    print("=" * 60)
    print("JACOCO CODE COVERAGE REPORT SUMMARY (INCLUDING INTEGRATION TESTS)")
    print("=" * 60)

    # Print overall coverage counters
    overall_counters = root.findall("./counter")
    for counter in overall_counters:
        c_type = counter.get("type")
        missed = int(counter.get("missed", 0))
        covered = int(counter.get("covered", 0))
        total = missed + covered
        percentage = (covered / total * 100) if total > 0 else 100.0
        print(f"{c_type:15} | Covered: {covered:5} | Missed: {missed:5} | Total: {total:5} | Coverage: {percentage:6.2f}%")
    
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
            
            # Check instructions/line coverage for class
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
                    print(f"  - Lines:      {covered_lines}/{total_lines} covered ({line_pct:.2f}%) - {missed_lines} missed")
                if total_branches > 0 and branch_pct < 100.0:
                    print(f"  - Branches:   {covered_branches}/{total_branches} covered ({branch_pct:.2f}%) - {missed_branches} missed")

    print("=" * 60)
    if not_fully_covered_count == 0:
        print(f"SUCCESS: All {all_classes_count} classes have 100% code coverage!")
        return True
    else:
        print(f"WARNING: {not_fully_covered_count}/{all_classes_count} classes do not have 100% coverage.")
        return False

if __name__ == "__main__":
    success = run_gradle_tasks()
    if not success:
        sys.exit(1)
    
    xml_report = "microservices/ordering/build/reports/jacoco/test/jacocoTestReport.xml"
    result = analyze_coverage(xml_report)
    sys.exit(0 if result else 1)
