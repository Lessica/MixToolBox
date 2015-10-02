#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixSpringBoard.xm"
#import <substrate.h>
#import "define.h"
#import <UIKit/UIKit.h>

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

MBOOL(enabled,NO);
MBOOL(noFolderBackground,NO);
MBOOL(hideNews,NO);
MBOOL(noClockAnimate,NO);
MBOOL(rmSearch,NO);
MBOOL(disVoice,NO);
MBOOL(SBHideIndicator,NO);
MBOOL(rmShadow,NO);
MBOOL(rmYellowDot,NO);
MBOOL(rmBlueDot,NO);
MBOOL(HideDockBackgrouond,NO);
MBOOL(HideAppSwitcherBackground,NO);
MBOOL(rmIconJitter,NO);
MBOOL(rmSpotlightBlur,NO);
MBOOL(rmParallax,NO);
MBOOL(rmWallpaperZoom,NO);
MBOOL(AllTransparent,NO);
MBOOL(AllReplaceBlur,NO);
MBOOL(AllReplaceBlur2,NO);
MBOOL(AllBlurGlass,NO);
MBOOL(rmBadgeBackground,NO);
MBOOL(HideBadge,NO);



static void loadPrefs() {
	MAKEPREFS(@"var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
if (prefs) {
  SETBOOL(enabled,"enabled");
  SETBOOL(noFolderBackground,"noFolderBackground");
  SETBOOL(hideNews,"hideNews");
  SETBOOL(noClockAnimate,"noClockAnimate");
  SETBOOL(rmSearch,"rmSearch");
  SETBOOL(disVoice,"disVoice");
  SETBOOL(SBHideIndicator,"SBHideIndicator");
  SETBOOL(rmShadow,"rmShadow");
  SETBOOL(rmYellowDot,"rmYellowDot");
  SETBOOL(rmBlueDot,"rmBlueDot");
  SETBOOL(HideDockBackgrouond,"HideDockBackgrouond");
  SETBOOL(HideAppSwitcherBackground,"HideAppSwitcherBackground");
  SETBOOL(rmIconJitter,"rmIconJitter");
  SETBOOL(rmSpotlightBlur,"rmSpotlightBlur");
  SETBOOL(rmParallax,"rmParallax");
  SETBOOL(rmWallpaperZoom,"rmWallpaperZoom");
  SETBOOL(AllTransparent,"AllTransparent");
  SETBOOL(AllReplaceBlur,"AllReplaceBlur");
  SETBOOL(AllReplaceBlur2,"AllReplaceBlur2");
  SETBOOL(AllBlurGlass,"AllBlurGlass");
  SETBOOL(rmBadgeBackground,"rmBadgeBackground");
  SETBOOL(HideBadge,"HideBadge");
  }
[prefs release];
}

static __attribute__((constructor)) void _logosLocalCtor_b80a3c95() {
CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),NULL,(CFNotificationCallback)loadPrefs,CFSTR("com.jc.MixToolBox/changed"),NULL,CFNotificationSuspensionBehaviorCoalesce);
loadPrefs();
}


#include <logos/logos.h>
#include <substrate.h>
@class _UIBackdropViewSettings; @class SBFWallpaperView; @class SBFWallpaperSettings; @class SBVoiceControlController; @class SBSearchScrollView; @class SBIconColorSettings; @class SBDockView; @class SBWallpaperController; @class SBAppParallaxSettings; @class SBIconBetaLabelAccessoryView; @class SBIconPageIndicatorImageSetResult; @class SBIconController; @class SBClockApplicationIconImageView; @class SBIconRecentlyUpdatedLabelAccessoryView; @class SBSearchResultsBackdropView; @class SBFolderIconBackgroundView; @class SBAppSwitcherHomePageCellView; @class SBDarkeningImageView; 
static id (*_logos_orig$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize)(SBFolderIconBackgroundView*, SEL); static id _logos_method$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize(SBFolderIconBackgroundView*, SEL); static bool (*_logos_orig$_ungrouped$SBIconController$isNewsstandSupported)(SBIconController*, SEL); static bool _logos_method$_ungrouped$SBIconController$isNewsstandSupported(SBIconController*, SEL); static void (*_logos_orig$_ungrouped$SBClockApplicationIconImageView$_setAnimating$)(SBClockApplicationIconImageView*, SEL, bool); static void _logos_method$_ungrouped$SBClockApplicationIconImageView$_setAnimating$(SBClockApplicationIconImageView*, SEL, bool); static bool (*_logos_orig$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$)(SBSearchScrollView*, SEL, id); static bool _logos_method$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$(SBSearchScrollView*, SEL, id); static id (*_logos_orig$_ungrouped$SBVoiceControlController$init)(SBVoiceControlController*, SEL); static id _logos_method$_ungrouped$SBVoiceControlController$init(SBVoiceControlController*, SEL); static id (*_logos_orig$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$)(SBIconPageIndicatorImageSetResult*, SEL, id, id); static id _logos_method$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(SBIconPageIndicatorImageSetResult*, SEL, id, id); static float (*_logos_orig$_ungrouped$SBFWallpaperView$contrast)(SBFWallpaperView*, SEL); static float _logos_method$_ungrouped$SBFWallpaperView$contrast(SBFWallpaperView*, SEL); static id (*_logos_orig$_ungrouped$SBIconBetaLabelAccessoryView$init)(SBIconBetaLabelAccessoryView*, SEL); static id _logos_method$_ungrouped$SBIconBetaLabelAccessoryView$init(SBIconBetaLabelAccessoryView*, SEL); static id (*_logos_orig$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init)(SBIconRecentlyUpdatedLabelAccessoryView*, SEL); static id _logos_method$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init(SBIconRecentlyUpdatedLabelAccessoryView*, SEL); static void (*_logos_orig$_ungrouped$SBDockView$layoutSubviews)(SBDockView*, SEL); static void _logos_method$_ungrouped$SBDockView$layoutSubviews(SBDockView*, SEL); static void (*_logos_orig$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews)(SBAppSwitcherHomePageCellView*, SEL); static void _logos_method$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews(SBAppSwitcherHomePageCellView*, SEL); static BOOL (*_logos_orig$_ungrouped$SBIconColorSettings$suppressJitter)(SBIconColorSettings*, SEL); static BOOL _logos_method$_ungrouped$SBIconColorSettings$suppressJitter(SBIconColorSettings*, SEL); static bool (*_logos_orig$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics)(SBSearchResultsBackdropView*, SEL); static bool _logos_method$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics(SBSearchResultsBackdropView*, SEL); static id (*_logos_orig$_ungrouped$SBSearchResultsBackdropView$initWithFrame$)(SBSearchResultsBackdropView*, SEL, CGRect); static id _logos_method$_ungrouped$SBSearchResultsBackdropView$initWithFrame$(SBSearchResultsBackdropView*, SEL, CGRect); static id (*_logos_orig$_ungrouped$SBAppParallaxSettings$iconSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$_ungrouped$SBAppParallaxSettings$iconSettings(SBAppParallaxSettings*, SEL); static id (*_logos_orig$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings(SBAppParallaxSettings*, SEL); static id (*_logos_orig$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings)(SBAppParallaxSettings*, SEL); static id _logos_method$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings(SBAppParallaxSettings*, SEL); static void (*_logos_orig$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$)(SBAppParallaxSettings*, SEL, id); static void _logos_method$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$(SBAppParallaxSettings*, SEL, id); static void (*_logos_orig$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$)(SBAppParallaxSettings*, SEL, id); static void _logos_method$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$(SBAppParallaxSettings*, SEL, id); static void (*_logos_orig$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$)(SBWallpaperController*, SEL, float); static void _logos_method$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$(SBWallpaperController*, SEL, float); static BOOL (*_logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs)(SBFWallpaperSettings*, SEL); static BOOL _logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs(SBFWallpaperSettings*, SEL); static double (*_logos_orig$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha)(_UIBackdropViewSettings*, SEL); static double _logos_method$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha(_UIBackdropViewSettings*, SEL); static id (*_logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$)(_UIBackdropViewSettings*, SEL, long long); static id _logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_UIBackdropViewSettings*, SEL, long long); static double (*_logos_orig$_ungrouped$_UIBackdropViewSettings$blurRadius)(_UIBackdropViewSettings*, SEL); static double _logos_method$_ungrouped$_UIBackdropViewSettings$blurRadius(_UIBackdropViewSettings*, SEL); static void (*_logos_orig$_ungrouped$_UIBackdropViewSettings$setZoomsBack$)(_UIBackdropViewSettings*, SEL, bool); static void _logos_method$_ungrouped$_UIBackdropViewSettings$setZoomsBack$(_UIBackdropViewSettings*, SEL, bool); static void (*_logos_orig$_ungrouped$SBDarkeningImageView$setImage$)(SBDarkeningImageView*, SEL, id); static void _logos_method$_ungrouped$SBDarkeningImageView$setImage$(SBDarkeningImageView*, SEL, id); static void (*_logos_orig$_ungrouped$SBDarkeningImageView$setImage$brightness$)(SBDarkeningImageView*, SEL, id, double); static void _logos_method$_ungrouped$SBDarkeningImageView$setImage$brightness$(SBDarkeningImageView*, SEL, id, double); 

#line 72 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixSpringBoard.xm"
  
static id _logos_method$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize(SBFolderIconBackgroundView* self, SEL _cmd) {
    if (noFolderBackground && enabled)
   return NULL;
   return _logos_orig$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize(self, _cmd);
}



   
static bool _logos_method$_ungrouped$SBIconController$isNewsstandSupported(SBIconController* self, SEL _cmd) {
  if (hideNews && enabled)
  return FALSE;
  return _logos_orig$_ungrouped$SBIconController$isNewsstandSupported(self, _cmd);
}


 
static void _logos_method$_ungrouped$SBClockApplicationIconImageView$_setAnimating$(SBClockApplicationIconImageView* self, SEL _cmd, bool removeA) {
  if (noClockAnimate && enabled)
    removeA = FALSE;
  _logos_orig$_ungrouped$SBClockApplicationIconImageView$_setAnimating$(self, _cmd, removeA);
}


 
static bool _logos_method$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$(SBSearchScrollView* self, SEL _cmd, id arg1) {
  if (rmSearch && enabled)
  return FALSE;
  return _logos_orig$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);
}


  
static id _logos_method$_ungrouped$SBVoiceControlController$init(SBVoiceControlController* self, SEL _cmd) {
      if (disVoice && enabled)
        return NULL;
      return _logos_orig$_ungrouped$SBVoiceControlController$init(self, _cmd);
}


 
static id _logos_method$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(SBIconPageIndicatorImageSetResult* self, SEL _cmd, id arg1, id arg2) {
  _logos_orig$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(self, _cmd, arg1,arg2);
  if (SBHideIndicator && enabled)
  return NULL;
  return _logos_orig$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$(self, _cmd, arg1, arg2);
}


 
static float _logos_method$_ungrouped$SBFWallpaperView$contrast(SBFWallpaperView* self, SEL _cmd) {
  if (rmShadow && enabled)
  return 0.f;
  return _logos_orig$_ungrouped$SBFWallpaperView$contrast(self, _cmd);
}


 
static id _logos_method$_ungrouped$SBIconBetaLabelAccessoryView$init(SBIconBetaLabelAccessoryView* self, SEL _cmd) {
  if (rmYellowDot && enabled)
  return nil;
  return _logos_orig$_ungrouped$SBIconBetaLabelAccessoryView$init(self, _cmd);
}


 
static id _logos_method$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init(SBIconRecentlyUpdatedLabelAccessoryView* self, SEL _cmd) {
  if (rmBlueDot && enabled)
  return nil;
  return _logos_orig$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init(self, _cmd);
}


 
static void _logos_method$_ungrouped$SBDockView$layoutSubviews(SBDockView* self, SEL _cmd) {
  if (HideDockBackgrouond && enabled)
  return  ;
  _logos_orig$_ungrouped$SBDockView$layoutSubviews(self, _cmd);
}


 
static void _logos_method$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews(SBAppSwitcherHomePageCellView* self, SEL _cmd) {
  if (HideAppSwitcherBackground && enabled)
  return ;
  _logos_orig$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews(self, _cmd);
}


 
static BOOL _logos_method$_ungrouped$SBIconColorSettings$suppressJitter(SBIconColorSettings* self, SEL _cmd) {
  if (rmIconJitter && enabled)
    return TRUE;
  return _logos_orig$_ungrouped$SBIconColorSettings$suppressJitter(self, _cmd);
}


 
static bool _logos_method$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics(SBSearchResultsBackdropView* self, SEL _cmd) {
  if (rmSpotlightBlur && enabled)
    return FALSE;
  return _logos_orig$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics(self, _cmd);
}

static id _logos_method$_ungrouped$SBSearchResultsBackdropView$initWithFrame$(SBSearchResultsBackdropView* self, SEL _cmd, CGRect arg1) {
  if (rmSpotlightBlur && enabled)
    return NULL;
  return _logos_orig$_ungrouped$SBSearchResultsBackdropView$initWithFrame$(self, _cmd, arg1);
}


 
static id _logos_method$_ungrouped$SBAppParallaxSettings$iconSettings(SBAppParallaxSettings* self, SEL _cmd) {
  if (rmParallax && enabled)
    return NULL;
  return _logos_orig$_ungrouped$SBAppParallaxSettings$iconSettings(self, _cmd);
}

static id _logos_method$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings(SBAppParallaxSettings* self, SEL _cmd) {
  if (rmParallax && enabled)
    return NULL;
  return _logos_orig$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings(self, _cmd);
}

static id _logos_method$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings(SBAppParallaxSettings* self, SEL _cmd) {
  if (rmParallax && enabled)
    return NULL;
  return _logos_orig$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings(self, _cmd);
}

static void _logos_method$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$(SBAppParallaxSettings* self, SEL _cmd, id lock) {
  if (rmParallax && enabled)
    lock = 0;
  _logos_orig$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$(self, _cmd, lock);
}

static void _logos_method$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$(SBAppParallaxSettings* self, SEL _cmd, id home) {
  if (rmParallax && enabled)
    home = 0;
  _logos_orig$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$(self, _cmd, home);
}


 
static void _logos_method$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$(SBWallpaperController* self, SEL _cmd, float wallpaper) {
  if (rmWallpaperZoom && enabled)
  { wallpaper = 1; }
else {
  _logos_orig$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$(self, _cmd, wallpaper);
}
}


 
static BOOL _logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs(SBFWallpaperSettings* self, SEL _cmd) {
  if (AllReplaceBlur && enabled)
    return TRUE;
  return _logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs(self, _cmd);
}


 
static double _logos_method$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha(_UIBackdropViewSettings* self, SEL _cmd) { 
  if (AllBlurGlass && enabled)
    return 0;
  return _logos_orig$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha(self, _cmd);
}

static id _logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_UIBackdropViewSettings* self, SEL _cmd, long long qualityblur) { 
 if (AllTransparent && enabled)
  return NULL;
return _logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(self, _cmd, qualityblur);
}

static double _logos_method$_ungrouped$_UIBackdropViewSettings$blurRadius(_UIBackdropViewSettings* self, SEL _cmd) { 
  if (AllReplaceBlur2 && enabled)
    return 60;
  return _logos_orig$_ungrouped$_UIBackdropViewSettings$blurRadius(self, _cmd);
}

static void _logos_method$_ungrouped$_UIBackdropViewSettings$setZoomsBack$(_UIBackdropViewSettings* self, SEL _cmd, bool zoomsback) { 
  if (AllReplaceBlur2 && enabled)
    zoomsback = 0;
  _logos_orig$_ungrouped$_UIBackdropViewSettings$setZoomsBack$(self, _cmd, zoomsback);
}



static void _logos_method$_ungrouped$SBDarkeningImageView$setImage$(SBDarkeningImageView* self, SEL _cmd, id jbbj) { 
  if (rmBadgeBackground && enabled)
    return ;
  _logos_orig$_ungrouped$SBDarkeningImageView$setImage$(self, _cmd, jbbj);
}

static void _logos_method$_ungrouped$SBDarkeningImageView$setImage$brightness$(SBDarkeningImageView* self, SEL _cmd, id image1, double image2){ 
if (HideBadge && enabled)
return ;
_logos_orig$_ungrouped$SBDarkeningImageView$setImage$brightness$(self, _cmd, image1, image2);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFolderIconBackgroundView = objc_getClass("SBFolderIconBackgroundView"); MSHookMessageEx(_logos_class$_ungrouped$SBFolderIconBackgroundView, @selector(initWithDefaultSize), (IMP)&_logos_method$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize, (IMP*)&_logos_orig$_ungrouped$SBFolderIconBackgroundView$initWithDefaultSize);Class _logos_class$_ungrouped$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$_ungrouped$SBIconController, @selector(isNewsstandSupported), (IMP)&_logos_method$_ungrouped$SBIconController$isNewsstandSupported, (IMP*)&_logos_orig$_ungrouped$SBIconController$isNewsstandSupported);Class _logos_class$_ungrouped$SBClockApplicationIconImageView = objc_getClass("SBClockApplicationIconImageView"); MSHookMessageEx(_logos_class$_ungrouped$SBClockApplicationIconImageView, @selector(_setAnimating:), (IMP)&_logos_method$_ungrouped$SBClockApplicationIconImageView$_setAnimating$, (IMP*)&_logos_orig$_ungrouped$SBClockApplicationIconImageView$_setAnimating$);Class _logos_class$_ungrouped$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$_ungrouped$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$_ungrouped$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$_ungrouped$SBVoiceControlController = objc_getClass("SBVoiceControlController"); MSHookMessageEx(_logos_class$_ungrouped$SBVoiceControlController, @selector(init), (IMP)&_logos_method$_ungrouped$SBVoiceControlController$init, (IMP*)&_logos_orig$_ungrouped$SBVoiceControlController$init);Class _logos_class$_ungrouped$SBIconPageIndicatorImageSetResult = objc_getClass("SBIconPageIndicatorImageSetResult"); MSHookMessageEx(_logos_class$_ungrouped$SBIconPageIndicatorImageSetResult, @selector(initWithIndicatorSet:enabledIndicatorSet:), (IMP)&_logos_method$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$, (IMP*)&_logos_orig$_ungrouped$SBIconPageIndicatorImageSetResult$initWithIndicatorSet$enabledIndicatorSet$);Class _logos_class$_ungrouped$SBFWallpaperView = objc_getClass("SBFWallpaperView"); MSHookMessageEx(_logos_class$_ungrouped$SBFWallpaperView, @selector(contrast), (IMP)&_logos_method$_ungrouped$SBFWallpaperView$contrast, (IMP*)&_logos_orig$_ungrouped$SBFWallpaperView$contrast);Class _logos_class$_ungrouped$SBIconBetaLabelAccessoryView = objc_getClass("SBIconBetaLabelAccessoryView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconBetaLabelAccessoryView, @selector(init), (IMP)&_logos_method$_ungrouped$SBIconBetaLabelAccessoryView$init, (IMP*)&_logos_orig$_ungrouped$SBIconBetaLabelAccessoryView$init);Class _logos_class$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView = objc_getClass("SBIconRecentlyUpdatedLabelAccessoryView"); MSHookMessageEx(_logos_class$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView, @selector(init), (IMP)&_logos_method$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init, (IMP*)&_logos_orig$_ungrouped$SBIconRecentlyUpdatedLabelAccessoryView$init);Class _logos_class$_ungrouped$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$_ungrouped$SBDockView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBDockView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBDockView$layoutSubviews);Class _logos_class$_ungrouped$SBAppSwitcherHomePageCellView = objc_getClass("SBAppSwitcherHomePageCellView"); MSHookMessageEx(_logos_class$_ungrouped$SBAppSwitcherHomePageCellView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBAppSwitcherHomePageCellView$layoutSubviews);Class _logos_class$_ungrouped$SBIconColorSettings = objc_getClass("SBIconColorSettings"); MSHookMessageEx(_logos_class$_ungrouped$SBIconColorSettings, @selector(suppressJitter), (IMP)&_logos_method$_ungrouped$SBIconColorSettings$suppressJitter, (IMP*)&_logos_orig$_ungrouped$SBIconColorSettings$suppressJitter);Class _logos_class$_ungrouped$SBSearchResultsBackdropView = objc_getClass("SBSearchResultsBackdropView"); MSHookMessageEx(_logos_class$_ungrouped$SBSearchResultsBackdropView, @selector(useHighQualityGraphics), (IMP)&_logos_method$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics, (IMP*)&_logos_orig$_ungrouped$SBSearchResultsBackdropView$useHighQualityGraphics);MSHookMessageEx(_logos_class$_ungrouped$SBSearchResultsBackdropView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$SBSearchResultsBackdropView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$SBSearchResultsBackdropView$initWithFrame$);Class _logos_class$_ungrouped$SBAppParallaxSettings = objc_getClass("SBAppParallaxSettings"); MSHookMessageEx(_logos_class$_ungrouped$SBAppParallaxSettings, @selector(iconSettings), (IMP)&_logos_method$_ungrouped$SBAppParallaxSettings$iconSettings, (IMP*)&_logos_orig$_ungrouped$SBAppParallaxSettings$iconSettings);MSHookMessageEx(_logos_class$_ungrouped$SBAppParallaxSettings, @selector(lockscreenWallpaperSettings), (IMP)&_logos_method$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings, (IMP*)&_logos_orig$_ungrouped$SBAppParallaxSettings$lockscreenWallpaperSettings);MSHookMessageEx(_logos_class$_ungrouped$SBAppParallaxSettings, @selector(homescreenWallpaperSettings), (IMP)&_logos_method$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings, (IMP*)&_logos_orig$_ungrouped$SBAppParallaxSettings$homescreenWallpaperSettings);MSHookMessageEx(_logos_class$_ungrouped$SBAppParallaxSettings, @selector(setLockscreenWallpaperSettings:), (IMP)&_logos_method$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$, (IMP*)&_logos_orig$_ungrouped$SBAppParallaxSettings$setLockscreenWallpaperSettings$);MSHookMessageEx(_logos_class$_ungrouped$SBAppParallaxSettings, @selector(setHomescreenWallpaperSettings:), (IMP)&_logos_method$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$, (IMP*)&_logos_orig$_ungrouped$SBAppParallaxSettings$setHomescreenWallpaperSettings$);Class _logos_class$_ungrouped$SBWallpaperController = objc_getClass("SBWallpaperController"); MSHookMessageEx(_logos_class$_ungrouped$SBWallpaperController, @selector(setHomescreenWallpaperScale:), (IMP)&_logos_method$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$, (IMP*)&_logos_orig$_ungrouped$SBWallpaperController$setHomescreenWallpaperScale$);Class _logos_class$_ungrouped$SBFWallpaperSettings = objc_getClass("SBFWallpaperSettings"); MSHookMessageEx(_logos_class$_ungrouped$SBFWallpaperSettings, @selector(replaceBlurs), (IMP)&_logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs, (IMP*)&_logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs);Class _logos_class$_ungrouped$_UIBackdropViewSettings = objc_getClass("_UIBackdropViewSettings"); MSHookMessageEx(_logos_class$_ungrouped$_UIBackdropViewSettings, @selector(grayscaleTintAlpha), (IMP)&_logos_method$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha, (IMP*)&_logos_orig$_ungrouped$_UIBackdropViewSettings$grayscaleTintAlpha);MSHookMessageEx(_logos_class$_ungrouped$_UIBackdropViewSettings, @selector(initWithDefaultValuesForGraphicsQuality:), (IMP)&_logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$, (IMP*)&_logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$);MSHookMessageEx(_logos_class$_ungrouped$_UIBackdropViewSettings, @selector(blurRadius), (IMP)&_logos_method$_ungrouped$_UIBackdropViewSettings$blurRadius, (IMP*)&_logos_orig$_ungrouped$_UIBackdropViewSettings$blurRadius);MSHookMessageEx(_logos_class$_ungrouped$_UIBackdropViewSettings, @selector(setZoomsBack:), (IMP)&_logos_method$_ungrouped$_UIBackdropViewSettings$setZoomsBack$, (IMP*)&_logos_orig$_ungrouped$_UIBackdropViewSettings$setZoomsBack$);Class _logos_class$_ungrouped$SBDarkeningImageView = objc_getClass("SBDarkeningImageView"); MSHookMessageEx(_logos_class$_ungrouped$SBDarkeningImageView, @selector(setImage:), (IMP)&_logos_method$_ungrouped$SBDarkeningImageView$setImage$, (IMP*)&_logos_orig$_ungrouped$SBDarkeningImageView$setImage$);MSHookMessageEx(_logos_class$_ungrouped$SBDarkeningImageView, @selector(setImage:brightness:), (IMP)&_logos_method$_ungrouped$SBDarkeningImageView$setImage$brightness$, (IMP*)&_logos_orig$_ungrouped$SBDarkeningImageView$setImage$brightness$);} }
#line 273 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixSpringBoard.xm"
