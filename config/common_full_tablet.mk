# Inherit mobile full common Abyss stuff
$(call inherit-product, vendor/abyss/config/common_mobile_full.mk)

# Inherit tablet common Abyss stuff
$(call inherit-product, vendor/abyss/config/tablet.mk)

$(call inherit-product, vendor/abyss/config/telephony.mk)
