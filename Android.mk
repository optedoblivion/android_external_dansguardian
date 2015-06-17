
#TODO: Support architectures other than ARM
GNUSTL_PATH := ../../prebuilts/ndk/current/sources/cxx-stl/gnu-libstdc++/libs/armeabi-v7a/

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libgnustl_static
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_SUFFIX := .a
LOCAL_SRC_FILES := $(GNUSTL_PATH)/libgnustl_static.a
include $(LOCAL_PATH)/gnustl.mk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsupc++
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE_SUFFIX := .a
LOCAL_SRC_FILES := $(GNUSTL_PATH)/libsupc++.a
include $(LOCAL_PATH)/gnustl.mk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libgnustl_shared
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(GNUSTL_PATH)/libgnustl_shared.so
include $(LOCAL_PATH)/gnustl.mk

include $(BUILD_PREBUILT)


include $(CLEAR_VARS)

#	src/contentscanners/icapscan.cpp 
#	src/contentscanners/avastdscan.cpp 
#	src/contentscanners/kavdscan.cpp 
#	src/contentscanners/commandlinescan.cpp 
#	src/contentscanners/clamdscan.cpp 

#	src/authplugins/dnsauth.cpp
#	src/authplugins/ntlm.cpp \

LOCAL_SRC_FILES := \
	src/ContentScanner.cpp \
	src/LanguageContainer.cpp \
	src/ImageContainer.cpp \
	src/ConnectionHandler.cpp \
	src/md5.cpp \
	src/FDFuncs.cpp \
	src/SysV.cpp \
	src/BaseSocket.cpp \
	src/String.cpp \
	src/ConfigVar.cpp \
	src/HTTPHeader.cpp \
	src/downloadmanagers/fancy.cpp \
	src/downloadmanagers/trickle.cpp \
	src/downloadmanagers/default.cpp \
	src/DownloadManager.cpp \
	src/UDSocket.cpp \
	src/HTMLTemplate.cpp \
	src/FOptionContainer.cpp \
	src/OptionContainer.cpp \
	src/SocketArray.cpp \
	src/ListManager.cpp \
	src/Auth.cpp \
	src/FDTunnel.cpp \
	src/authplugins/proxy.cpp \
	src/authplugins/ip.cpp \
	src/authplugins/ident.cpp \
	src/authplugins/digest.cpp \
	src/ListContainer.cpp \
	src/NaughtyFilter.cpp \
	src/IPList.cpp \
	src/Socket.cpp \
	src/RegExp.cpp \
	src/DataBuffer.cpp \
	src/DynamicIPList.cpp \
	src/dansguardian.cpp \
	src/FatController.cpp \
	src/DynamicURLList.cpp 


#        $(LOCAL_PATH)/../iconv/include \

APP_STL := gnustl_static 

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/src \
        $(LOCAL_PATH)/../zlib 

        #bionic/libc/dns 
        #$(LOCAL_PATH)/../stlport/stlport \

CONFIG_DIR := /system/etc

LOCAL_CFLAGS += -DPKGDATADIR="\"$(CONFIG_DIR)\"" \
	-Werror=implicit \
        -g \
        -O2 \
        -frtti \
        -fexceptions \
        -fstack-protector \
        -Wno-error=sequence-point \
	-DANDROID \
        -DHAVE_CONFIG_H

LOCAL_LDLIBSS += -llog -landroid

LOCAL_MODULE := dansguardian
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES += libc libz #libiconv
#LOCAL_STATIC_LIBRARIES += gnustl_static

LOCAL_NDK_STL_VARIANT := gnustl_static
LOCAL_SDK_VERSION := 19

-include $(LOCAL_PATH)/gnustl.mk
include $(BUILD_EXECUTABLE)

#============== Copy Resolvers File ============

#include $(CLEAR_VARS)
#LOCAL_MODULE := dnscrypt-resolvers.csv
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
#LOCAL_SRC_FILES := $(LOCAL_MODULE)
#include $(BUILD_PREBUILT)

