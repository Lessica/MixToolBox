ARCHS = armv7 arm64
TARGET = iPhone:clang:7.1:8.1
CFLAGS = -fobjc-arc
LDFLAGS = -F$(THEOS)/frameworks

export THEOS=/var/theos
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@.mm $(shell find $(THEOS)/include/SettingsKit -name '*.m')
@@PROJECTNAME@@_INSTALL_PATH = /Library/PreferenceBundles
@@PROJECTNAME@@_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics
@@PROJECTNAME@@_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.png $(THEOS_STAGING_DIR)/Library/PreferenceBundles/@@PROJECTNAME@@.bundle/$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/@@PROJECTNAME@@.plist$(ECHO_END)
