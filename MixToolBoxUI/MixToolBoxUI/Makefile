ARCHS = armv7 arm64

TARGET = iphone:clang:7.1:8.1

CFLAGS = -fobjc-arc

#LDFLAGS = -F$(THEOS)/frameworks

THEOS_OBJ_DIR_NAME = obj



GO_EASY_ON_ME = 1

export THEOS=/var/theos

include $(THEOS)/makefiles/common.mk



BUNDLE_NAME = MixToolBoxUI

MixToolBoxUI_FILES = MixToolBoxUI.mm MixCC.mm MixCCTitleCell.mm MixNC.mm MixNCTitleCell.mm MixLockScreen.mm MixLSTitleCell.mm MixSBTitleCell.mm MixSpringBoard.mm MixStatusBar.mm MixTeamMembers.mm MixStatusBarTitleCell.mm MixMemberTitleCell.mm $(shell find $(THEOS)/include/SettingsKit -name '*.m')

MixToolBoxUI_INSTALL_PATH = /Library/PreferenceBundles

MixToolBoxUI_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics

MixToolBoxUI_PRIVATE_FRAMEWORKS = Preferences



include $(THEOS_MAKE_PATH)/bundle.mk



internal-stage::

	$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.png $(THEOS_STAGING_DIR)/Library/PreferenceBundles/MixToolBoxUI.bundle/$(ECHO_END)

	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)

	$(ECHO_NOTHING)cp Package/Library/PreferenceLoader/Preferences/MixToolBoxUI.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MixToolBoxUI.plist$(ECHO_END)

