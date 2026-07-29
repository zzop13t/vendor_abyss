# Inherit common Abyss stuff
$(call inherit-product, vendor/abyss/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include GoogleSansFlex font
ifeq ($(ABYSS_BUILD),true)
$(call inherit-product-if-exists, external/google-fonts/google-sans-flex/fonts.mk)
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Fonts
ifeq ($(ABYSS_BUILD),true)
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    FontGoogleSansFlexOverlay
endif

# Include Abyss LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/abyss/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/abyss/overlay/dictionaries
