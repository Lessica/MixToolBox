#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixHook.xm"
#import "define.h"
#import "MixStore.h"
#import "ReRAM.h"
#import "update.h"
#import "LSStatusBarItem.h"

#import <net/if.h>
#import <ifaddrs.h>
#import <mach/task.h>
#import <mach/mach.h>
#import <arpa/inet.h>
#import <sys/types.h>
#import <substrate.h>
#import <sys/sysctl.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <mach/host_info.h>
#import <mach/mach_host.h>
#import <mach/task_info.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


MBOOL(enabled, NO);
MBOOL(removeCC, NO);
MBOOL(noFirstSlideCC, NO);
MBOOL(ccOldBound, NO);
MBOOL(enabledCCScale, NO);
MBOOL(hideCCRules, NO);
MBOOL(fixLockShowCC, NO);
MBOOL(hideSwitching, NO);
MBOOL(hideBrightness, NO);
MBOOL(hideMedia, NO);
MBOOL(hideAirad, NO);
MBOOL(hideQuickLaunch, NO);
MBOOL(hideCCBlur, NO);
MBOOL(hideCCBackground, NO);
static double scale = 0.0;


MBOOL(showMiniTime, NO);
MBOOL(hideText, NO);
MBOOL(showImmediately, NO);
MBOOL(hideTopGrabber, NO);
MBOOL(hideBottomGrabber, NO);
MBOOL(hideChargingText, NO);

MBOOL(showStatusBarTime, NO);
MBOOL(sameStatusBar, NO);
MBOOL(hideCameraGrabber, NO);
static NSString *slideText;
static UIColor *timeColors;


MBOOL(removeNotify, NO);
MBOOL(noFirstSlideNotify, NO);
MBOOL(hideTodayDate, NO);
MBOOL(hideEditRule, NO);
MBOOL(hideEditButton, NO);
MBOOL(hideWidgetNew, NO);
MBOOL(hideTodayWeatherText, NO);
MBOOL(hideLines, NO);
MBOOL(hideTodayHeaders, NO);
MBOOL(hideNotifyHeaders, NO);
MBOOL(hideNCBackground, NO);
MBOOL(hideStatus, NO);
MBOOL(hideFootRule, NO);
MBOOL(hideTodayTabs, NO);
MBOOL(hideNotify, NO);
MBOOL(hideNotifyText, NO);
MBOOL(hideNotifyBanners, NO);
MBOOL(hideNotifyLines, NO);
MBOOL(hideToday, NO);
MBOOL(hideTodayFootText, NO);


MBOOL(noFolderBackground, NO);
MBOOL(hideNews, NO);
MBOOL(noClockAnimate, NO);
MBOOL(rmSearch, NO);
MBOOL(disVoice, NO);
MBOOL(SBHideIndicator, NO);
MBOOL(rmShadow, NO);
MBOOL(rmYellowDot, NO);
MBOOL(rmBlueDot, NO);
MBOOL(HideDockBackgrouond, NO);
MBOOL(HideAppSwitcherBackground, NO);
MBOOL(rmIconJitter, NO);
MBOOL(rmSpotlightBlur, NO);
MBOOL(rmParallax, NO);
MBOOL(rmWallpaperZoom, NO);
MBOOL(AllTransparent, NO);
MBOOL(AllReplaceBlur, NO);
MBOOL(AllReplaceBlur2, NO);
MBOOL(AllBlurGlass, NO);
MBOOL(rmBadgeBackground, NO);
MBOOL(HideBadge, NO);
static BOOL activating = NO;


MBOOL(MixRAM, NO);
MBOOL(MixIP, NO);
MBOOL(MixHideTime, NO);
MBOOL(MixHideNotDisturb, NO);
MBOOL(MixHideAirplane, NO);
MBOOL(MixHideSignal, NO);
MBOOL(MixHideCarrier, NO);
MBOOL(MixHideData, NO);
MBOOL(MixHideBattery, NO);

MBOOL(MixShowBP, NO);
MBOOL(MixMinVol, NO);
MBOOL(MixHideAlarm, NO);
MBOOL(MixHideGeoItem, NO);
MBOOL(MixHideRotation, NO);
MBOOL(MixHideDataSpinner, NO);
TEXT(timeFormat);
TEXT(customSignal);
static NSString *address;


static void tryActivate() {
    if (!activating && ![[MixStore sharedInstance] fuckYourMother]) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            activating = YES;
            [[MixStore sharedInstance] kissYourAsshole];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[MixStore sharedInstance] showAlert];
                activating = NO;
            });
        });
    }
}

static void loadPrefs() {
    MAKEPREFS(prefsPath);
    if (prefs) {
        SETBOOL(enabled, "enabled");
        
        
        SETBOOL(removeCC, "removeCC");
        SETBOOL(noFirstSlideCC, "noFirstSlideCC");
        SETBOOL(ccOldBound, "ccOldBound");
        SETBOOL(enabledCCScale, "enabledCCScale");
        SETBOOL(hideCCRules, "hideCCRules");
        SETBOOL(fixLockShowCC, "fixLockShowCC");
        SETBOOL(hideSwitching, "hideSwitching");
        SETBOOL(hideBrightness, "hideBrightness");
        SETBOOL(hideMedia, "hideMedia");
        SETBOOL(hideAirad, "hideAirad");
        SETBOOL(hideQuickLaunch, "hideQuickLaunch");
        SETBOOL(hideCCBlur, "hideCCBlur");
        SETBOOL(hideCCBackground, "hideCCBackground");
        SETDOUBLE(scale, "scale");
        
        
        SETBOOL(showMiniTime, "showMiniTime");
        SETBOOL(hideText, "hideText");
        SETBOOL(hideTopGrabber, "hideTopGrabber");
        SETBOOL(hideBottomGrabber, "hideBottomGrabber");
        SETBOOL(showImmediately, "showImmediately");
        SETBOOL(showStatusBarTime, "showStatusBarTime");
        SETBOOL(hideCameraGrabber, "hideCameraGrabber");
        SETTEXT(slideText, "slideText");
        SETBOOL(sameStatusBar, "sameStatusBar");
        
        
        SETBOOL(removeNotify, "removeNotify");
        SETBOOL(noFirstSlideNotify, "noFirstSlideNotify");
        SETBOOL(hideEditRule, "hideEditRule");
        SETBOOL(hideEditButton, "hideEditButton");
        SETBOOL(hideWidgetNew, "hideWidgetNew");
        SETBOOL(hideTodayWeatherText, "hideTodayWeatherText");
        SETBOOL(hideLines, "hideLines");
        SETBOOL(hideTodayHeaders, "hideTodayHeaders");
        SETBOOL(hideNotifyHeaders, "hideNotifyHeaders");
        SETBOOL(hideStatus, "hideStatus");
        SETBOOL(hideToday, "hideToday");
        SETBOOL(hideTodayFootText, "hideTodayFootText");
        SETBOOL(hideFootRule, "hideFootRule");
        SETBOOL(hideTodayTabs, "hideTodayTabs");
        SETBOOL(hideNotify, "hideNotify");
        SETBOOL(hideNotifyText, "hideNotifyText");
        SETBOOL(hideNotifyBanners, "hideNotifyBanners");
        SETBOOL(hideNotifyLines, "hideNotifyLines");
        
        
        SETBOOL(noFolderBackground, "noFolderBackground");
        SETBOOL(hideNews, "hideNews");
        SETBOOL(noClockAnimate, "noClockAnimate");
        SETBOOL(rmSearch, "rmSearch");
        SETBOOL(disVoice, "disVoice");
        SETBOOL(SBHideIndicator, "SBHideIndicator");
        SETBOOL(rmShadow, "rmShadow");
        SETBOOL(rmYellowDot, "rmYellowDot");
        SETBOOL(rmBlueDot, "rmBlueDot");
        SETBOOL(HideDockBackgrouond, "HideDockBackgrouond");
        SETBOOL(HideAppSwitcherBackground, "HideAppSwitcherBackground");
        SETBOOL(rmIconJitter, "rmIconJitter");
        SETBOOL(rmSpotlightBlur, "rmSpotlightBlur");
        SETBOOL(rmParallax, "rmParallax");
        SETBOOL(rmWallpaperZoom, "rmWallpaperZoom");
        SETBOOL(AllTransparent, "AllTransparent");
        SETBOOL(AllReplaceBlur, "AllReplaceBlur");
        SETBOOL(AllReplaceBlur2, "AllReplaceBlur2");
        SETBOOL(AllBlurGlass, "AllBlurGlass");
        SETBOOL(rmBadgeBackground, "rmBadgeBackground");
        SETBOOL(HideBadge, "HideBadge");
        
        
        SETBOOL(MixRAM, "MixRAM");
        SETBOOL(MixIP, "MixIP");
        SETBOOL(MixHideTime, "MixHideTime");
        SETBOOL(MixHideNotDisturb, "MixHideNotDisturb");
        SETBOOL(MixHideAirplane, "MixHideAirplane");
        SETBOOL(MixHideSignal, "MixHideSignal");
        SETBOOL(MixHideCarrier, "MixHideCarrier");
        SETBOOL(MixHideData, "MixHideData");
        SETBOOL(MixHideBattery, "MixHideBattery");
        SETBOOL(MixShowBP, "MixShowBP");
        SETBOOL(MixHideAlarm, "MixHideAlarm");
        SETBOOL(MixHideGeoItem, "MixHideGeoItem");
        SETBOOL(MixHideRotation, "MixHideRotation");
        SETBOOL(MixMinVol, "MixMinVol");
        SETBOOL(MixHideDataSpinner, "MixHideDataSpinner");
        
        SETTEXT(timeFormat, "timeFormat");
        SETTEXT(customSignal, "customSignal");
    }
    [timeFormat retain];
    [customSignal retain];
    [slideText retain];
    [prefs release];
}

#pragma mark - Mix Control Center

@interface SBUIController : UIViewController
-(void)handleShowNotificationsSystemGesture:(id)gesture;
-(void)handleShowControlCenterSystemGesture:(id)gesture;
-(BOOL)shouldShowNotificationCenterTabControlOnFirstSwipe;
-(BOOL)shouldShowControlCenterTabControlOnFirstSwipe;
@end

@interface SBControlCenterController : UIViewController
-(void)_beginPresentation;
-(void)cancelTransition;
-(BOOL)isUILocked;
@end

@interface SBCCSettingsSectionController : UIViewController
-(BOOL)enabledForOrientation:(int)orientation;
-(CGSize)contentSizeForOrientation:(int)orientation;
@end

@interface SBCCBrightnessSectionController : UIViewController
-(BOOL)enabledForOrientation:(int)orientation;
-(CGSize)contentSizeForOrientation:(int)orientation;
-(void)viewDidLayoutSubviews;
-(void)_sliderDidBeginTracking:(id)_slider;
-(void)_sliderDidEndTracking:(id)_slider;
-(bool)_shouldDarkenBackground;
@end

@interface SBControlCenterKnockoutView : UIViewController
-(void)setHidden:(BOOL)s;
@end

@interface SBCCMediaControlsSectionController : UIViewController
-(BOOL)enabledForOrientation:(int)orientation;
-(CGSize)contentSizeForOrientation:(int)orientation;
@end

@interface SBCCAirStuffSectionController : UIViewController
@property(assign, nonatomic) BOOL airDropEnabled;
@property(assign, nonatomic) BOOL airPlayEnabled;
-(BOOL)enabledForOrientation:(int)orientation;
-(CGSize)contentSizeForOrientation:(int)orientation;
-(void)_updateAirPlayControlAsEnabled:(BOOL)enabled;
-(void)_showAirPlayView:(id)view;
@end

@interface SBCCButtonLikeSectionView : UIView
-(void)layoutSubviews;
@end

@interface SBCCQuickLaunchSectionController : UIViewController
-(BOOL)enabledForOrientation:(int)orientation;
-(CGSize)contentSizeForOrientation:(int)orientation;
@end

@interface SBControlCenterSeparatorView : UIView
+(float)defaultBreadthForOrientation:(int)orientation;
@end

@interface UIImage (SimpleCenters)
-(UIImage *)_flatImageWithColor:(UIColor *)color;
@end

@interface SBUIControlCenterButton : UIView
-(void)_setBackgroundImage:(id)bg naturalHeight:(CGFloat)height;
-(void)_updateGlyphForStateChange;
-(long long)_currentState;
-(id)_glyphImageForState:(long long)arg1;
-(CGRect)_rectForGlyph:(id)arg1 centeredInRect:(CGRect)arg2;
@end

@interface SBControlCenterGrabberView : UIView
-(void)controlCenterWillPresent;
-(id)chevronView;
-(void)presentStatusUpdate:(id)update;
@end

@interface SBControlCenterSettings : UIViewController
@property(assign) BOOL useNewBounce;
@end

@interface SBCCAirplaneModeSetting : UIViewController
-(BOOL)_toggleState;
@end

@interface SBCCWifiModeSetting : UIViewController
-(BOOL)_toggleState;
@end

@interface SBCCBluetoothModeSetting : UIViewController
-(BOOL)_toggleState;
@end

@interface SBCCDoNotDisturbModeSetting : UIViewController
-(BOOL)_toggleState;
@end

@interface SBCCOrientationLockModeSetting : UIViewController
-(BOOL)_toggleState;
@end

@interface SBControlCenterContainerView : UIView
-(void)_updateDarkeningFrame;
@end

@interface SBControlCenterContentContainerView : UIView
-(void)layoutSubviews;
@end

@interface _UIBackdropView : UIView
@end

@interface SBControlCenterContentView : UIView
@property(retain) SBControlCenterGrabberView* grabberView;
@end

@interface SBMediaController : UIViewController
+(id)sharedInstance;
@end

@interface BluetoothManager : NSObject
+(id)sharedInstance;
-(BOOL)enabled;
@end

#include <logos/logos.h>
#include <substrate.h>
@class SBTelephonyManager; @class SBCCBrightnessSectionController; @class SBVoiceControlController; @class SBNotificationSeparatorView; @class SBFolderIconBackgroundView; @class SBIconController; @class SBControlCenterKnockoutView; @class SBFLockScreenDateView; @class SBWallpaperController; @class SBClockApplicationIconImageView; @class SBFWallpaperView; @class SBCCQuickLaunchSectionController; @class SBCCMediaControlsSectionController; @class SBBannerContainerView; @class SBTodayBulletinCell; @class SBLockScreenView; @class SBTodayTableFooterView; @class SBIconBetaLabelAccessoryView; @class SpringBoard; @class SBModeViewController; @class SBIconColorSettings; @class SBIconPageIndicatorImageSetResult; @class SBDockView; @class SBCCSettingsSectionController; @class SBCCAirStuffSectionController; @class SBUIController; @class SBStatusBarStateAggregator; @class _UIBackdropViewSettings; @class SBControlCenterController; @class SBNotificationCenterHeaderView; @class SBNotificationCenterViewController; @class SBAppSwitcherHomePageCellView; @class SBControlCenterViewController; @class SBNotificationCenterController; @class SBControlCenterSettings; @class _UIGlintyStringView; @class _SBUIWidgetViewController; @class SBIconRecentlyUpdatedLabelAccessoryView; @class SBNotificationsAllModeViewController; @class SBControlCenterContentContainerView; @class SBFWallpaperSettings; @class SBSearchScrollView; @class SBNotificationCenterSeparatorView; @class SBCCButtonLikeSectionView; @class SBDarkeningImageView; @class SBSearchResultsBackdropView; @class SBTodayTableHeaderView; @class SBAppParallaxSettings; @class SBLockScreenViewController; 


#line 362 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixHook.xm"
static void (*_logos_orig$MixCC$SBUIController$handleShowControlCenterSystemGesture$)(SBUIController*, SEL, id); static void _logos_method$MixCC$SBUIController$handleShowControlCenterSystemGesture$(SBUIController*, SEL, id); static BOOL (*_logos_orig$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe)(SBUIController*, SEL); static BOOL _logos_method$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(SBUIController*, SEL); static BOOL (*_logos_orig$MixCC$SBControlCenterSettings$useNewBounce)(SBControlCenterSettings*, SEL); static BOOL _logos_method$MixCC$SBControlCenterSettings$useNewBounce(SBControlCenterSettings*, SEL); static void (*_logos_orig$MixCC$SBControlCenterViewController$loadView)(SBControlCenterViewController*, SEL); static void _logos_method$MixCC$SBControlCenterViewController$loadView(SBControlCenterViewController*, SEL); static void (*_logos_orig$MixCC$SBControlCenterKnockoutView$setHidden$)(SBControlCenterKnockoutView*, SEL, BOOL); static void _logos_method$MixCC$SBControlCenterKnockoutView$setHidden$(SBControlCenterKnockoutView*, SEL, BOOL); static bool (*_logos_orig$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground)(SBCCBrightnessSectionController*, SEL); static bool _logos_method$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground(SBCCBrightnessSectionController*, SEL); static BOOL (*_logos_orig$MixCC$SBCCBrightnessSectionController$enabledForOrientation$)(SBCCBrightnessSectionController*, SEL, int); static BOOL _logos_method$MixCC$SBCCBrightnessSectionController$enabledForOrientation$(SBCCBrightnessSectionController*, SEL, int); static CGSize (*_logos_orig$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$)(SBCCBrightnessSectionController*, SEL, int); static CGSize _logos_method$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$(SBCCBrightnessSectionController*, SEL, int); static void (*_logos_orig$MixCC$SBCCButtonLikeSectionView$layoutSubviews)(SBCCButtonLikeSectionView*, SEL); static void _logos_method$MixCC$SBCCButtonLikeSectionView$layoutSubviews(SBCCButtonLikeSectionView*, SEL); static BOOL (*_logos_orig$MixCC$SBControlCenterController$isUILocked)(SBControlCenterController*, SEL); static BOOL _logos_method$MixCC$SBControlCenterController$isUILocked(SBControlCenterController*, SEL); static BOOL (*_logos_orig$MixCC$SBCCSettingsSectionController$enabledForOrientation$)(SBCCSettingsSectionController*, SEL, int); static BOOL _logos_method$MixCC$SBCCSettingsSectionController$enabledForOrientation$(SBCCSettingsSectionController*, SEL, int); static CGSize (*_logos_orig$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$)(SBCCSettingsSectionController*, SEL, int); static CGSize _logos_method$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$(SBCCSettingsSectionController*, SEL, int); static BOOL (*_logos_orig$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$)(SBCCMediaControlsSectionController*, SEL, int); static BOOL _logos_method$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$(SBCCMediaControlsSectionController*, SEL, int); static CGSize (*_logos_orig$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$)(SBCCMediaControlsSectionController*, SEL, int); static CGSize _logos_method$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$(SBCCMediaControlsSectionController*, SEL, int); static BOOL (*_logos_orig$MixCC$SBCCAirStuffSectionController$enabledForOrientation$)(SBCCAirStuffSectionController*, SEL, int); static BOOL _logos_method$MixCC$SBCCAirStuffSectionController$enabledForOrientation$(SBCCAirStuffSectionController*, SEL, int); static CGSize (*_logos_orig$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$)(SBCCAirStuffSectionController*, SEL, int); static CGSize _logos_method$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$(SBCCAirStuffSectionController*, SEL, int); static BOOL (*_logos_orig$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$)(SBCCQuickLaunchSectionController*, SEL, int); static BOOL _logos_method$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$(SBCCQuickLaunchSectionController*, SEL, int); static CGSize (*_logos_orig$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$)(SBCCQuickLaunchSectionController*, SEL, int); static CGSize _logos_method$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$(SBCCQuickLaunchSectionController*, SEL, int); static void (*_logos_orig$MixCC$SBControlCenterContentContainerView$layoutSubviews)(SBControlCenterContentContainerView*, SEL); static void _logos_method$MixCC$SBControlCenterContentContainerView$layoutSubviews(SBControlCenterContentContainerView*, SEL); 


static void _logos_method$MixCC$SBUIController$handleShowControlCenterSystemGesture$(SBUIController* self, SEL _cmd, id gesture) {
    if (removeCC && enabled) {
        
    } else {
        _logos_orig$MixCC$SBUIController$handleShowControlCenterSystemGesture$(self, _cmd, gesture);
    }
}

static BOOL _logos_method$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(SBUIController* self, SEL _cmd) {
    if (noFirstSlideCC && enabled) {
        return YES;
    } else {
        return _logos_orig$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(self, _cmd);
    }
}



static BOOL _logos_method$MixCC$SBControlCenterSettings$useNewBounce(SBControlCenterSettings* self, SEL _cmd) {
    if (ccOldBound && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBControlCenterSettings$useNewBounce(self, _cmd);
    }
}



static void _logos_method$MixCC$SBControlCenterViewController$loadView(SBControlCenterViewController* self, SEL _cmd) {
    _logos_orig$MixCC$SBControlCenterViewController$loadView(self, _cmd);
    if (enabledCCScale && scale && enabled) {
        [MSHookIvar<SBControlCenterContainerView *>(self, "_containerView") setTransform:CATransform3DGetAffineTransform(CATransform3DMakeScale(scale, scale, 0))];
    }
}



static void _logos_method$MixCC$SBControlCenterKnockoutView$setHidden$(SBControlCenterKnockoutView* self, SEL _cmd, BOOL hidden) {
    if (hideCCRules && enabled) {
        return _logos_orig$MixCC$SBControlCenterKnockoutView$setHidden$(self, _cmd, YES);
    } else {
        return _logos_orig$MixCC$SBControlCenterKnockoutView$setHidden$(self, _cmd, NO);
    }
}



static bool _logos_method$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground(SBCCBrightnessSectionController* self, SEL _cmd) {
    if (hideCCRules && enabled) {
        return FALSE;
    } else {
        return _logos_orig$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground(self, _cmd);
    }
}



static void _logos_method$MixCC$SBCCButtonLikeSectionView$layoutSubviews(SBCCButtonLikeSectionView* self, SEL _cmd) {
    _logos_orig$MixCC$SBCCButtonLikeSectionView$layoutSubviews(self, _cmd);
    if (hideCCRules && enabled) {
        UIVisualEffectView *vibrantDarkenLayer = MSHookIvar<UIVisualEffectView *>(self, "_vibrantDarkenLayer");
        vibrantDarkenLayer.alpha = 0.0;
    }
}



static BOOL _logos_method$MixCC$SBControlCenterController$isUILocked(SBControlCenterController* self, SEL _cmd) {
    if (fixLockShowCC && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBControlCenterController$isUILocked(self, _cmd);
    }
}



static BOOL _logos_method$MixCC$SBCCSettingsSectionController$enabledForOrientation$(SBCCSettingsSectionController* self, SEL _cmd, int orientation) {
    if (hideSwitching && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBCCSettingsSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$(SBCCSettingsSectionController* self, SEL _cmd, int orientation) {
    if (hideSwitching && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$MixCC$SBCCBrightnessSectionController$enabledForOrientation$(SBCCBrightnessSectionController* self, SEL _cmd, int orientation) {
    if (hideBrightness && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBCCBrightnessSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$(SBCCBrightnessSectionController* self, SEL _cmd, int orientation) {
    if (hideBrightness && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$(SBCCMediaControlsSectionController* self, SEL _cmd, int orientation) {
    if (hideMedia && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$(SBCCMediaControlsSectionController* self, SEL _cmd, int orientation) {
    if (hideMedia && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$MixCC$SBCCAirStuffSectionController$enabledForOrientation$(SBCCAirStuffSectionController* self, SEL _cmd, int orientation) {
    
    if (hideAirad && enabled) {
        
        return NO;
    } else {
        return _logos_orig$MixCC$SBCCAirStuffSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$(SBCCAirStuffSectionController* self, SEL _cmd, int orientation) {
    if (hideAirad && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$(SBCCQuickLaunchSectionController* self, SEL _cmd, int orientation) {
    if (hideQuickLaunch && enabled) {
        return NO;
    } else {
        return _logos_orig$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$(SBCCQuickLaunchSectionController* self, SEL _cmd, int orientation) {
    if (hideQuickLaunch && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static void _logos_method$MixCC$SBControlCenterContentContainerView$layoutSubviews(SBControlCenterContentContainerView* self, SEL _cmd) {
    _logos_orig$MixCC$SBControlCenterContentContainerView$layoutSubviews(self, _cmd);
    _UIBackdropView *backView = MSHookIvar<_UIBackdropView *>(self, "_backdropView");
    if (hideCCBlur && enabled) {
        backView.backgroundColor = [UIColor blackColor];
    }
    if (hideCCBackground && enabled) {
        backView.hidden = YES;
    }
}




#pragma mark - Mix Lock Screen

@interface SBLockScreenScrollView : UIScrollView
@end

@interface SBFLockScreenDateView : UIView
-(void) setContentAlpha:(double)arg1 withDateVisible:(BOOL)arg2;
@end

@interface _UIGlintyStringView : UIView
-(id) chevron;
@end

static void (*_logos_orig$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$)(SBFLockScreenDateView*, SEL, double, BOOL); static void _logos_method$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$(SBFLockScreenDateView*, SEL, double, BOOL); static void (*_logos_orig$MixLockScreen$SBLockScreenView$didMoveToWindow)(SBLockScreenView*, SEL); static void _logos_method$MixLockScreen$SBLockScreenView$didMoveToWindow(SBLockScreenView*, SEL); static void (*_logos_orig$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$)(SBLockScreenView*, SEL, bool, id); static void _logos_method$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$(SBLockScreenView*, SEL, bool, id); static void (*_logos_orig$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$)(SBLockScreenView*, SEL, bool, id); static void _logos_method$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$(SBLockScreenView*, SEL, bool, id); static void (*_logos_orig$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$)(SBLockScreenView*, SEL, id); static void _logos_method$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$(SBLockScreenView*, SEL, id); static BOOL (*_logos_orig$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately)(SBLockScreenViewController*, SEL); static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(SBLockScreenViewController*, SEL); static BOOL (*_logos_orig$MixLockScreen$SBLockScreenViewController$shouldShowLockStatusBarTime)(SBLockScreenViewController*, SEL); static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$shouldShowLockStatusBarTime(SBLockScreenViewController*, SEL); static long long (*_logos_orig$MixLockScreen$SBLockScreenViewController$statusBarStyle)(SBLockScreenViewController*, SEL); static long long _logos_method$MixLockScreen$SBLockScreenViewController$statusBarStyle(SBLockScreenViewController*, SEL); static BOOL (*_logos_orig$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText)(SBLockScreenViewController*, SEL); static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText(SBLockScreenViewController*, SEL); static void (*_logos_orig$MixLockScreen$_UIGlintyStringView$show)(_UIGlintyStringView*, SEL); static void _logos_method$MixLockScreen$_UIGlintyStringView$show(_UIGlintyStringView*, SEL); static bool (*_logos_orig$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber)(SpringBoard*, SEL); static bool _logos_method$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber(SpringBoard*, SEL); 



static void _logos_method$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$(SBFLockScreenDateView* self, SEL _cmd, double arg1, BOOL arg2) {
    if (showMiniTime && enabled) {
        timeColors = MSHookIvar<UIColor *>(self, "_textColor");
        _logos_orig$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$(self, _cmd, 0.0, NO);
    } else {
        _logos_orig$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$(self, _cmd, arg1,arg2);
    }
}



static void _logos_method$MixLockScreen$SBLockScreenView$didMoveToWindow(SBLockScreenView* self, SEL _cmd) {
    if (showMiniTime && enabled) {
        SBLockScreenScrollView *scrollView = MSHookIvar<SBLockScreenScrollView *>(self, "_foregroundScrollView");
        NSInteger panding = 20;
        NSInteger height = 96;
        
        NSInteger screenWidth = [UIApplication sharedApplication].keyWindow.frame.size.width;
        UIView *miniTimeView = [[UIView alloc] initWithFrame:CGRectMake(screenWidth, panding, screenWidth, height)];
        miniTimeView.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:miniTimeView];
        
        NSDateFormatter *dt = [[NSDateFormatter alloc] init];
        [dt setDateFormat:@"HH:mm"];
        NSString *miniTimeFormat = [dt stringFromDate:[NSDate date]];
        CGRect labelFrame = CGRectMake(10, 5, 90, 66);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.text = miniTimeFormat;
        label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
        label.textColor = timeColors;
        label.backgroundColor = [UIColor clearColor];
        [label updateTimeLabel];
        [miniTimeView addSubview:label];
        
        CGRect dateLabelFrame = CGRectMake(screenWidth - 100, 0, 90, 76);
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
        [dt setDateFormat:@"EEEE\nyyyy-MM-dd a"];
        NSString *miniDateFormat = [dt stringFromDate:[NSDate date]];
        dateLabel.text = miniDateFormat;
        dateLabel.textColor = timeColors;
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
        dateLabel.textAlignment = NSTextAlignmentRight;
        dateLabel.numberOfLines = 0;
        dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [dateLabel updateDateLabel];
        [miniTimeView addSubview:dateLabel];
        
        [miniTimeView release];
        [label release];
        [dateLabel release];
        
        [dt release];
    }
    
    _logos_orig$MixLockScreen$SBLockScreenView$didMoveToWindow(self, _cmd);
}


static void _logos_method$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$(SBLockScreenView* self, SEL _cmd, bool hidden, id requester) {
    if (hideTopGrabber && enabled) {
        _logos_orig$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$(self, _cmd, YES, requester);
    } else {
        _logos_orig$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$(self, _cmd, hidden, requester);
    }
}


static void _logos_method$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$(SBLockScreenView* self, SEL _cmd, bool hidden, id requester) {
    if (hideBottomGrabber && enabled) {
        _logos_orig$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$(self, _cmd, YES, requester);
    } else {
        _logos_orig$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$(self, _cmd, hidden, requester);
    }
}

static void _logos_method$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$(SBLockScreenView* self, SEL _cmd, id arg1) {
    if (slideText.length > 0 && enabled) {
        arg1 = slideText;
        _logos_orig$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    } else if (hideText && enabled) {
        arg1 = @"";
        _logos_orig$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    } else {
        _logos_orig$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    }
}



static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(SBLockScreenViewController* self, SEL _cmd) {
    if(showImmediately && enabled) {
        return YES;
    } else { return _logos_orig$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(self, _cmd); }
}

static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$shouldShowLockStatusBarTime(SBLockScreenViewController* self, SEL _cmd) {
    if (showStatusBarTime && enabled)
    {
        return YES;
    } else { return NO; }
}

static long long _logos_method$MixLockScreen$SBLockScreenViewController$statusBarStyle(SBLockScreenViewController* self, SEL _cmd) {
    if (sameStatusBar && enabled)
    {
        return 0;
    } else { return _logos_orig$MixLockScreen$SBLockScreenViewController$statusBarStyle(self, _cmd); }
}

static BOOL _logos_method$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText(SBLockScreenViewController* self, SEL _cmd) {
    if (hideChargingText && enabled)
    {
        return NO;
    } else { return _logos_orig$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText(self, _cmd); }
}



static void _logos_method$MixLockScreen$_UIGlintyStringView$show(_UIGlintyStringView* self, SEL _cmd) {
    if (enabled && hideText)
    {
        return;
    } else { return _logos_orig$MixLockScreen$_UIGlintyStringView$show(self, _cmd); }
}



static bool _logos_method$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber(SpringBoard* self, SEL _cmd) {
    if (hideCameraGrabber && enabled)
    {
        return NO;
    } else { return _logos_orig$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber(self, _cmd); }
}




#pragma mark - Mix Notification Center

@interface SBNotificationCenterController : UIViewController
-(void)beginPresentationWithTouchLocation:(CGPoint)touchLocation;
@end
@interface UIStatusBar : UIView
@end

@interface SBTodayTableHeaderView : UIView
-(CGSize)sizeThatFits:(CGSize)fits;
@end

@interface SBTodayTableFooterView : UIView
-(void)layoutSubviews;
@end

@interface SBNotificationSeparatorView : UIView
+(id)separatorForCurrentState;
+(int)separatorViewModeForCurrentState;
+(id)separatorWithScreenScale:(float)screenScale mode:(int)mode;
-(void)setBounds:(CGRect)bounds;
-(void)setFrame:(CGRect)frame;
-(void)updateForCurrentState;
-(id)initWithFrame:(CGRect)frame mode:(int)mode;
@end

@interface SBNotificationVibrantButton : UIView
@end

@interface SBNewWidgetLabel : UIView
@end

@interface SBTodayBulletinCell : UIView
-(void)layoutSubviews;
@end

@interface SBNotificationCenterSeparatorView : UIView
-(id)initWithFrame:(struct CGRect)arg1 mode:(long long)arg2;
@end

@interface SBNotificationCenterHeaderView : UIView
@property(readonly, nonatomic) UIImageView *iconImageView;
@property(readonly, nonatomic) UILabel *titleLabel;
-(void)layoutSubviews;
-(void)buttonAction:(id)arg1;
@end

@interface SBNotificationsSectionHeaderView : UIView
-(void)buttonAction:(id)arg1;
@end

@interface SBNotificationsClearButton : UIView
@end

@interface SBChevronView : UIView
@end

@interface SBNotificationCenterViewController : UIView
@property(readonly, assign, nonatomic) SBChevronView* grabberView;
@property(readonly, assign, nonatomic) _UIBackdropView* backdropView;
-(void)viewDidLoad;
-(void)_loadhidefootrule;
-(void)presentGrabberView;
@end

@protocol SBModeViewControllerContentProviding <NSObject>
@end

@interface SBModeViewController : UIView
@property(retain, nonatomic) NSArray* viewControllers;
@property(assign, nonatomic) UIViewController<SBModeViewControllerContentProviding>* selectedViewController;
@property(readonly, nonatomic) NSArray *orderedSectionIDs;
-(float)_headerViewHeightForMode:(int)mode;
-(void)hostWillPresent;
@end

@interface _SBUIWidgetViewController : UIViewController
-(id)init;
@end

@interface SBTableViewCellActionButton : UIView
-(void)layoutSubviews;
@end

@interface SBNotificationsAllModeViewController : UIViewController
-(id)contentUnavailableText;
@end
@interface SBBannerContainerView : UIView
@property(assign, nonatomic) UIView* backgroundView;
@end

static void (*_logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$)(SBUIController*, SEL, id); static void _logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$(SBUIController*, SEL, id); static BOOL (*_logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe)(SBUIController*, SEL); static BOOL _logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$)(SBNotificationCenterController*, SEL, CGPoint); static void _logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController*, SEL, CGPoint); static CGSize (*_logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$)(SBTodayTableHeaderView*, SEL, CGSize); static CGSize _logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView*, SEL, CGSize); static void (*_logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews)(SBTodayTableFooterView*, SEL); static void _logos_method$MixNC$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView*, SEL); static void (*_logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews)(SBTodayBulletinCell*, SEL); static void _logos_method$MixNC$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell*, SEL); static id (*_logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$)(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static id _logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static void (*_logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews)(SBNotificationCenterHeaderView*, SEL); static void _logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad)(SBNotificationCenterViewController*, SEL); static void _logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule)(SBNotificationCenterViewController*, SEL); static void _logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController*, SEL); static float (*_logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$)(SBModeViewController*, SEL, int); static float _logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$(SBModeViewController*, SEL, int); static void (*_logos_orig$MixNC$SBModeViewController$hostWillPresent)(SBModeViewController*, SEL); static void _logos_method$MixNC$SBModeViewController$hostWillPresent(SBModeViewController*, SEL); static id (*_logos_orig$MixNC$_SBUIWidgetViewController$init)(_SBUIWidgetViewController*, SEL); static id _logos_method$MixNC$_SBUIWidgetViewController$init(_SBUIWidgetViewController*, SEL); static id (*_logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText)(SBNotificationsAllModeViewController*, SEL); static id _logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController*, SEL); static UIView * (*_logos_orig$MixNC$SBBannerContainerView$backgroundView)(SBBannerContainerView*, SEL); static UIView * _logos_method$MixNC$SBBannerContainerView$backgroundView(SBBannerContainerView*, SEL); static id (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState)(Class, SEL); static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState(Class, SEL); static int (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState)(Class, SEL); static int _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class, SEL); static id (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$)(Class, SEL, float, int); static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class, SEL, float, int); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$setBounds$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$MixNC$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$setFrame$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$MixNC$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState)(SBNotificationSeparatorView*, SEL); static void _logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView*, SEL); static id (*_logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$)(SBNotificationSeparatorView*, SEL, CGRect, int); static id _logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView*, SEL, CGRect, int); 


static void _logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$(SBUIController* self, SEL _cmd, id gesture) {
    if (removeNotify && enabled) {
        
    } else {
        _logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$(self, _cmd, gesture);
    }
}

static BOOL _logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController* self, SEL _cmd) {
    if (noFirstSlideNotify && enabled) {
        return YES;
    } else {
        return _logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(self, _cmd);
    }
}



static void _logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController* self, SEL _cmd, CGPoint touchLocation) {
    loadPrefs();
    _logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(self, _cmd, touchLocation);
}



static CGSize _logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView* self, SEL _cmd, CGSize fits) {
    CGSize original = _logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$(self, _cmd, fits);
    if (hideTodayDate && enabled) {
        [self setHidden:YES];
        return CGSizeMake(0,0);
    } else {
        return original;
    }
}



static void _logos_method$MixNC$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView* self, SEL _cmd) {
    _logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews(self, _cmd);
    if (hideEditRule && enabled) {
        SBNotificationSeparatorView *separator = MSHookIvar<SBNotificationSeparatorView *>(self, "_separatorView");
        CGRect newFrame = separator.frame;
        CGRect newBounds = separator.bounds;
        newFrame.size.height = 0;
        newBounds.size.height = 0;
        [separator setFrame:newFrame];
        [separator setBounds:newBounds];
        [separator setHidden:YES];}
    
    if (hideEditButton && enabled) {
        SBNotificationVibrantButton *editButton = MSHookIvar<SBNotificationVibrantButton *>(self, "_button");
        CGRect newFrame = editButton.frame;
        CGRect newBounds = editButton.bounds;
        newFrame.size.height = 0;
        newBounds.size.height = 0;
        [editButton setFrame:newFrame];
        [editButton setBounds:newBounds];
        [editButton setHidden:YES];
    }
    
    if (hideWidgetNew && enabled) {
        SBNewWidgetLabel *newWidgetLabel = MSHookIvar<SBNewWidgetLabel *>(self, "_newWidgetsLabel");
        CGRect newFrame = newWidgetLabel.frame;
        CGRect newBounds = newWidgetLabel.bounds;
        newFrame.size.height = 0;
        newBounds.size.height = 0;
        [newWidgetLabel setFrame:newFrame];
        [newWidgetLabel setBounds:newBounds];
        [newWidgetLabel setHidden:YES];
    }
}



static void _logos_method$MixNC$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell* self, SEL _cmd) {
    _logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews(self, _cmd);
    if (hideTodayWeatherText && enabled) {
        UILabel *weatherLabel = MSHookIvar<UILabel *>(self, "_label");
        CGRect weatherLabelFrame = weatherLabel.frame;
        CGRect weatherLabelBounds = weatherLabel.bounds;
        weatherLabelFrame.size.height = 0;
        weatherLabelBounds.size.height = 0;
        [weatherLabel setFrame:weatherLabelFrame];
        [weatherLabel setBounds:weatherLabelBounds];
        [weatherLabel setHidden:YES];
        UIImageView *weatherIcon = MSHookIvar<UIImageView *>(self, "_iconImageView");
        CGRect iconNewFrame = weatherIcon.frame;
        CGRect iconNewBounds = weatherIcon.bounds;
        iconNewFrame.size.height = 0;
        iconNewBounds.size.height = 0;
        [weatherIcon setFrame:iconNewFrame];
        [weatherIcon setBounds:iconNewBounds];
        [weatherIcon setHidden:YES];
    }
}




static id _logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView* self, SEL _cmd, CGRect theRect, int theInt) {
    if (hideLines && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(self, _cmd, theRect, theInt);
    }
}



static void _logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView* self, SEL _cmd) {
    _logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews(self, _cmd);
    if (MSHookIvar<id>(self, "_clearButton") == nil) {
        if (hideTodayHeaders && enabled) {
            CGRect newFrame=self.frame;
            CGRect newBounds=self.bounds;
            newFrame.size.height=0;
            newBounds.size.height=0;
            [self setFrame:newFrame];
            [self setBounds:newBounds];
            [self setHidden:YES];
        }
    } else {
        if (hideNotifyHeaders && enabled) {
            CGRect newFrame=self.frame;
            CGRect newBounds=self.bounds;
            newFrame.size.height=0;
            newBounds.size.height=0;
            [self setFrame:newFrame];
            [self setBounds:newBounds];
            [self setHidden:YES];
        }
    }
}



static void _logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController* self, SEL _cmd) {
    _logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad(self, _cmd);
    UIStatusBar *statusBar = MSHookIvar<UIStatusBar *>(self, "_statusBar");
    if (hideStatus && enabled) {
        statusBar.hidden = YES;}
    if (hideStatus && enabled) {
        CGRect newFrame=statusBar.frame;
        CGRect newBounds=statusBar.bounds;
        newFrame.size.height=0;
        newBounds.size.height=0;
        [statusBar setFrame:newFrame];
        [statusBar setBounds:newBounds];
    }
    if (hideNCBackground && enabled) {
        self.backdropView.hidden = YES;
    }
}

static void _logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController* self, SEL _cmd) {
    if (hideFootRule && enabled) {
        
    } else {
        return _logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule(self, _cmd);
    }
}



static float _logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$(SBModeViewController* self, SEL _cmd, int mode) {
    if (hideTodayTabs && enabled) {
        return 0;
    } else {
        return _logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$(self, _cmd, mode);
    }
}

static void _logos_method$MixNC$SBModeViewController$hostWillPresent(SBModeViewController* self, SEL _cmd) {
    int index = 0;
    if (hideToday && enabled) {
        index = 1;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    if (hideNotify && enabled) {
        index = 0;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    _logos_orig$MixNC$SBModeViewController$hostWillPresent(self, _cmd);
}



static id _logos_method$MixNC$_SBUIWidgetViewController$init(_SBUIWidgetViewController* self, SEL _cmd) {
    if ([NSStringFromClass([self class]) isEqualToString:@"AttributionWeeAppController"] && hideTodayFootText && enabled) {
        return nil;
    } else {
        self = _logos_orig$MixNC$_SBUIWidgetViewController$init(self, _cmd);
        return self;
    }
}



static id _logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController* self, SEL _cmd) {
    if (hideNotifyText && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(self, _cmd);
    }
}



static UIView * _logos_method$MixNC$SBBannerContainerView$backgroundView(SBBannerContainerView* self, SEL _cmd) {
    if (hideNotifyBanners && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBBannerContainerView$backgroundView(self, _cmd);
    }
}



static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState(self, _cmd);
    }
}

static int _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return 0;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(self, _cmd);
    }
}


static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class self, SEL _cmd, float screenScale, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(self, _cmd, screenScale, mode);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView* self, SEL _cmd, CGRect bounds) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$setBounds$(self, _cmd, bounds);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$setFrame$(self, _cmd, frame);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView* self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState(self, _cmd);
    }
}
static id _logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(self, _cmd, frame, mode);
    }
}




#pragma mark - Mix SpringBoard

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

static id (*_logos_orig$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize)(SBFolderIconBackgroundView*, SEL); static id _logos_method$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize(SBFolderIconBackgroundView*, SEL); static bool (*_logos_orig$MixSpringBoard$SBIconController$isNewsstandSupported)(SBIconController*, SEL); static bool _logos_method$MixSpringBoard$SBIconController$isNewsstandSupported(SBIconController*, SEL); static void (*_logos_orig$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$)(SBClockApplicationIconImageView*, SEL, bool); static void _logos_method$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$(SBClockApplicationIconImageView*, SEL, bool); static bool (*_logos_orig$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$)(SBSearchScrollView*, SEL, id); static bool _logos_method$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$(SBSearchScrollView*, SEL, id); static id (*_logos_orig$MixSpringBoard$SBVoiceControlController$init)(SBVoiceControlController*, SEL); static id _logos_method$MixSpringBoard$SBVoiceControlController$init(SBVoiceControlController*, SEL); static id (*_logos_orig$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$)(SBIconPageIndicatorImageSetResult*, SEL, id, id); static id _logos_method$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(SBIconPageIndicatorImageSetResult*, SEL, id, id); static float (*_logos_orig$MixSpringBoard$SBFWallpaperView$contrast)(SBFWallpaperView*, SEL); static float _logos_method$MixSpringBoard$SBFWallpaperView$contrast(SBFWallpaperView*, SEL); static id (*_logos_orig$MixSpringBoard$SBIconBetaLabelAccessoryView$init)(SBIconBetaLabelAccessoryView*, SEL); static id _logos_method$MixSpringBoard$SBIconBetaLabelAccessoryView$init(SBIconBetaLabelAccessoryView*, SEL); static id (*_logos_orig$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init)(SBIconRecentlyUpdatedLabelAccessoryView*, SEL); static id _logos_method$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init(SBIconRecentlyUpdatedLabelAccessoryView*, SEL); static void (*_logos_orig$MixSpringBoard$SBDockView$layoutSubviews)(SBDockView*, SEL); static void _logos_method$MixSpringBoard$SBDockView$layoutSubviews(SBDockView*, SEL); static void (*_logos_orig$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews)(SBAppSwitcherHomePageCellView*, SEL); static void _logos_method$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews(SBAppSwitcherHomePageCellView*, SEL); static BOOL (*_logos_orig$MixSpringBoard$SBIconColorSettings$suppressJitter)(SBIconColorSettings*, SEL); static BOOL _logos_method$MixSpringBoard$SBIconColorSettings$suppressJitter(SBIconColorSettings*, SEL); static bool (*_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics)(SBSearchResultsBackdropView*, SEL); static bool _logos_method$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics(SBSearchResultsBackdropView*, SEL); static id (*_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$)(SBSearchResultsBackdropView*, SEL, CGRect); static id _logos_method$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$(SBSearchResultsBackdropView*, SEL, CGRect); static id (*_logos_orig$MixSpringBoard$SBAppParallaxSettings$iconSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$MixSpringBoard$SBAppParallaxSettings$iconSettings(SBAppParallaxSettings*, SEL); static id (*_logos_orig$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings(SBAppParallaxSettings*, SEL); static id (*_logos_orig$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings(SBAppParallaxSettings*, SEL); static void (*_logos_orig$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$)(SBAppParallaxSettings*, SEL, id); static void _logos_method$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$(SBAppParallaxSettings*, SEL, id); static void (*_logos_orig$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$)(SBAppParallaxSettings*, SEL, id); static void _logos_method$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$(SBAppParallaxSettings*, SEL, id); static void (*_logos_orig$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$)(SBWallpaperController*, SEL, float); static void _logos_method$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$(SBWallpaperController*, SEL, float); static BOOL (*_logos_orig$MixSpringBoard$SBFWallpaperSettings$replaceBlurs)(SBFWallpaperSettings*, SEL); static BOOL _logos_method$MixSpringBoard$SBFWallpaperSettings$replaceBlurs(SBFWallpaperSettings*, SEL); static double (*_logos_orig$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha)(_UIBackdropViewSettings*, SEL); static double _logos_method$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha(_UIBackdropViewSettings*, SEL); static id (*_logos_orig$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$)(_UIBackdropViewSettings*, SEL, long long); static id _logos_method$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_UIBackdropViewSettings*, SEL, long long); static double (*_logos_orig$MixSpringBoard$_UIBackdropViewSettings$blurRadius)(_UIBackdropViewSettings*, SEL); static double _logos_method$MixSpringBoard$_UIBackdropViewSettings$blurRadius(_UIBackdropViewSettings*, SEL); static void (*_logos_orig$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$)(_UIBackdropViewSettings*, SEL, bool); static void _logos_method$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$(_UIBackdropViewSettings*, SEL, bool); static void (*_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$)(SBDarkeningImageView*, SEL, id); static void _logos_method$MixSpringBoard$SBDarkeningImageView$setImage$(SBDarkeningImageView*, SEL, id); static void (*_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$brightness$)(SBDarkeningImageView*, SEL, id, double); static void _logos_method$MixSpringBoard$SBDarkeningImageView$setImage$brightness$(SBDarkeningImageView*, SEL, id, double); 

  
static id _logos_method$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize(SBFolderIconBackgroundView* self, SEL _cmd) {
    if (noFolderBackground && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize(self, _cmd);
}


   
static bool _logos_method$MixSpringBoard$SBIconController$isNewsstandSupported(SBIconController* self, SEL _cmd) {
    if (hideNews && enabled)
        return FALSE;
    return _logos_orig$MixSpringBoard$SBIconController$isNewsstandSupported(self, _cmd);
}


 
static void _logos_method$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$(SBClockApplicationIconImageView* self, SEL _cmd, bool removeA) {
    if (noClockAnimate && enabled)
        removeA = FALSE;
        _logos_orig$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$(self, _cmd, removeA);
        }


 
static bool _logos_method$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$(SBSearchScrollView* self, SEL _cmd, id arg1) {
    if (rmSearch && enabled)
        return FALSE;
    return _logos_orig$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);
}


  
static id _logos_method$MixSpringBoard$SBVoiceControlController$init(SBVoiceControlController* self, SEL _cmd) {
    if (disVoice && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBVoiceControlController$init(self, _cmd);
}


 

static id _logos_method$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(SBIconPageIndicatorImageSetResult* self, SEL _cmd, id arg1, id arg2) {
    _logos_orig$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(self, _cmd, arg1, arg2);
    if (SBHideIndicator && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(self, _cmd, arg1, arg2);
}


 
static float _logos_method$MixSpringBoard$SBFWallpaperView$contrast(SBFWallpaperView* self, SEL _cmd) {
    if (rmShadow && enabled)
        return 0.0f;
    return _logos_orig$MixSpringBoard$SBFWallpaperView$contrast(self, _cmd);
}


 
static id _logos_method$MixSpringBoard$SBIconBetaLabelAccessoryView$init(SBIconBetaLabelAccessoryView* self, SEL _cmd) {
    if (rmYellowDot && enabled)
        return nil;
    return _logos_orig$MixSpringBoard$SBIconBetaLabelAccessoryView$init(self, _cmd);
}


 
static id _logos_method$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init(SBIconRecentlyUpdatedLabelAccessoryView* self, SEL _cmd) {
    if (rmBlueDot && enabled)
        return nil;
    return _logos_orig$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init(self, _cmd);
}


 
static void _logos_method$MixSpringBoard$SBDockView$layoutSubviews(SBDockView* self, SEL _cmd) {
    if (HideDockBackgrouond && enabled)
        return;
    _logos_orig$MixSpringBoard$SBDockView$layoutSubviews(self, _cmd);
}


 
static void _logos_method$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews(SBAppSwitcherHomePageCellView* self, SEL _cmd) {
    if (HideAppSwitcherBackground && enabled)
        return;
    _logos_orig$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews(self, _cmd);
}


 
static BOOL _logos_method$MixSpringBoard$SBIconColorSettings$suppressJitter(SBIconColorSettings* self, SEL _cmd) {
    if (rmIconJitter && enabled)
        return TRUE;
    return _logos_orig$MixSpringBoard$SBIconColorSettings$suppressJitter(self, _cmd);
}


 
static bool _logos_method$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics(SBSearchResultsBackdropView* self, SEL _cmd) {
    if (rmSpotlightBlur && enabled)
        return FALSE;
    return _logos_orig$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics(self, _cmd);
}

static id _logos_method$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$(SBSearchResultsBackdropView* self, SEL _cmd, CGRect arg1) {
    if (rmSpotlightBlur && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$(self, _cmd, arg1);
}


 
static id _logos_method$MixSpringBoard$SBAppParallaxSettings$iconSettings(SBAppParallaxSettings* self, SEL _cmd) {
    if (rmParallax && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBAppParallaxSettings$iconSettings(self, _cmd);
}

static id _logos_method$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings(SBAppParallaxSettings* self, SEL _cmd) {
    if (rmParallax && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings(self, _cmd);
}

static id _logos_method$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings(SBAppParallaxSettings* self, SEL _cmd) {
    if (rmParallax && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings(self, _cmd);
}

static void _logos_method$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$(SBAppParallaxSettings* self, SEL _cmd, id lock) {
    if (rmParallax && enabled)
        lock = 0;
        _logos_orig$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$(self, _cmd, lock);
        }

static void _logos_method$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$(SBAppParallaxSettings* self, SEL _cmd, id home) {
    if (rmParallax && enabled)
        home = 0;
        _logos_orig$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$(self, _cmd, home);
        }


 
static void _logos_method$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$(SBWallpaperController* self, SEL _cmd, float wallpaper) {
    if (rmWallpaperZoom && enabled) {
        wallpaper = 1;
    } else {
        _logos_orig$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$(self, _cmd, wallpaper);
    }
}


 
static BOOL _logos_method$MixSpringBoard$SBFWallpaperSettings$replaceBlurs(SBFWallpaperSettings* self, SEL _cmd) {
    if (AllReplaceBlur && enabled)
        return TRUE;
    return _logos_orig$MixSpringBoard$SBFWallpaperSettings$replaceBlurs(self, _cmd);
}



static double _logos_method$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha(_UIBackdropViewSettings* self, SEL _cmd) { 
    if (AllBlurGlass && enabled)
        return 0;
    return _logos_orig$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha(self, _cmd);
}

static id _logos_method$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_UIBackdropViewSettings* self, SEL _cmd, long long qualityblur) { 
    if (AllTransparent && enabled)
        return NULL;
    return _logos_orig$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(self, _cmd, qualityblur);
}

static double _logos_method$MixSpringBoard$_UIBackdropViewSettings$blurRadius(_UIBackdropViewSettings* self, SEL _cmd) { 
    if (AllReplaceBlur2 && enabled)
        return 60;
    return _logos_orig$MixSpringBoard$_UIBackdropViewSettings$blurRadius(self, _cmd);
}

static void _logos_method$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$(_UIBackdropViewSettings* self, SEL _cmd, bool zoomsback) {
    if (AllReplaceBlur2 && enabled)
        zoomsback = 0;
        _logos_orig$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$(self, _cmd, zoomsback);
        }



static void _logos_method$MixSpringBoard$SBDarkeningImageView$setImage$(SBDarkeningImageView* self, SEL _cmd, id image) { 
    if (rmBadgeBackground && enabled)
        return;
    _logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$(self, _cmd, image);
}


static void _logos_method$MixSpringBoard$SBDarkeningImageView$setImage$brightness$(SBDarkeningImageView* self, SEL _cmd, id image1, double image2) { 
    if (HideBadge && enabled)
        return;
    _logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$brightness$(self, _cmd, image1, image2);
}




#pragma mark - Mix Status Bar

static void (*_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter)(SBStatusBarStateAggregator*, SEL); static void _logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(SBStatusBarStateAggregator*, SEL); static BOOL (*_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$)(SBStatusBarStateAggregator*, SEL, int, BOOL); static BOOL _logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(SBStatusBarStateAggregator*, SEL, int, BOOL); static void (*_logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$)(SBTelephonyManager*, SEL, id); static void _logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(SBTelephonyManager*, SEL, id); 

 












































































static void _logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(SBStatusBarStateAggregator* self, SEL _cmd) {
    _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(self, _cmd);
    NSDateFormatter *timeFormatter = MSHookIvar<NSDateFormatter *>(self, "_timeItemDateFormatter");
    if (!timeFormatter)
        return;
    else if (MixRAM && enabled)
    {
        timeFormat = [timeFormat reRAM];
    }
    else if (MixIP && enabled)
    {
        [NSTimer scheduledTimerWithTimeInterval:600.0f target:self selector:@selector(updateLocalIP) userInfo:nil repeats:YES];
        [timeFormat stringByAppendingString:[NSString stringWithFormat:@"-%@", address]];
    }
    [timeFormatter setDateFormat:timeFormat];
    [timeFormat release];
    
    
    
    
}



static BOOL _logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(SBStatusBarStateAggregator* self, SEL _cmd, int item, BOOL arg2) {
    if (item == 0  && MixHideTime && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
        if (item == 1  && MixHideNotDisturb && enabled) return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
            if (item == 2  && MixHideAirplane && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                if (item == 3  && MixHideSignal && enabled)    return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                    if (item == 4  && MixHideCarrier && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                        if (item == 5  && MixHideData && enabled)         return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                            if (item == 7  && MixHideBattery && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                                if (item == 8  && MixShowBP && enabled)        return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, YES);
                                    if (item == 13 && MixHideAlarm && enabled)        return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                                        if (item == 16 && MixHideGeoItem && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                                            if (item == 17 && MixHideRotation && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                                                if (item == 23 && MixHideDataSpinner && enabled)  return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
                                                    return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, arg2);
}








































 
static void _logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(SBTelephonyManager* self, SEL _cmd, id userName) {
    if ([customSignal isEqualToString:@""] || customSignal == nil || !enabled)
    {
        _logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(self, _cmd, userName);
    }  else if (enabled && customSignal) {
        userName = customSignal;
        _logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(self, _cmd, userName);
    }
}




static __attribute__((constructor)) void _logosLocalCtor_8dab9008() {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        



        
        {Class _logos_class$MixCC$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$MixCC$SBUIController, @selector(handleShowControlCenterSystemGesture:), (IMP)&_logos_method$MixCC$SBUIController$handleShowControlCenterSystemGesture$, (IMP*)&_logos_orig$MixCC$SBUIController$handleShowControlCenterSystemGesture$);MSHookMessageEx(_logos_class$MixCC$SBUIController, @selector(shouldShowControlCenterTabControlOnFirstSwipe), (IMP)&_logos_method$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe);Class _logos_class$MixCC$SBControlCenterSettings = objc_getClass("SBControlCenterSettings"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterSettings, @selector(useNewBounce), (IMP)&_logos_method$MixCC$SBControlCenterSettings$useNewBounce, (IMP*)&_logos_orig$MixCC$SBControlCenterSettings$useNewBounce);Class _logos_class$MixCC$SBControlCenterViewController = objc_getClass("SBControlCenterViewController"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterViewController, @selector(loadView), (IMP)&_logos_method$MixCC$SBControlCenterViewController$loadView, (IMP*)&_logos_orig$MixCC$SBControlCenterViewController$loadView);Class _logos_class$MixCC$SBControlCenterKnockoutView = objc_getClass("SBControlCenterKnockoutView"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterKnockoutView, @selector(setHidden:), (IMP)&_logos_method$MixCC$SBControlCenterKnockoutView$setHidden$, (IMP*)&_logos_orig$MixCC$SBControlCenterKnockoutView$setHidden$);Class _logos_class$MixCC$SBCCBrightnessSectionController = objc_getClass("SBCCBrightnessSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(_shouldDarkenBackground), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground);MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCButtonLikeSectionView = objc_getClass("SBCCButtonLikeSectionView"); MSHookMessageEx(_logos_class$MixCC$SBCCButtonLikeSectionView, @selector(layoutSubviews), (IMP)&_logos_method$MixCC$SBCCButtonLikeSectionView$layoutSubviews, (IMP*)&_logos_orig$MixCC$SBCCButtonLikeSectionView$layoutSubviews);Class _logos_class$MixCC$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterController, @selector(isUILocked), (IMP)&_logos_method$MixCC$SBControlCenterController$isUILocked, (IMP*)&_logos_orig$MixCC$SBControlCenterController$isUILocked);Class _logos_class$MixCC$SBCCSettingsSectionController = objc_getClass("SBCCSettingsSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCSettingsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCSettingsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCSettingsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCSettingsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCMediaControlsSectionController = objc_getClass("SBCCMediaControlsSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCMediaControlsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCMediaControlsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCAirStuffSectionController = objc_getClass("SBCCAirStuffSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCAirStuffSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCAirStuffSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCAirStuffSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCAirStuffSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCQuickLaunchSectionController = objc_getClass("SBCCQuickLaunchSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCQuickLaunchSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCQuickLaunchSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBControlCenterContentContainerView = objc_getClass("SBControlCenterContentContainerView"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterContentContainerView, @selector(layoutSubviews), (IMP)&_logos_method$MixCC$SBControlCenterContentContainerView$layoutSubviews, (IMP*)&_logos_orig$MixCC$SBControlCenterContentContainerView$layoutSubviews);}
        {Class _logos_class$MixLockScreen$SBFLockScreenDateView = objc_getClass("SBFLockScreenDateView"); MSHookMessageEx(_logos_class$MixLockScreen$SBFLockScreenDateView, @selector(setContentAlpha:withDateVisible:), (IMP)&_logos_method$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$, (IMP*)&_logos_orig$MixLockScreen$SBFLockScreenDateView$setContentAlpha$withDateVisible$);Class _logos_class$MixLockScreen$SBLockScreenView = objc_getClass("SBLockScreenView"); MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenView, @selector(didMoveToWindow), (IMP)&_logos_method$MixLockScreen$SBLockScreenView$didMoveToWindow, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenView$didMoveToWindow);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenView, @selector(setTopGrabberHidden:forRequester:), (IMP)&_logos_method$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenView$setTopGrabberHidden$forRequester$);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenView, @selector(setBottomGrabberHidden:forRequester:), (IMP)&_logos_method$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenView$setBottomGrabberHidden$forRequester$);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenView, @selector(setCustomSlideToUnlockText:), (IMP)&_logos_method$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenView$setCustomSlideToUnlockText$);Class _logos_class$MixLockScreen$SBLockScreenViewController = objc_getClass("SBLockScreenViewController"); MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenViewController, @selector(shouldShowSlideToUnlockTextImmediately), (IMP)&_logos_method$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenViewController, @selector(shouldShowLockStatusBarTime), (IMP)&_logos_method$MixLockScreen$SBLockScreenViewController$shouldShowLockStatusBarTime, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenViewController$shouldShowLockStatusBarTime);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenViewController, @selector(statusBarStyle), (IMP)&_logos_method$MixLockScreen$SBLockScreenViewController$statusBarStyle, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenViewController$statusBarStyle);MSHookMessageEx(_logos_class$MixLockScreen$SBLockScreenViewController, @selector(_shouldShowChargingText), (IMP)&_logos_method$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText, (IMP*)&_logos_orig$MixLockScreen$SBLockScreenViewController$_shouldShowChargingText);Class _logos_class$MixLockScreen$_UIGlintyStringView = objc_getClass("_UIGlintyStringView"); MSHookMessageEx(_logos_class$MixLockScreen$_UIGlintyStringView, @selector(show), (IMP)&_logos_method$MixLockScreen$_UIGlintyStringView$show, (IMP*)&_logos_orig$MixLockScreen$_UIGlintyStringView$show);Class _logos_class$MixLockScreen$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$MixLockScreen$SpringBoard, @selector(canShowLockScreenCameraGrabber), (IMP)&_logos_method$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber, (IMP*)&_logos_orig$MixLockScreen$SpringBoard$canShowLockScreenCameraGrabber);}
        {Class _logos_class$MixNC$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$MixNC$SBUIController, @selector(handleShowNotificationsSystemGesture:), (IMP)&_logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$, (IMP*)&_logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$);MSHookMessageEx(_logos_class$MixNC$SBUIController, @selector(shouldShowNotificationCenterTabControlOnFirstSwipe), (IMP)&_logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe);Class _logos_class$MixNC$SBNotificationCenterController = objc_getClass("SBNotificationCenterController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterController, @selector(beginPresentationWithTouchLocation:), (IMP)&_logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$, (IMP*)&_logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$);Class _logos_class$MixNC$SBTodayTableHeaderView = objc_getClass("SBTodayTableHeaderView"); MSHookMessageEx(_logos_class$MixNC$SBTodayTableHeaderView, @selector(sizeThatFits:), (IMP)&_logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$, (IMP*)&_logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$);Class _logos_class$MixNC$SBTodayTableFooterView = objc_getClass("SBTodayTableFooterView"); MSHookMessageEx(_logos_class$MixNC$SBTodayTableFooterView, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBTodayTableFooterView$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews);Class _logos_class$MixNC$SBTodayBulletinCell = objc_getClass("SBTodayBulletinCell"); MSHookMessageEx(_logos_class$MixNC$SBTodayBulletinCell, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBTodayBulletinCell$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews);Class _logos_class$MixNC$SBNotificationCenterSeparatorView = objc_getClass("SBNotificationCenterSeparatorView"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$);Class _logos_class$MixNC$SBNotificationCenterHeaderView = objc_getClass("SBNotificationCenterHeaderView"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterHeaderView, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews);Class _logos_class$MixNC$SBNotificationCenterViewController = objc_getClass("SBNotificationCenterViewController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterViewController, @selector(viewDidLoad), (IMP)&_logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad, (IMP*)&_logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad);MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterViewController, @selector(_loadhidefootrule), (IMP)&_logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule, (IMP*)&_logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule);Class _logos_class$MixNC$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$MixNC$SBModeViewController, @selector(_headerViewHeightForMode:), (IMP)&_logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$, (IMP*)&_logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$);MSHookMessageEx(_logos_class$MixNC$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$MixNC$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$MixNC$SBModeViewController$hostWillPresent);Class _logos_class$MixNC$_SBUIWidgetViewController = objc_getClass("_SBUIWidgetViewController"); MSHookMessageEx(_logos_class$MixNC$_SBUIWidgetViewController, @selector(init), (IMP)&_logos_method$MixNC$_SBUIWidgetViewController$init, (IMP*)&_logos_orig$MixNC$_SBUIWidgetViewController$init);Class _logos_class$MixNC$SBNotificationsAllModeViewController = objc_getClass("SBNotificationsAllModeViewController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationsAllModeViewController, @selector(contentUnavailableText), (IMP)&_logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText, (IMP*)&_logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText);Class _logos_class$MixNC$SBBannerContainerView = objc_getClass("SBBannerContainerView"); MSHookMessageEx(_logos_class$MixNC$SBBannerContainerView, @selector(backgroundView), (IMP)&_logos_method$MixNC$SBBannerContainerView$backgroundView, (IMP*)&_logos_orig$MixNC$SBBannerContainerView$backgroundView);Class _logos_class$MixNC$SBNotificationSeparatorView = objc_getClass("SBNotificationSeparatorView"); Class _logos_metaclass$MixNC$SBNotificationSeparatorView = object_getClass(_logos_class$MixNC$SBNotificationSeparatorView); MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorForCurrentState), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState);MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorViewModeForCurrentState), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState);MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorWithScreenScale:mode:), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(setBounds:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$setBounds$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$setBounds$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(setFrame:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$setFrame$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$setFrame$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(updateForCurrentState), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$);}
        {Class _logos_class$MixSpringBoard$SBFolderIconBackgroundView = objc_getClass("SBFolderIconBackgroundView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFolderIconBackgroundView, @selector(initWithDefaultSize), (IMP)&_logos_method$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize, (IMP*)&_logos_orig$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize);Class _logos_class$MixSpringBoard$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconController, @selector(isNewsstandSupported), (IMP)&_logos_method$MixSpringBoard$SBIconController$isNewsstandSupported, (IMP*)&_logos_orig$MixSpringBoard$SBIconController$isNewsstandSupported);Class _logos_class$MixSpringBoard$SBClockApplicationIconImageView = objc_getClass("SBClockApplicationIconImageView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBClockApplicationIconImageView, @selector(_setAnimating:), (IMP)&_logos_method$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$, (IMP*)&_logos_orig$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$);Class _logos_class$MixSpringBoard$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$MixSpringBoard$SBVoiceControlController = objc_getClass("SBVoiceControlController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBVoiceControlController, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBVoiceControlController$init, (IMP*)&_logos_orig$MixSpringBoard$SBVoiceControlController$init);Class _logos_class$MixSpringBoard$SBIconPageIndicatorImageSetResult = objc_getClass("SBIconPageIndicatorImageSetResult"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconPageIndicatorImageSetResult, @selector(initWithIndicatorSet:enabledIndicatorSet:), (IMP)&_logos_method$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$, (IMP*)&_logos_orig$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$);Class _logos_class$MixSpringBoard$SBFWallpaperView = objc_getClass("SBFWallpaperView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFWallpaperView, @selector(contrast), (IMP)&_logos_method$MixSpringBoard$SBFWallpaperView$contrast, (IMP*)&_logos_orig$MixSpringBoard$SBFWallpaperView$contrast);Class _logos_class$MixSpringBoard$SBIconBetaLabelAccessoryView = objc_getClass("SBIconBetaLabelAccessoryView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconBetaLabelAccessoryView, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBIconBetaLabelAccessoryView$init, (IMP*)&_logos_orig$MixSpringBoard$SBIconBetaLabelAccessoryView$init);Class _logos_class$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView = objc_getClass("SBIconRecentlyUpdatedLabelAccessoryView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init, (IMP*)&_logos_orig$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init);Class _logos_class$MixSpringBoard$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBDockView, @selector(layoutSubviews), (IMP)&_logos_method$MixSpringBoard$SBDockView$layoutSubviews, (IMP*)&_logos_orig$MixSpringBoard$SBDockView$layoutSubviews);Class _logos_class$MixSpringBoard$SBAppSwitcherHomePageCellView = objc_getClass("SBAppSwitcherHomePageCellView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBAppSwitcherHomePageCellView, @selector(layoutSubviews), (IMP)&_logos_method$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews, (IMP*)&_logos_orig$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews);Class _logos_class$MixSpringBoard$SBIconColorSettings = objc_getClass("SBIconColorSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconColorSettings, @selector(suppressJitter), (IMP)&_logos_method$MixSpringBoard$SBIconColorSettings$suppressJitter, (IMP*)&_logos_orig$MixSpringBoard$SBIconColorSettings$suppressJitter);Class _logos_class$MixSpringBoard$SBSearchResultsBackdropView = objc_getClass("SBSearchResultsBackdropView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchResultsBackdropView, @selector(useHighQualityGraphics), (IMP)&_logos_method$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics, (IMP*)&_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics);MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchResultsBackdropView, @selector(initWithFrame:), (IMP)&_logos_method$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$, (IMP*)&_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$);Class _logos_class$MixSpringBoard$SBAppParallaxSettings = objc_getClass("SBAppParallaxSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(iconSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$iconSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$iconSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(lockscreenWallpaperSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(homescreenWallpaperSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(setLockscreenWallpaperSettings:), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(setHomescreenWallpaperSettings:), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$);Class _logos_class$MixSpringBoard$SBWallpaperController = objc_getClass("SBWallpaperController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBWallpaperController, @selector(setHomescreenWallpaperScale:), (IMP)&_logos_method$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$, (IMP*)&_logos_orig$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$);Class _logos_class$MixSpringBoard$SBFWallpaperSettings = objc_getClass("SBFWallpaperSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFWallpaperSettings, @selector(replaceBlurs), (IMP)&_logos_method$MixSpringBoard$SBFWallpaperSettings$replaceBlurs, (IMP*)&_logos_orig$MixSpringBoard$SBFWallpaperSettings$replaceBlurs);Class _logos_class$MixSpringBoard$_UIBackdropViewSettings = objc_getClass("_UIBackdropViewSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(grayscaleTintAlpha), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(initWithDefaultValuesForGraphicsQuality:), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(blurRadius), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$blurRadius, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$blurRadius);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(setZoomsBack:), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$);Class _logos_class$MixSpringBoard$SBDarkeningImageView = objc_getClass("SBDarkeningImageView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBDarkeningImageView, @selector(setImage:), (IMP)&_logos_method$MixSpringBoard$SBDarkeningImageView$setImage$, (IMP*)&_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$);MSHookMessageEx(_logos_class$MixSpringBoard$SBDarkeningImageView, @selector(setImage:brightness:), (IMP)&_logos_method$MixSpringBoard$SBDarkeningImageView$setImage$brightness$, (IMP*)&_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$brightness$);}
        {Class _logos_class$MixStatusBar$SBStatusBarStateAggregator = objc_getClass("SBStatusBarStateAggregator"); MSHookMessageEx(_logos_class$MixStatusBar$SBStatusBarStateAggregator, @selector(_resetTimeItemFormatter), (IMP)&_logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter, (IMP*)&_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter);MSHookMessageEx(_logos_class$MixStatusBar$SBStatusBarStateAggregator, @selector(_setItem:enabled:), (IMP)&_logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$, (IMP*)&_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$);Class _logos_class$MixStatusBar$SBTelephonyManager = objc_getClass("SBTelephonyManager"); MSHookMessageEx(_logos_class$MixStatusBar$SBTelephonyManager, @selector(_reallySetOperatorName:), (IMP)&_logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$, (IMP*)&_logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$);}
        
    } else {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)tryActivate, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    }
}
