TARGET := iphone:clang:7.1:8.1
ARCH := armv7 armv7s arm64
#THEOS_DEVICE_IP = 192.168.191.2
THEOS_OBJ_DIR_NAME = obj

GO_EASY_ON_ME=1
export THEOS=/var/theos
include theos/makefiles/common.mk

TWEAK_NAME = MixToolBox
MixToolBox_FILES = MixHook.xm update.m ReRAM.m
MixToolBox_FRAMEWORKS = UIKit CoreGraphics QuartzCore CoreImage

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += MixToolBoxUI
include $(THEOS_MAKE_PATH)/aggregate.mk
