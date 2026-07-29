# Inherit common Abyss stuff
$(call inherit-product, vendor/abyss/config/common.mk)

# Inherit Abyss car device tree
$(call inherit-product, device/abyss/car/abyss_car.mk)
