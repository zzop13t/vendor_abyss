# Inherit common Abyss stuff
$(call inherit-product, vendor/abyss/config/common.mk)

# Include AOSP audio files
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioTv.mk)

# Inherit Abyss atv device tree
$(call inherit-product, device/abyss/atv/abyss_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Abyss packages
PRODUCT_PACKAGES += \
    Catapult \
    AbyssCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/abyss/overlay/tv
