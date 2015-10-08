#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixSpringBoard.xm"
#import <substrate.h>
#import <UIKit/UIKit.h>
#import "define.h"
#import "MixStore.h"

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

MBOOL(enabled, NO);
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

static void loadPrefs() {
    MAKEPREFS(prefsPath);
    if (prefs) {
        SETBOOL(enabled, "enabled");
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
    }
    [prefs release];
}

#include <logos/logos.h>
#include <substrate.h>
@class SBFWallpaperSettings; @class SBAppSwitcherHomePageCellView; @class SBSearchScrollView; @class SpringBoard; @class SBIconPageIndicatorImageSetResult; @class SBIconRecentlyUpdatedLabelAccessoryView; @class _UIBackdropViewSettings; @class SBDarkeningImageView; @class SBIconBetaLabelAccessoryView; @class SBClockApplicationIconImageView; @class SBFWallpaperView; @class SBIconColorSettings; @class SBVoiceControlController; @class SBFolderIconBackgroundView; @class SBSearchResultsBackdropView; @class SBWallpaperController; @class SBDockView; @class SBAppParallaxSettings; @class SBIconController; 


#line 65 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixSpringBoard.xm"
static void (*_logos_orig$showAlert$SpringBoard$applicationDidFinishLaunching$)(SpringBoard*, SEL, id); static void _logos_method$showAlert$SpringBoard$applicationDidFinishLaunching$(SpringBoard*, SEL, id); 


static void _logos_method$showAlert$SpringBoard$applicationDidFinishLaunching$(SpringBoard* self, SEL _cmd, id application) {
    _logos_orig$showAlert$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
    if ([MixStore sharedInstance].alertType != 0) {
        NSString *message = nil;
        switch ([MixStore sharedInstance].alertType) {
            case 1:
                message = @"未能获取到该设备的购买记录. \n请在 Cydia 中完成 MixToolBox 的购买, 然后注销设备以重试激活. ";
                break;
            case 2:
                message = @"与 MixToolBox 激活服务器通讯失败, 请检查网络连接. ";
                break;
            case 3:
                message = @"我也不知道为什么, 反正这台设备上的授权文件验证失败了. ";
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"激活失败"
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }

}




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


static void _logos_method$MixSpringBoard$SBDarkeningImageView$setImage$brightness$(SBDarkeningImageView* self, SEL _cmd, id image1, double image2){ 
    if (HideBadge && enabled)
        return;
    _logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$brightness$(self, _cmd, image1, image2);
}




static __attribute__((constructor)) void _logosLocalCtor_3aaf24e0() {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        {Class _logos_class$MixSpringBoard$SBFolderIconBackgroundView = objc_getClass("SBFolderIconBackgroundView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFolderIconBackgroundView, @selector(initWithDefaultSize), (IMP)&_logos_method$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize, (IMP*)&_logos_orig$MixSpringBoard$SBFolderIconBackgroundView$initWithDefaultSize);Class _logos_class$MixSpringBoard$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconController, @selector(isNewsstandSupported), (IMP)&_logos_method$MixSpringBoard$SBIconController$isNewsstandSupported, (IMP*)&_logos_orig$MixSpringBoard$SBIconController$isNewsstandSupported);Class _logos_class$MixSpringBoard$SBClockApplicationIconImageView = objc_getClass("SBClockApplicationIconImageView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBClockApplicationIconImageView, @selector(_setAnimating:), (IMP)&_logos_method$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$, (IMP*)&_logos_orig$MixSpringBoard$SBClockApplicationIconImageView$_setAnimating$);Class _logos_class$MixSpringBoard$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$MixSpringBoard$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$MixSpringBoard$SBVoiceControlController = objc_getClass("SBVoiceControlController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBVoiceControlController, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBVoiceControlController$init, (IMP*)&_logos_orig$MixSpringBoard$SBVoiceControlController$init);Class _logos_class$MixSpringBoard$SBIconPageIndicatorImageSetResult = objc_getClass("SBIconPageIndicatorImageSetResult"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconPageIndicatorImageSetResult, @selector(initWithIndicatorSet:enabledIndicatorSet:), (IMP)&_logos_method$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$, (IMP*)&_logos_orig$MixSpringBoard$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$);Class _logos_class$MixSpringBoard$SBFWallpaperView = objc_getClass("SBFWallpaperView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFWallpaperView, @selector(contrast), (IMP)&_logos_method$MixSpringBoard$SBFWallpaperView$contrast, (IMP*)&_logos_orig$MixSpringBoard$SBFWallpaperView$contrast);Class _logos_class$MixSpringBoard$SBIconBetaLabelAccessoryView = objc_getClass("SBIconBetaLabelAccessoryView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconBetaLabelAccessoryView, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBIconBetaLabelAccessoryView$init, (IMP*)&_logos_orig$MixSpringBoard$SBIconBetaLabelAccessoryView$init);Class _logos_class$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView = objc_getClass("SBIconRecentlyUpdatedLabelAccessoryView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView, @selector(init), (IMP)&_logos_method$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init, (IMP*)&_logos_orig$MixSpringBoard$SBIconRecentlyUpdatedLabelAccessoryView$init);Class _logos_class$MixSpringBoard$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBDockView, @selector(layoutSubviews), (IMP)&_logos_method$MixSpringBoard$SBDockView$layoutSubviews, (IMP*)&_logos_orig$MixSpringBoard$SBDockView$layoutSubviews);Class _logos_class$MixSpringBoard$SBAppSwitcherHomePageCellView = objc_getClass("SBAppSwitcherHomePageCellView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBAppSwitcherHomePageCellView, @selector(layoutSubviews), (IMP)&_logos_method$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews, (IMP*)&_logos_orig$MixSpringBoard$SBAppSwitcherHomePageCellView$layoutSubviews);Class _logos_class$MixSpringBoard$SBIconColorSettings = objc_getClass("SBIconColorSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBIconColorSettings, @selector(suppressJitter), (IMP)&_logos_method$MixSpringBoard$SBIconColorSettings$suppressJitter, (IMP*)&_logos_orig$MixSpringBoard$SBIconColorSettings$suppressJitter);Class _logos_class$MixSpringBoard$SBSearchResultsBackdropView = objc_getClass("SBSearchResultsBackdropView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchResultsBackdropView, @selector(useHighQualityGraphics), (IMP)&_logos_method$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics, (IMP*)&_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$useHighQualityGraphics);MSHookMessageEx(_logos_class$MixSpringBoard$SBSearchResultsBackdropView, @selector(initWithFrame:), (IMP)&_logos_method$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$, (IMP*)&_logos_orig$MixSpringBoard$SBSearchResultsBackdropView$initWithFrame$);Class _logos_class$MixSpringBoard$SBAppParallaxSettings = objc_getClass("SBAppParallaxSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(iconSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$iconSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$iconSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(lockscreenWallpaperSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$lockscreenWallpaperSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(homescreenWallpaperSettings), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$homescreenWallpaperSettings);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(setLockscreenWallpaperSettings:), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$setLockscreenWallpaperSettings$);MSHookMessageEx(_logos_class$MixSpringBoard$SBAppParallaxSettings, @selector(setHomescreenWallpaperSettings:), (IMP)&_logos_method$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$, (IMP*)&_logos_orig$MixSpringBoard$SBAppParallaxSettings$setHomescreenWallpaperSettings$);Class _logos_class$MixSpringBoard$SBWallpaperController = objc_getClass("SBWallpaperController"); MSHookMessageEx(_logos_class$MixSpringBoard$SBWallpaperController, @selector(setHomescreenWallpaperScale:), (IMP)&_logos_method$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$, (IMP*)&_logos_orig$MixSpringBoard$SBWallpaperController$setHomescreenWallpaperScale$);Class _logos_class$MixSpringBoard$SBFWallpaperSettings = objc_getClass("SBFWallpaperSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$SBFWallpaperSettings, @selector(replaceBlurs), (IMP)&_logos_method$MixSpringBoard$SBFWallpaperSettings$replaceBlurs, (IMP*)&_logos_orig$MixSpringBoard$SBFWallpaperSettings$replaceBlurs);Class _logos_class$MixSpringBoard$_UIBackdropViewSettings = objc_getClass("_UIBackdropViewSettings"); MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(grayscaleTintAlpha), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$grayscaleTintAlpha);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(initWithDefaultValuesForGraphicsQuality:), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(blurRadius), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$blurRadius, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$blurRadius);MSHookMessageEx(_logos_class$MixSpringBoard$_UIBackdropViewSettings, @selector(setZoomsBack:), (IMP)&_logos_method$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$, (IMP*)&_logos_orig$MixSpringBoard$_UIBackdropViewSettings$setZoomsBack$);Class _logos_class$MixSpringBoard$SBDarkeningImageView = objc_getClass("SBDarkeningImageView"); MSHookMessageEx(_logos_class$MixSpringBoard$SBDarkeningImageView, @selector(setImage:), (IMP)&_logos_method$MixSpringBoard$SBDarkeningImageView$setImage$, (IMP*)&_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$);MSHookMessageEx(_logos_class$MixSpringBoard$SBDarkeningImageView, @selector(setImage:brightness:), (IMP)&_logos_method$MixSpringBoard$SBDarkeningImageView$setImage$brightness$, (IMP*)&_logos_orig$MixSpringBoard$SBDarkeningImageView$setImage$brightness$);}
    } else {
        {Class _logos_class$showAlert$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$showAlert$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$showAlert$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$showAlert$SpringBoard$applicationDidFinishLaunching$);}
    }
}
