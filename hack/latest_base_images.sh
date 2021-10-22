#!/usr/bin/env bash

set -eu -o pipefail

TARGET=make/base_images.mk

STATIC_BASE=gcr.io/distroless/static
DYNAMIC_BASE=gcr.io/distroless/base

mkdir -p make

echo "# autogenerated by hack/latest_base_images.sh" > $TARGET

echo "STATIC_BASE_IMAGE_amd64 := $STATIC_BASE@$(crane digest $STATIC_BASE:latest-amd64)" >> $TARGET
echo "STATIC_BASE_IMAGE_arm64 := $STATIC_BASE@$(crane digest $STATIC_BASE:latest-arm64)" >> $TARGET
echo "STATIC_BASE_IMAGE_s390x := $STATIC_BASE@$(crane digest $STATIC_BASE:latest-s390x)" >> $TARGET
echo "STATIC_BASE_IMAGE_arm   := $STATIC_BASE@$(crane digest $STATIC_BASE:latest-arm)" >> $TARGET
echo "STATIC_BASE_IMAGE_ppc64le := $STATIC_BASE@$(crane digest $STATIC_BASE:latest-ppc64le)" >> $TARGET

echo "DYNAMIC_BASE_IMAGE_amd64 := $DYNAMIC_BASE@$(crane digest $DYNAMIC_BASE:latest-amd64)" >> $TARGET
echo "DYNAMIC_BASE_IMAGE_arm64 := $DYNAMIC_BASE@$(crane digest $DYNAMIC_BASE:latest-arm64)" >> $TARGET
echo "DYNAMIC_BASE_IMAGE_s390x := $DYNAMIC_BASE@$(crane digest $DYNAMIC_BASE:latest-s390x)" >> $TARGET
echo "DYNAMIC_BASE_IMAGE_arm   := $DYNAMIC_BASE@$(crane digest $DYNAMIC_BASE:latest-arm)" >> $TARGET
echo "DYNAMIC_BASE_IMAGE_ppc64le := $DYNAMIC_BASE@$(crane digest $DYNAMIC_BASE:latest-ppc64le)" >> $TARGET
