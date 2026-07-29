# Set Abyss specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Abyss stuff
$(call inherit-product, vendor/abyss/config/common_mini_phone.mk)
