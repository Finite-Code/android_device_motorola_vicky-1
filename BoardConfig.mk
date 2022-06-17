#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/vicky
KERNEL_PATH := device/motorola/vicky-kernel

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Boot Image
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x40000000
BOARD_KERNEL_PAGESIZE := 0x00001000
BOARD_TAGS_OFFSET := 0x47c80000
BOARD_RAMDISK_OFFSET := 0x66f00000

BOARD_KERNEL_CMDLINE += \
    bootopt=64S3,32N2,64N2 \
    androidboot.bootdevice=11270000.ufshci \
    androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS += \
    --dtb_offset $(BOARD_TAGS_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET)

BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image.gz

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := device/motorola/vicky-kernel/kernel-headers

LOCAL_KERNEL := $(KERNEL_PATH)/$(BOARD_KERNEL_IMAGE_NAME)
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)
BOARD_MKBOOTIMG_ARGS += --dtb $(BOARD_PREBUILT_DTBIMAGE_DIR)/dtb.img
BOARD_USES_GENERIC_KERNEL_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := vicky
TARGET_NO_BOOTLOADER := true

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Platform
TARGET_BOARD_PLATFORM := mt6789
BOARD_HAS_MTK_HARDWARE := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.mt6789
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := "STA"
WIFI_DRIVER_FW_PATH_AP := "AP"
WIFI_DRIVER_FW_PATH_P2P := "P2P"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := "1"
WIFI_DRIVER_STATE_OFF := "0"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Inherit the proprietary files
include vendor/motorola/vicky/BoardConfigVendor.mk
