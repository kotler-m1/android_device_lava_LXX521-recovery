#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lava/lxx521[cite: 4]
KERNEL_PATH := device/lava/lxx521/prebuilt[cite: 4]

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true[cite: 4]

# A/B
AB_OTA_UPDATER := true[cite: 4]
AB_OTA_PARTITIONS += \
    system_dlkm \
    vendor \
    odm \
    system \
    boot \
    vbmeta_system \
    odm_dlkm \
    product \
    vbmeta_vendor \
    vendor_dlkm \
    system_ext[cite: 4]

# Architecture
TARGET_ARCH := arm64[cite: 4]
TARGET_ARCH_VARIANT := armv8-a[cite: 4]
TARGET_CPU_ABI := arm64-v8a[cite: 4]
TARGET_CPU_ABI2 :=[cite: 4]
TARGET_CPU_VARIANT := generic[cite: 4]
TARGET_CPU_VARIANT_RUNTIME := cortex-a55[cite: 4]

TARGET_2ND_ARCH := arm[cite: 4]
TARGET_2ND_ARCH_VARIANT := armv7-a-neon[cite: 4]
TARGET_2ND_CPU_ABI := armeabi-v7a[cite: 4]
TARGET_2ND_CPU_ABI2 := armeabi[cite: 4]
TARGET_2ND_CPU_VARIANT := generic[cite: 4]
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55[cite: 4]

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true[cite: 4]

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lxx521[cite: 4]
TARGET_NO_BOOTLOADER := true[cite: 4]

# Resolution
TARGET_SCREEN_HEIGHT := 2400[cite: 4]
TARGET_SCREEN_WIDTH := 1080[cite: 4]

# Display
TARGET_SCREEN_DENSITY := 480[cite: 4]

# Kernel
TARGET_KERNEL_ARCH := arm64[cite: 4]
BOARD_RAMDISK_USE_LZ4 := true[cite: 4]
TARGET_KERNEL_HEADER_ARCH := arm64[cite: 4]
BOARD_BOOT_HEADER_VERSION := 4[cite: 4]
BOARD_INIT_BOOT_HEADER_VERSION := 4[cite: 4]
BOARD_INCLUDE_DTB_IN_BOOTIMG := true[cite: 4]
BOARD_KERNEL_SEPARATED_DTBO := true[cite: 4]
BOARD_KERNEL_IMAGE_NAME := Image[cite: 4]
BOARD_USES_GENERIC_KERNEL_IMAGE := true[cite: 4]
BOARD_KERNEL_BASE := 0x3FFF8000[cite: 4]
BOARD_PAGE_SIZE := 4096[cite: 4]
BOARD_KERNEL_OFFSET := 0x00008000[cite: 4]
BOARD_RAMDISK_OFFSET := 0x26F08000[cite: 4]
BOARD_TAGS_OFFSET := 0x07C88000[cite: 4]
BOARD_DTB_SIZE := 327372[cite: 4]
BOARD_DTB_OFFSET := 0x07C88000[cite: 4]
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive[cite: 4]

BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"[cite: 4]
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""[cite: 4]
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)[cite: 4]
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)[cite: 4]
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)[cite: 4]
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)[cite: 4]
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)[cite: 4]

TARGET_NO_KERNEL_OVERRIDE := true[cite: 4]
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel[cite: 4]
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img[cite: 4]
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb[cite: 4]

# Stock vendor ramdisk
BOARD_VENDOR_RAMDISK_FRAGMENTS := stock[cite: 4]
BOARD_VENDOR_RAMDISK_FRAGMENT.stock.PREBUILT := $(DEVICE_PATH)/prebuilt/stock_ramdisk.cpio.lz4[cite: 4]
BOARD_VENDOR_RAMDISK_FRAGMENT.stock.MKBOOTIMG_ARGS := --ramdisk_type PLATFORM[cite: 4]

# vendor_dlkm modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(KERNEL_PATH)/modules/vendor_dlkm/modules.load))[cite: 4]

BOARD_VENDOR_KERNEL_MODULES := \
    $(sort $(addprefix $(KERNEL_PATH)/modules/vendor_dlkm/, \
    $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD))))[cite: 4]

# Vendor boot modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD :=[cite: 4]
BOARD_VENDOR_RAMDISK_KERNEL_MODULES :=[cite: 4]

# Recovery-only modules
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat \
    $(KERNEL_PATH)/modules/modules.load.recovery))[cite: 4]

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES := \
    $(addprefix $(KERNEL_PATH)/modules/vendor_boot/, \
    $(notdir $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)))[cite: 4]

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144[cite: 4]
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864[cite: 4]
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864[cite: 4]
BOARD_HAS_LARGE_FILESYSTEM := true[cite: 4]
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4[cite: 4]
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs[cite: 4]
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4[cite: 4]
TARGET_COPY_OUT_VENDOR := vendor[cite: 4]
BOARD_SUPER_PARTITION_SIZE := 4844463520[cite: 4]
BOARD_SUPER_PARTITION_GROUPS := lava_dynamic_partitions[cite: 4]
BOARD_LAVA_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm vendor_dlkm odm_dlkm[cite: 4]
BOARD_LAVA_DYNAMIC_PARTITIONS_SIZE := 4844463520[cite: 4]

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop[cite: 4]

# Hardware
BOARD_USES_MTK_HARDWARE := true[cite: 4]

# Platform
TARGET_BOARD_PLATFORM := mt6878[cite: 4]

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888[cite: 4]
TARGET_USERIMAGES_USE_EXT4 := true[cite: 4]
TARGET_USERIMAGES_USE_F2FS := true[cite: 4]
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab[cite: 4]

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01[cite: 4]

# Verified Boot
BOARD_AVB_ENABLE := true[cite: 4]
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3[cite: 4]

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31[cite: 4]
PLATFORM_VERSION := 16.1.0[cite: 4]

# Standard AOSP Recovery & Partition Settings
BOARD_USES_RECOVERY_AS_BOOT := false[cite: 4]
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true[cite: 4]
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true[cite: 4]

# Metadata & Encryption Support (Required for Sideload / Data Access)
BOARD_USES_METADATA_PARTITION := true[cite: 4]