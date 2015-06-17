LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	src/ContentScanner.cpp \
	src/LanguageContainer.cpp \
	src/ImageContainer.cpp \
	src/contentscanners/icapscan.cpp \
	src/contentscanners/commandlinescan.cpp \
	src/contentscanners/kavdscan.cpp \
	src/ConnectionHandler.cpp \
	src/md5.cpp \
	src/dansguardian.cpp \
	src/FDFuncs.cpp \
	src/SysV.cpp \
	src/BaseSocket.cpp \
	src/String.cpp \
	src/ConfigVar.cpp \
	src/HTTPHeader.cpp \
	src/downloadmanagers/trickle.cpp \
	src/downloadmanagers/default.cpp \
	src/downloadmanagers/fancy.cpp \
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
	src/authplugins/ntlm.cpp \
	src/authplugins/ident.cpp \
	src/authplugins/digest.cpp \
	src/ListContainer.cpp \
	src/NaughtyFilter.cpp \
	src/IPList.cpp \
	src/Socket.cpp \
	src/RegExp.cpp \
	src/DataBuffer.cpp \
	src/DynamicIPList.cpp \
	src/FatController.cpp \
	src/DynamicURLList.cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/src \
        $(LOCAL_PATH)/../stlport/stlport \
        $(LOCAL_PATH)/../zlib \
        $(LOCAL_PATH)/../iconv/include \
        bionic \
        bionic/libc/include 

CONFIG_DIR := /system/etc

LOCAL_CFLAGS += -DPKGDATADIR="\"$(CONFIG_DIR)\"" \
	-Werror=implicit \
	-DANDROID \
        -DHAVE_CONFIG_H

LOCAL_MODULE := dansguardian
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES += libc libz libiconv
LOCAL_STATIC_LIBRARIES += libstlport_static

include $(BUILD_EXECUTABLE)

#============== Copy Resolvers File ============

#include $(CLEAR_VARS)
#LOCAL_MODULE := dnscrypt-resolvers.csv
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
#LOCAL_SRC_FILES := $(LOCAL_MODULE)
#include $(BUILD_PREBUILT)

