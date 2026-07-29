# Inherit mobile mini common Abyss stuff
$(call inherit-product, vendor/abyss/config/common_mobile_mini.mk)

# Inherit tablet common Abyss stuff
$(call inherit-product, vendor/abyss/config/tablet.mk)

$(call inherit-product, vendor/abyss/config/telephony.mk)
