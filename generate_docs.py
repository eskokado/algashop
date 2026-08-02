#!/usr/bin/env python3
import argparse
import os
import subprocess
import sys
import webbrowser

SERVICES = {
    "product-catalog": {
        "path": "microservices/product-catalog",
        "gradle_tasks": ["asciidoctor"],
        "output_html": "microservices/product-catalog/build/docs/asciidoc/index.html",
        "adoc_source": "microservices/product-catalog/src/docs/asciidoc/index.adoc",
    },
}


def parse_args(argv):
    parser = argparse.ArgumentParser(
        description=(
            "Generate AsciiDoctor API docs from Spring REST Docs snippets "
            "(runs contractTest + asciidoctor)."
        )
    )
    parser.add_argument(
        "services",
        nargs="*",
        metavar="service",
        help=(
            "Services to document (default: all configured). "
            f"Available: {', '.join(SERVICES.keys())}"
        ),
    )
    parser.add_argument(
        "--open",
        action="store_true",
        help="Open the generated HTML in the default browser when done.",
    )
    parser.add_argument(
        "--skip-tests",
        action="store_true",
        help=(
            "Skip contractTest and only run asciidoctor "
            "(requires existing snippets in build/generated-snippets)."
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


def generate_docs(service_name, skip_tests=False):
    service = SERVICES[service_name]
    repo_root = os.getcwd()
    adoc_source = service["adoc_source"]

    if not os.path.exists(adoc_source):
        print(f"Error: AsciiDoc source not found at {adoc_source}")
        return False

    gradle_tasks = list(service["gradle_tasks"])
    if skip_tests:
        gradle_tasks += ["-x", "contractTest", "-x", "test"]

    print(f"\nGenerating docs for {service_name}...")
    if skip_tests:
        print("Skipping tests (-x contractTest -x test); using existing snippets if present.")

    os.chdir(service["path"])
    try:
        subprocess.run(
            ["./gradlew", "--stop"],
            check=False,
            capture_output=True,
            text=True,
        )
        result = subprocess.run(
            ["./gradlew", "--no-daemon", *gradle_tasks],
            check=False,
            capture_output=True,
            text=True,
        )
        if result.returncode != 0:
            print(f"Error generating docs for {service_name}:")
            print(result.stdout)
            print(result.stderr)
            return False

        print(f"Docs generated successfully for {service_name}!")
        return True
    finally:
        os.chdir(repo_root)


def report_output(service_name, open_browser=False):
    output_html = SERVICES[service_name]["output_html"]
    abs_html = os.path.abspath(output_html)

    if not os.path.exists(abs_html):
        print(f"Warning: expected HTML not found at {abs_html}")
        return False

    print(f"HTML: {abs_html}")
    if open_browser:
        webbrowser.open(f"file://{abs_html}")
    return True


if __name__ == "__main__":
    cli_args = parse_args(sys.argv[1:])
    selected_services = resolve_services(cli_args.services)
    all_success = True

    for service_name in selected_services:
        if not generate_docs(service_name, skip_tests=cli_args.skip_tests):
            all_success = False
            continue
        if not report_output(service_name, open_browser=cli_args.open):
            all_success = False

    sys.exit(0 if all_success else 1)
