# Device identifier
PRODUCT_DEVICE := lxx521[cite: 3]
PRODUCT_NAME := pe_lxx521
PRODUCT_BRAND := Lava[cite: 3]
PRODUCT_MODEL := Play_ultra[cite: 3]
PRODUCT_MANUFACTURER := Lava[cite: 3]
PRODUCT_RELEASE_NAME := Lava Play Ultra 5g[cite: 3]

# Device specific configs
$(call inherit-product, device/lava/lxx521/device.mk)[cite: 3]

# Configure virtual_ab_ota.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)[cite: 3]

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)[cite: 3]

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)[cite: 3]

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)[cite: 3]

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)[cite: 3]

# FUSE passthrough
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fuse.passthrough.enable=true[cite: 3] 