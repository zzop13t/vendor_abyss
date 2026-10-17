# SPDX-FileCopyrightText: 2017-2024 The AbyssOS Project
# SPDX-License-Identifier: Apache-2.0

# build-manifest.xml
BUILD_BROKEN_SRC_DIR_RW_ALLOWLIST := $(abspath .repo/manifests.git)

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

include vendor/abyss/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/abyss/config/BoardConfigSoong.mk
