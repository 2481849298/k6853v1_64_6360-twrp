#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-produc-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)



# Enable updating of APEXes
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/updatable_apex.mk)


# Inherit from PBRP-common stuff, if building PBRP.
$(call inherit-product-if-exists, vendor/pb/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root) \
	$(LOCAL_PATH)/prebuilt/dtb:dtb.img

$(call inherit-product, device/vivo/k6853v1_64_6360/device.mk)	

PRODUCT_DEVICE := k6853v1_64_6360
PRODUCT_NAME := twrp_k6853v1_64_6360
PRODUCT_BRAND := vivo
PRODUCT_MODEL := vivo
PRODUCT_MANUFACTURER := vivo

PRODUCT_GMS_CLIENTID_BASE := android-vivo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_k6853v1_64_6360-user 10 QP1A.190711.020 compiler11122052 release-keys"

BUILD_FINGERPRINT := vivo/PD2057/PD2057:10/QP1A.190711.020/compiler11122052:user/release-keys
