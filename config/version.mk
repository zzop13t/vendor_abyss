PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 2

ifeq ($(ABYSS_VERSION_APPEND_TIME_OF_DAY),true)
    ABYSS_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    ABYSS_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set ABYSS_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef ABYSS_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "ABYSS_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^ABYSS_||g')
        ABYSS_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(ABYSS_BUILDTYPE)),)
    ABYSS_BUILDTYPE := abyss
    ABYSS_EXTRAVERSION :=
endif

ifeq ($(ABYSS_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        ABYSS_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ABYSS_VERSION_SUFFIX := $(ABYSS_BUILD_DATE)-$(ABYSS_BUILDTYPE)$(ABYSS_EXTRAVERSION)-$(ABYSS_BUILD)

# Internal version
ABYSS_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ABYSS_VERSION_SUFFIX)

# Display version
ABYSS_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(ABYSS_VERSION_SUFFIX)

# Abyss version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.abyss.version=$(ABYSS_VERSION) \
    ro.abyss.display.version=$(ABYSS_DISPLAY_VERSION) \
    ro.abyss.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.abyss.releasetype=$(ABYSS_BUILDTYPE)
