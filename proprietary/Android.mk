LOCAL_PATH := $(call my-dir)

# Stock Lollipop RIL stack (rild + libril.so from G361FXXU1APB1), which works with
# the stock libsec-ril.so and this modem firmware. libril needs libril_shim on N.
ifeq ($(TARGET_USES_STOCK_RIL),true)

include $(CLEAR_VARS)
LOCAL_MODULE := libril
LOCAL_SRC_FILES := lib/libril.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 32
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := rild
LOCAL_SRC_FILES := bin/rild
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 32
LOCAL_STRIP_MODULE := false
LOCAL_INIT_RC := etc/init/rild.rc
include $(BUILD_PREBUILT)

endif
