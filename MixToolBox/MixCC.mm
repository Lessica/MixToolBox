#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixCC.xm"
#import <substrate.h>
#import <UIKit/UIKit.h>
#import "define.h"

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


MBOOL(enabled,NO);
MBOOL(removeCC,NO);
MBOOL(noFirstSlideCC,NO);
MBOOL(ccOldBound,NO);
MBOOL(enabledCCScale,NO);
static double scale = 0.0;
MBOOL(hideCCRules,NO);
MBOOL(fixLockShowCC,NO);
MBOOL(hideSwitching,NO);
MBOOL(hideBrightness,NO);
MBOOL(hideMedia,NO);
MBOOL(hideAirad,NO);

MBOOL(hideQuickLaunch,NO);
MBOOL(hideCCBlur,NO);
MBOOL(hideCCBackground,NO);

static void loadPrefs() {
    MAKEPREFS(@"var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
    if (prefs) {
        SETBOOL(enabled,"enabled");
        SETBOOL(removeCC,"removeCC");
        SETBOOL(noFirstSlideCC,"noFirstSlideCC");
        SETBOOL(ccOldBound,"ccOldBound");
        SETBOOL(enabledCCScale,"enabledCCScale");
        SETBOOL(hideCCRules,"hideCCRules");
        SETBOOL(fixLockShowCC,"fixLockShowCC");
        SETBOOL(hideSwitching,"hideSwitching");
        SETBOOL(hideBrightness,"hideBrightness");
        SETBOOL(hideMedia,"hideMedia");
        SETBOOL(hideAirad,"hideAirad");
        
        SETBOOL(hideQuickLaunch,"hideQuickLaunch");
        SETBOOL(hideCCBlur,"hideCCBlur");
        SETBOOL(hideCCBackground,"hideCCBackground");
        SETDOUBLE(scale,"scale");
    }
    [prefs release];
}

static __attribute__((constructor)) void _logosLocalCtor_b2403fe0() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}

#include <logos/logos.h>
#include <substrate.h>
@class SBCCButtonLikeSectionView; @class SBCCQuickLaunchSectionController; @class SBControlCenterSettings; @class SBCCAirStuffSectionController; @class SBControlCenterKnockoutView; @class SBControlCenterViewController; @class SBUIController; @class SBCCSettingsSectionController; @class SBCCBrightnessSectionController; @class SBCCMediaControlsSectionController; @class SBControlCenterContentContainerView; @class SBControlCenterController; 
static void (*_logos_orig$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$)(SBUIController*, SEL, id); static void _logos_method$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$(SBUIController*, SEL, id); static BOOL (*_logos_orig$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe)(SBUIController*, SEL); static BOOL _logos_method$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(SBUIController*, SEL); static BOOL (*_logos_orig$_ungrouped$SBControlCenterSettings$useNewBounce)(SBControlCenterSettings*, SEL); static BOOL _logos_method$_ungrouped$SBControlCenterSettings$useNewBounce(SBControlCenterSettings*, SEL); static void (*_logos_orig$_ungrouped$SBControlCenterViewController$loadView)(SBControlCenterViewController*, SEL); static void _logos_method$_ungrouped$SBControlCenterViewController$loadView(SBControlCenterViewController*, SEL); static void (*_logos_orig$_ungrouped$SBControlCenterKnockoutView$setHidden$)(SBControlCenterKnockoutView*, SEL, BOOL); static void _logos_method$_ungrouped$SBControlCenterKnockoutView$setHidden$(SBControlCenterKnockoutView*, SEL, BOOL); static bool (*_logos_orig$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground)(SBCCBrightnessSectionController*, SEL); static bool _logos_method$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground(SBCCBrightnessSectionController*, SEL); static BOOL (*_logos_orig$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$)(SBCCBrightnessSectionController*, SEL, int); static BOOL _logos_method$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$(SBCCBrightnessSectionController*, SEL, int); static CGSize (*_logos_orig$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$)(SBCCBrightnessSectionController*, SEL, int); static CGSize _logos_method$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$(SBCCBrightnessSectionController*, SEL, int); static void (*_logos_orig$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews)(SBCCButtonLikeSectionView*, SEL); static void _logos_method$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews(SBCCButtonLikeSectionView*, SEL); static BOOL (*_logos_orig$_ungrouped$SBControlCenterController$isUILocked)(SBControlCenterController*, SEL); static BOOL _logos_method$_ungrouped$SBControlCenterController$isUILocked(SBControlCenterController*, SEL); static BOOL (*_logos_orig$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$)(SBCCSettingsSectionController*, SEL, int); static BOOL _logos_method$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$(SBCCSettingsSectionController*, SEL, int); static CGSize (*_logos_orig$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$)(SBCCSettingsSectionController*, SEL, int); static CGSize _logos_method$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$(SBCCSettingsSectionController*, SEL, int); static BOOL (*_logos_orig$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$)(SBCCMediaControlsSectionController*, SEL, int); static BOOL _logos_method$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$(SBCCMediaControlsSectionController*, SEL, int); static CGSize (*_logos_orig$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$)(SBCCMediaControlsSectionController*, SEL, int); static CGSize _logos_method$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$(SBCCMediaControlsSectionController*, SEL, int); static BOOL (*_logos_orig$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$)(SBCCAirStuffSectionController*, SEL, int); static BOOL _logos_method$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$(SBCCAirStuffSectionController*, SEL, int); static CGSize (*_logos_orig$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$)(SBCCAirStuffSectionController*, SEL, int); static CGSize _logos_method$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$(SBCCAirStuffSectionController*, SEL, int); static BOOL (*_logos_orig$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$)(SBCCQuickLaunchSectionController*, SEL, int); static BOOL _logos_method$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$(SBCCQuickLaunchSectionController*, SEL, int); static CGSize (*_logos_orig$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$)(SBCCQuickLaunchSectionController*, SEL, int); static CGSize _logos_method$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$(SBCCQuickLaunchSectionController*, SEL, int); static void (*_logos_orig$_ungrouped$SBControlCenterContentContainerView$layoutSubviews)(SBControlCenterContentContainerView*, SEL); static void _logos_method$_ungrouped$SBControlCenterContentContainerView$layoutSubviews(SBControlCenterContentContainerView*, SEL); 

#line 175 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixCC.xm"

static void _logos_method$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$(SBUIController* self, SEL _cmd, id gesture) {
    if (removeCC && enabled) {
        
    } else {
        _logos_orig$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$(self, _cmd, gesture);
    }
}

static BOOL _logos_method$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(SBUIController* self, SEL _cmd) {
    if (noFirstSlideCC && enabled) {
        return YES;
    } else {
        return _logos_orig$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe(self, _cmd);
    }
}



static BOOL _logos_method$_ungrouped$SBControlCenterSettings$useNewBounce(SBControlCenterSettings* self, SEL _cmd) {
    if (ccOldBound && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBControlCenterSettings$useNewBounce(self, _cmd);
    }
}



static void _logos_method$_ungrouped$SBControlCenterViewController$loadView(SBControlCenterViewController* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBControlCenterViewController$loadView(self, _cmd);
    if (enabledCCScale && scale && enabled) {
        [MSHookIvar<SBControlCenterContainerView *>(self, "_containerView") setTransform:CATransform3DGetAffineTransform(CATransform3DMakeScale(scale, scale, 0))];
    }
}



static void _logos_method$_ungrouped$SBControlCenterKnockoutView$setHidden$(SBControlCenterKnockoutView* self, SEL _cmd, BOOL hidden) {
    if (hideCCRules && enabled) {
        return _logos_orig$_ungrouped$SBControlCenterKnockoutView$setHidden$(self, _cmd, YES);
    } else {
        return _logos_orig$_ungrouped$SBControlCenterKnockoutView$setHidden$(self, _cmd, NO);
    }
}



static bool _logos_method$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground(SBCCBrightnessSectionController* self, SEL _cmd) {
    if (hideCCRules && enabled) {
        return FALSE;
    } else {
        return _logos_orig$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground(self, _cmd);
    }
}



static void _logos_method$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews(SBCCButtonLikeSectionView* self, SEL _cmd){
    _logos_orig$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews(self, _cmd);
    if (hideCCRules && enabled) {
        UIVisualEffectView *vibrantDarkenLayer = MSHookIvar<UIVisualEffectView *>(self, "_vibrantDarkenLayer");
        vibrantDarkenLayer.alpha = 0.0;
    }
}



static BOOL _logos_method$_ungrouped$SBControlCenterController$isUILocked(SBControlCenterController* self, SEL _cmd) {
    if (fixLockShowCC && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBControlCenterController$isUILocked(self, _cmd);
    }
}



static BOOL _logos_method$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$(SBCCSettingsSectionController* self, SEL _cmd, int orientation) {
    if (hideSwitching && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$(SBCCSettingsSectionController* self, SEL _cmd, int orientation) {
    if (hideSwitching && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$(SBCCBrightnessSectionController* self, SEL _cmd, int orientation) {
    if (hideBrightness && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$(SBCCBrightnessSectionController* self, SEL _cmd, int orientation) {
    if (hideBrightness && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$(SBCCMediaControlsSectionController* self, SEL _cmd, int orientation) {
    if (hideMedia && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$(SBCCMediaControlsSectionController* self, SEL _cmd, int orientation) {
    if (hideMedia && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$(SBCCAirStuffSectionController* self, SEL _cmd, int orientation) {
    
    if (hideAirad && enabled) {
        
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$(SBCCAirStuffSectionController* self, SEL _cmd, int orientation) {
    if (hideAirad && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static BOOL _logos_method$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$(SBCCQuickLaunchSectionController* self, SEL _cmd, int orientation) {
    if (hideQuickLaunch && enabled) {
        return NO;
    } else {
        return _logos_orig$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$(self, _cmd, orientation);
    }
}

static CGSize _logos_method$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$(SBCCQuickLaunchSectionController* self, SEL _cmd, int orientation) {
    if (hideQuickLaunch && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return _logos_orig$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$(self, _cmd, orientation);
    }
}



static void _logos_method$_ungrouped$SBControlCenterContentContainerView$layoutSubviews(SBControlCenterContentContainerView* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBControlCenterContentContainerView$layoutSubviews(self, _cmd);
    _UIBackdropView *backView = MSHookIvar<_UIBackdropView*>(self,"_backdropView");
    if (hideCCBlur && enabled) {
        backView.backgroundColor = [UIColor blackColor];
    }
    if (hideCCBackground && enabled) {
        backView.hidden = YES;
    }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(handleShowControlCenterSystemGesture:), (IMP)&_logos_method$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$, (IMP*)&_logos_orig$_ungrouped$SBUIController$handleShowControlCenterSystemGesture$);MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(shouldShowControlCenterTabControlOnFirstSwipe), (IMP)&_logos_method$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$_ungrouped$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe);Class _logos_class$_ungrouped$SBControlCenterSettings = objc_getClass("SBControlCenterSettings"); MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterSettings, @selector(useNewBounce), (IMP)&_logos_method$_ungrouped$SBControlCenterSettings$useNewBounce, (IMP*)&_logos_orig$_ungrouped$SBControlCenterSettings$useNewBounce);Class _logos_class$_ungrouped$SBControlCenterViewController = objc_getClass("SBControlCenterViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterViewController, @selector(loadView), (IMP)&_logos_method$_ungrouped$SBControlCenterViewController$loadView, (IMP*)&_logos_orig$_ungrouped$SBControlCenterViewController$loadView);Class _logos_class$_ungrouped$SBControlCenterKnockoutView = objc_getClass("SBControlCenterKnockoutView"); MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterKnockoutView, @selector(setHidden:), (IMP)&_logos_method$_ungrouped$SBControlCenterKnockoutView$setHidden$, (IMP*)&_logos_orig$_ungrouped$SBControlCenterKnockoutView$setHidden$);Class _logos_class$_ungrouped$SBCCBrightnessSectionController = objc_getClass("SBCCBrightnessSectionController"); MSHookMessageEx(_logos_class$_ungrouped$SBCCBrightnessSectionController, @selector(_shouldDarkenBackground), (IMP)&_logos_method$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground, (IMP*)&_logos_orig$_ungrouped$SBCCBrightnessSectionController$_shouldDarkenBackground);MSHookMessageEx(_logos_class$_ungrouped$SBCCBrightnessSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCBrightnessSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBCCBrightnessSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCBrightnessSectionController$contentSizeForOrientation$);Class _logos_class$_ungrouped$SBCCButtonLikeSectionView = objc_getClass("SBCCButtonLikeSectionView"); MSHookMessageEx(_logos_class$_ungrouped$SBCCButtonLikeSectionView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBCCButtonLikeSectionView$layoutSubviews);Class _logos_class$_ungrouped$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterController, @selector(isUILocked), (IMP)&_logos_method$_ungrouped$SBControlCenterController$isUILocked, (IMP*)&_logos_orig$_ungrouped$SBControlCenterController$isUILocked);Class _logos_class$_ungrouped$SBCCSettingsSectionController = objc_getClass("SBCCSettingsSectionController"); MSHookMessageEx(_logos_class$_ungrouped$SBCCSettingsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCSettingsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBCCSettingsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCSettingsSectionController$contentSizeForOrientation$);Class _logos_class$_ungrouped$SBCCMediaControlsSectionController = objc_getClass("SBCCMediaControlsSectionController"); MSHookMessageEx(_logos_class$_ungrouped$SBCCMediaControlsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCMediaControlsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBCCMediaControlsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCMediaControlsSectionController$contentSizeForOrientation$);Class _logos_class$_ungrouped$SBCCAirStuffSectionController = objc_getClass("SBCCAirStuffSectionController"); MSHookMessageEx(_logos_class$_ungrouped$SBCCAirStuffSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCAirStuffSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBCCAirStuffSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCAirStuffSectionController$contentSizeForOrientation$);Class _logos_class$_ungrouped$SBCCQuickLaunchSectionController = objc_getClass("SBCCQuickLaunchSectionController"); MSHookMessageEx(_logos_class$_ungrouped$SBCCQuickLaunchSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCQuickLaunchSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$_ungrouped$SBCCQuickLaunchSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$_ungrouped$SBCCQuickLaunchSectionController$contentSizeForOrientation$);Class _logos_class$_ungrouped$SBControlCenterContentContainerView = objc_getClass("SBControlCenterContentContainerView"); MSHookMessageEx(_logos_class$_ungrouped$SBControlCenterContentContainerView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBControlCenterContentContainerView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBControlCenterContentContainerView$layoutSubviews);} }
#line 356 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixCC.xm"
