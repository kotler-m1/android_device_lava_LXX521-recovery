DEVICE_PATH := device/lava/lxx521[cite: 8]

# API
PRODUCT_SHIPPING_API_LEVEL := 32[cite: 8]
PRODUCT_TARGET_VNDK_VERSION := 34[cite: 8]

# A/B
AB_OTA_UPDATER := true[cite: 8]
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vendor[cite: 8]

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    otapreopt_script \
    checkpoint_gc[cite: 8]

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true[cite: 8]

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true[cite: 8]

# Additional Target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.graphics.common@1.0 \
    libion \
    libxml2[cite: 8]

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery[cite: 8]

PRODUCT_PACKAGES_DEBUG += \
    bootctrl[cite: 8]

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true[cite: 8]

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4[cite: 8]

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service[cite: 8]

# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery[cite: 8]

# HIDL Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true[cite: 8]

# Recovery init
PRODUCT_PACKAGES += \
    init.recovery.mt6878.rc[cite: 8]

# Filesystem table
PRODUCT_PACKAGES += \
    recovery.fstab[cite: 8]

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd[cite: 8]

# Rootdir
PRODUCT_PACKAGES += \
    servicemanager.recovery.rc \
    snapuserd.rc[cite: 8]