LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),lxx521)
include $(LOCAL_PATH)/prebuilt/recovery/Android.mk
endif