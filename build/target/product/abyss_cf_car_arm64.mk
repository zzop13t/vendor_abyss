# SPDX-FileCopyrightText: 2024 The AbyssOS Project
# SPDX-License-Identifier: Apache-2.0

$(call inherit-product, device/google/cuttlefish/vsoc_arm64_only/auto/aosp_cf.mk)

include vendor/abyss/build/target/product/abyss_generic_car_target.mk

TARGET_DISABLE_EPPE := true
TARGET_NO_KERNEL_OVERRIDE := true

# Enable mainline checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

# Overrides
PRODUCT_NAME := abyss_cf_car_arm64
PRODUCT_MODEL := Abyss Cuttlefish car built for arm64
