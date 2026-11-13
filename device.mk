DEVICE_PATH := device/lava/lxx521

# API
PRODUCT_SHIPPING_API_LEVEL := 34
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
# LXX521 TrustKernel recovery integration
#
# ELF executables and shared libraries, plus the T6 payloads, are declared as
# BUILD_PREBUILT modules in prebuilt/recovery/Android.mk. Their LOCAL_MODULE_PATH
# installs them directly under $(TARGET_RECOVERY_ROOT_OUT)/vendor/...
# Do NOT add ELF files to PRODUCT_COPY_FILES: check-non-elf rejects that.
# -----------------------------------------------------------------------------
LXX521_RECOVERY_ROOT := $(TARGET_COPY_OUT_RECOVERY)/root
LXX521_TK_VENDOR := $(DEVICE_PATH)/prebuilt/recovery/vendor

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/init.recovery.trustkernel.rc:$(LXX521_RECOVERY_ROOT)/init.recovery.trustkernel.rc \
    $(LXX521_TK_VENDOR)/etc/vintf/manifest/android.hardware.security.keymint@3.0-service.trustkernel.xml:$(LXX521_RECOVERY_ROOT)/vendor/etc/vintf/manifest/android.hardware.security.keymint@3.0-service.trustkernel.xml \
    $(LXX521_TK_VENDOR)/etc/vintf/manifest/android.hardware.gatekeeper-service.trustkernel.xml:$(LXX521_RECOVERY_ROOT)/vendor/etc/vintf/manifest/android.hardware.gatekeeper-service.trustkernel.xml

PRODUCT_PACKAGES += \
    lxx521_teed \
    lxx521_keymint_service \
    lxx521_gatekeeper_service \
    lxx521_libteec \
    lxx521_libteecommon \
    lxx521_libkeymint \
    lxx521_libkeymint_tool \
    lxx521_lib_android_keymaster_keymint_utils \
    lxx521_libcppbor_external \
    lxx521_libgatekeeper \
    lxx521_keymint_v3_ndk \
    lxx521_rkp_v3_ndk \
    lxx521_sharedsecret_v1_ndk \
    lxx521_secureclock_v1_ndk \
    lxx521_gatekeeper_v1_ndk \
    lxx521_ta_2707 \
    lxx521_ta_9ef77781 \
    lxx521_ta_6f4d215d \
    lxx521_ta_e97c270e \
    lxx521_ta_1002 \
    lxx521_ta_02662e8e \
    lxx521_ta_b46325e6 \
    lxx521_ta_1005 \
    lxx521_ta_cfg \
    lxx521_ta_data_77766b625f6372797074 \
    lxx521_ta_data_6b6579626f785f6372797074

# Platform libraries required by the prebuilt AIDL HAL executables.
# Use libraries built by this recovery source; do NOT copy Android 15 system
# versions of libbinder_ndk/libbase/libcutils over the recovery's own libraries.
TARGET_RECOVERY_DEVICE_MODULES += \
    libbinder_ndk \
    libbinder \
    libutils \
    libvndksupport \
    libhidlbase \
    libhardware

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder_ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libvndksupport.so \
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
