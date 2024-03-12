#!/usr/bin/env bash
K8S_VERSION=1.28
#ARCH=x86_64
ARCH=aarch64

aws-vault exec cust-shared-scout-script -- cargo make -e PUBLISH_REGIONS=eu-west-2 -e BUILDSYS_VARIANT="aws-k8s-${K8S_VERSION}" -e BUILDSYS_ARCH="${ARCH}"
aws-vault exec cust-shared-scout-script -- cargo make -e PUBLISH_REGIONS=eu-west-2 -e BUILDSYS_VARIANT="aws-k8s-${K8S_VERSION}" -e BUILDSYS_ARCH="${ARCH}" ami
