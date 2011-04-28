LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sdl_fake_stdout

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../sdl-$(SDL_VERSION)/include
LOCAL_CFLAGS := 

ifeq ($(CRYSTAX_TOOLCHAIN)$(NDK_R5_TOOLCHAIN),)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../stlport/stlport
endif

LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := SDL_fake_stdout.cpp

LOCAL_SHARED_LIBRARIES := 
LOCAL_LDLIBS := -llog

ifneq ($(CRYSTAX_R5B3_TOOLCHAIN),)
LOCAL_C_INCLUDES += $(NDK_PATH)/sources/wchar-support/include
LOCAL_LDFLAGS += sources/wchar-support/libs/armeabi/libwchar_static.a
endif

include $(BUILD_STATIC_LIBRARY)
