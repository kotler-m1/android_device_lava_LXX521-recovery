
# LXX521 MT6878 TrustKernel prebuilt modules for OrangeFox/TWRP recovery.
# These are installed directly into $(TARGET_RECOVERY_ROOT_OUT)/vendor/... .
# This Make-based packaging is intentional: cc_prebuilt_* modules in this
# Android 12.1 Soong tree do not support install_in_root.

LOCAL_PATH := $(call my-dir)

# -----------------------------------------------------------------------------
# TrustKernel executables
# -----------------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_teed
LOCAL_SRC_FILES := vendor/bin/teed
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin
LOCAL_MODULE_STEM := teed
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    lxx521_libteec \
    liblog
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_keymint_service
LOCAL_SRC_FILES := vendor/bin/hw/android.hardware.security.keymint@3.0-service.trustkernel
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/hw
LOCAL_MODULE_STEM := android.hardware.security.keymint@3.0-service.trustkernel
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    android.hardware.security.keymint-V3-ndk \
    android.hardware.security.rkp-V3-ndk \
    android.hardware.security.secureclock-V1-ndk \
    android.hardware.security.sharedsecret-V1-ndk \
    libbase \
    libbinder_ndk \
    libc++ \
    lxx521_libcppbor_external \
    libcrypto \
    libcutils \
    libhardware \
    libhidlbase \
    liblog \
    lxx521_libteec
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_gatekeeper_service
LOCAL_SRC_FILES := vendor/bin/hw/android.hardware.gatekeeper-service.trustkernel
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/hw
LOCAL_MODULE_STEM := android.hardware.gatekeeper-service.trustkernel
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    android.hardware.gatekeeper-V1-ndk \
    libbase \
    libbinder_ndk \
    libc++ \
    libcutils \
    lxx521_libgatekeeper \
    liblog \
    lxx521_libteec
include $(BUILD_PREBUILT)

# -----------------------------------------------------------------------------
# TrustKernel and AIDL shared libraries (64-bit)
# -----------------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libteec
LOCAL_SRC_FILES := vendor/lib64/libteec.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libteec
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libteecommon
LOCAL_SRC_FILES := vendor/lib64/libTEECommon.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libTEECommon
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libkeymint
LOCAL_SRC_FILES := vendor/lib64/libkeymint.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libkeymint
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libkeymint_tool
LOCAL_SRC_FILES := vendor/lib64/libkeymint_tool.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libkeymint_tool
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_lib_android_keymaster_keymint_utils
LOCAL_SRC_FILES := vendor/lib64/lib_android_keymaster_keymint_utils.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := lib_android_keymaster_keymint_utils
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libcppbor_external
LOCAL_SRC_FILES := vendor/lib64/libcppbor_external.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libcppbor_external
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_libgatekeeper
LOCAL_SRC_FILES := vendor/lib64/libgatekeeper.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := libgatekeeper
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_keymint_v3_ndk
LOCAL_SRC_FILES := vendor/lib64/android.hardware.security.keymint-V3-ndk.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := android.hardware.security.keymint-V3-ndk
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_rkp_v3_ndk
LOCAL_SRC_FILES := vendor/lib64/android.hardware.security.rkp-V3-ndk.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := android.hardware.security.rkp-V3-ndk
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_sharedsecret_v1_ndk
LOCAL_SRC_FILES := vendor/lib64/android.hardware.security.sharedsecret-V1-ndk.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := android.hardware.security.sharedsecret-V1-ndk
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_secureclock_v1_ndk
LOCAL_SRC_FILES := vendor/lib64/android.hardware.security.secureclock-V1-ndk.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := android.hardware.security.secureclock-V1-ndk
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_gatekeeper_v1_ndk
LOCAL_SRC_FILES := vendor/lib64/android.hardware.gatekeeper-V1-ndk.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
LOCAL_MODULE_STEM := android.hardware.gatekeeper-V1-ndk
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    libbinder_ndk \
    libc++ \
    lxx521_keymint_v3_ndk
include $(BUILD_PREBUILT)

# -----------------------------------------------------------------------------
# T6 trusted application payloads (non-ELF data files)
# -----------------------------------------------------------------------------

# Preserve the complete TrustKernel T6 payload in the recovery vendor tree.

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_2707
LOCAL_SRC_FILES := vendor/app/t6/4545534d-0009-0000-0000000000002707.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 4545534d-0009-0000-0000000000002707.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_9ef77781
LOCAL_SRC_FILES := vendor/app/t6/9ef77781-7bd5-4e39-965f20f6f211f400.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 9ef77781-7bd5-4e39-965f20f6f211f400.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_6f4d215d
LOCAL_SRC_FILES := vendor/app/t6/6f4d215d-5808-a000-ce96008c8378dd84.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 6f4d215d-5808-a000-ce96008c8378dd84.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_e97c270e
LOCAL_SRC_FILES := vendor/app/t6/e97c270e-a5c4-4c58-bcd3384a2fa2539e.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := e97c270e-a5c4-4c58-bcd3384a2fa2539e.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_1002
LOCAL_SRC_FILES := vendor/app/t6/4545534d-0009-0000-0000000000001002.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 4545534d-0009-0000-0000000000001002.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_02662e8e
LOCAL_SRC_FILES := vendor/app/t6/02662e8e-e126-11e5-b86d9a79f06e9478.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 02662e8e-e126-11e5-b86d9a79f06e9478.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_b46325e6
LOCAL_SRC_FILES := vendor/app/t6/b46325e6-5c90-8252-2eada8e32e5180d6.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := b46325e6-5c90-8252-2eada8e32e5180d6.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_1005
LOCAL_SRC_FILES := vendor/app/t6/4545534d-0009-0000-0000000000001005.ta
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := 4545534d-0009-0000-0000000000001005.ta
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_cfg
LOCAL_SRC_FILES := vendor/app/t6/cfg.ini
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6
LOCAL_MODULE_STEM := cfg.ini
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_data_77766b625f6372797074
LOCAL_SRC_FILES := vendor/app/t6/data/E62563B4905C52822EADA8E32E5180D6/77766b625f6372797074
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6/data/E62563B4905C52822EADA8E32E5180D6
LOCAL_MODULE_STEM := 77766B625F6372797074
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lxx521_ta_data_6b6579626f785f6372797074
LOCAL_SRC_FILES := vendor/app/t6/data/E62563B4905C52822EADA8E32E5180D6/6B6579626F785F6372797074
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/vendor/app/t6/data/E62563B4905C52822EADA8E32E5180D6
LOCAL_MODULE_STEM := 6B6579626F785F6372797074
LOCAL_MODULE_SUFFIX :=
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
