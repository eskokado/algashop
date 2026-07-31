#!/bin/bash
# Sobe o WireMock com os stubs do product-catalog (publicados no ~/.m2 via ./gradlew publishToMavenLocal)
cd "$(dirname "$0")"

java -jar stub-runner-boot-4.3.0.jar \
  --stubrunner.ids=com.eskcti.algashop:product-catalog:0.0.1-SNAPSHOT:8083 \
  --stubrunner.stubs-mode=LOCAL
