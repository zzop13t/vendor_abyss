# Inherit mobile full common Abyss stuff
$(call inherit-product, vendor/abyss/config/common_mobile_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# Inherit tablet common Abyss stuff
$(call inherit-product, vendor/abyss/config/tablet.mk)

$(call inherit-product, vendor/abyss/config/telephony.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/abyss/overlay/foldable_book
