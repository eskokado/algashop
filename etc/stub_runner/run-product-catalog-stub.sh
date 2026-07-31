#!/bin/bash
# Sobe o WireMock com os stubs do product-catalog (publicados no ~/.m2 via ./gradlew publishToMavenLocal)
set -e
cd "$(dirname "$0")"

STUB_RUNNER_VERSION=4.3.0
STUB_RUNNER_JAR="stub-runner-boot-${STUB_RUNNER_VERSION}.jar"

if [ ! -f "$STUB_RUNNER_JAR" ]; then
  echo "Baixando Stub Runner Boot ${STUB_RUNNER_VERSION}..."
  curl -fSL -o "$STUB_RUNNER_JAR" \
    "https://repo1.maven.org/maven2/org/springframework/cloud/spring-cloud-contract-stub-runner-boot/${STUB_RUNNER_VERSION}/spring-cloud-contract-stub-runner-boot-${STUB_RUNNER_VERSION}.jar"
fi

java -jar "$STUB_RUNNER_JAR" \
  --stubrunner.ids=com.eskcti.algashop:product-catalog:0.0.1-SNAPSHOT:8083 \
  --stubrunner.stubs-mode=LOCAL
