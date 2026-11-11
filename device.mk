DEVICE_PATH := device/lava/lxx521

# API
PRODUCT_SHIPPING_API_LEVEL := 32
PRODUCT_TARGET_VNDK_VERSION := 34

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vendor

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    otapreopt_script \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true

# Additional target libraries used by the existing recovery UI/hardware.
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.graphics.common@1.0 \
    libion \
    libxml2

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.graphics.common@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# MTK plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Recovery init
PRODUCT_PACKAGES += \
    init.recovery.mt6878.rc

# Recovery filesystem table
PRODUCT_PACKAGES += \
    recovery.fstab

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# -----------------------------------------------------------------------------
# LXX521 TrustKernel payload (staged from the stock Android 15 vendor image)
#
# Expected source layout:
#   $(DEVICE_PATH)/prebuilt/recovery/vendor/...
#
# These are copied into the recovery ramdisk's /vendor tree. This only stages
# the payload; a recovery-specific init script and dependency compatibility
# checks are still required before the services can be started safely.
# -----------------------------------------------------------------------------
LXX521_RECOVERY_ROOT := $(TARGET_COPY_OUT_RECOVERY)/root
LXX521_TK_VENDOR := $(DEVICE_PATH)/prebuilt/recovery/vendor

PRODUCT_COPY_FILES += \
    $(LXX521_TK_VENDOR)/bin/teed:$(LXX521_RECOVERY_ROOT)/vendor/bin/teed \
    $(LXX521_TK_VENDOR)/bin/hw/android.hardware.security.keymint@3.0-service.trustkernel:$(LXX521_RECOVERY_ROOT)/vendor/bin/hw/android.hardware.security.keymint@3.0-service.trustkernel \
    $(LXX521_TK_VENDOR)/bin/hw/android.hardware.gatekeeper-service.trustkernel:$(LXX521_RECOVERY_ROOT)/vendor/bin/hw/android.hardware.gatekeeper-service.trustkernel \
    $(LXX521_TK_VENDOR)/lib64/libteec.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libteec.so \
    $(LXX521_TK_VENDOR)/lib64/libTEECommon.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libTEECommon.so \
    $(LXX521_TK_VENDOR)/lib64/libkeymint.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libkeymint.so \
    $(LXX521_TK_VENDOR)/lib64/libkeymint_tool.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libkeymint_tool.so \
    $(LXX521_TK_VENDOR)/lib64/lib_android_keymaster_keymint_utils.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/lib_android_keymaster_keymint_utils.so \
    $(LXX521_TK_VENDOR)/lib64/libcppbor_external.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libcppbor_external.so \
    $(LXX521_TK_VENDOR)/lib64/libgatekeeper.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/libgatekeeper.so \
    $(LXX521_TK_VENDOR)/lib64/android.hardware.security.keymint-V3-ndk.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/android.hardware.security.keymint-V3-ndk.so \
    $(LXX521_TK_VENDOR)/lib64/android.hardware.security.rkp-V3-ndk.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/android.hardware.security.rkp-V3-ndk.so \
    $(LXX521_TK_VENDOR)/lib64/android.hardware.security.sharedsecret-V1-ndk.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/android.hardware.security.sharedsecret-V1-ndk.so \
    $(LXX521_TK_VENDOR)/lib64/android.hardware.security.secureclock-V1-ndk.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/android.hardware.security.secureclock-V1-ndk.so \
    $(LXX521_TK_VENDOR)/lib64/android.hardware.gatekeeper-V1-ndk.so:$(LXX521_RECOVERY_ROOT)/vendor/lib64/android.hardware.gatekeeper-V1-ndk.so \
    $(LXX521_TK_VENDOR)/etc/vintf/manifest/android.hardware.security.keymint@3.0-service.trustkernel.xml:$(LXX521_RECOVERY_ROOT)/vendor/etc/vintf/manifest/android.hardware.security.keymint@3.0-service.trustkernel.xml \
    $(LXX521_TK_VENDOR)/etc/vintf/manifest/android.hardware.gatekeeper-service.trustkernel.xml:$(LXX521_RECOVERY_ROOT)/vendor/etc/vintf/manifest/android.hardware.gatekeeper-service.trustkernel.xml

# Preserve the complete TrustKernel TA tree, including its data/ directory.
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LXX521_TK_VENDOR)/app/t6,$(LXX521_RECOVERY_ROOT)/vendor/app/t6)

# Platform libraries required by the prebuilt AIDL HAL executables.
# Use libraries built by this recovery source; do NOT copy Android 15 system
# versions of libbinder_ndk/libbase/libcutils over the recovery's own libraries.
TARGET_RECOVERY_DEVICE_MODULES += \
    libbinder_ndk \
    libhidlbase \
    libhardware

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder_ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlbase.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhardware.so

# Do not package the generic HIDL Gatekeeper service or legacy Keymaster 4.x
# device libraries here. LXX521 stock firmware uses TrustKernel KeyMint AIDL
# 3.0 and Gatekeeper AIDL 1.0; the recovery-side service integration is
# supplied by the TrustKernel payload above and its recovery init script.

# Rootdir
PRODUCT_PACKAGES += \
    servicemanager.recovery.rc \
    snapuserd.rc
