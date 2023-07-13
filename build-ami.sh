#!/usr/bin/env bash
K8S_VERSION=1.26
ARCH=x86_64
#ARCH=arm64

aws-vault exec syn-shared-scout-script -- cargo make -e PUBLISH_REGIONS=eu-west-2 -e BUILDSYS_VARIANT="aws-k8s-${K8S_VERSION}" -e BUILDSYS_ARCH="${ARCH}"
#aws-vault exec syn-shared-scout-script -- cargo make -e PUBLISH_REGIONS=eu-west-2 -e BUILDSYS_VARIANT="aws-k8s-${K8S_VERSION}" -e BUILDSYS_ARCH="${ARCH}"
