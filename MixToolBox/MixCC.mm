#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixCC.xm"
#import <substrate.h>
#import <UIKit/UIKit.h>
#import "define.h"
#import "MixStore.h"

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


MBOOL(enabled, NO);
MBOOL(removeCC, NO);
MBOOL(noFirstSlideCC, NO);
MBOOL(ccOldBound, NO);
MBOOL(enabledCCScale, NO);
static double scale = 0.0;
MBOOL(hideCCRules, NO);
MBOOL(fixLockShowCC, NO);
MBOOL(hideSwitching, NO);
MBOOL(hideBrightness, NO);
MBOOL(hideMedia, NO);
MBOOL(hideAirad, NO);

MBOOL(hideQuickLaunch, NO);
MBOOL(hideCCBlur, NO);
MBOOL(hideCCBackground, NO);

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
    }
    [prefs release];
}

#include <logos/logos.h>
#include <substrate.h>
@class SBControlCenterContentContainerView; @class SBCCMediaControlsSectionController; @class SBControlCenterKnockoutView; @class SBCCButtonLikeSectionView; @class SBControlCenterController; @class SBControlCenterSettings; @class SBCCBrightnessSectionController; @class SBCCQuickLaunchSectionController; @class SBUIController; @class SBCCAirStuffSectionController; @class SBControlCenterViewController; @class SBCCSettingsSectionController; 


#line 170 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixCC.xm"
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




static __attribute__((constructor)) void _logosLocalCtor_eb899c71() {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        {Class _logos_class$MixCC$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$MixCC$SBUIController, @selector(handleShowControlCenterSystemGesture:), (IMP)&_logos_method$MixCC$SBUIController$handleShowControlCenterSystemGesture$, (IMP*)&_logos_orig$MixCC$SBUIController$handleShowControlCenterSystemGesture$);MSHookMessageEx(_logos_class$MixCC$SBUIController, @selector(shouldShowControlCenterTabControlOnFirstSwipe), (IMP)&_logos_method$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$MixCC$SBUIController$shouldShowControlCenterTabControlOnFirstSwipe);Class _logos_class$MixCC$SBControlCenterSettings = objc_getClass("SBControlCenterSettings"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterSettings, @selector(useNewBounce), (IMP)&_logos_method$MixCC$SBControlCenterSettings$useNewBounce, (IMP*)&_logos_orig$MixCC$SBControlCenterSettings$useNewBounce);Class _logos_class$MixCC$SBControlCenterViewController = objc_getClass("SBControlCenterViewController"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterViewController, @selector(loadView), (IMP)&_logos_method$MixCC$SBControlCenterViewController$loadView, (IMP*)&_logos_orig$MixCC$SBControlCenterViewController$loadView);Class _logos_class$MixCC$SBControlCenterKnockoutView = objc_getClass("SBControlCenterKnockoutView"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterKnockoutView, @selector(setHidden:), (IMP)&_logos_method$MixCC$SBControlCenterKnockoutView$setHidden$, (IMP*)&_logos_orig$MixCC$SBControlCenterKnockoutView$setHidden$);Class _logos_class$MixCC$SBCCBrightnessSectionController = objc_getClass("SBCCBrightnessSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(_shouldDarkenBackground), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$_shouldDarkenBackground);MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCBrightnessSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCBrightnessSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCButtonLikeSectionView = objc_getClass("SBCCButtonLikeSectionView"); MSHookMessageEx(_logos_class$MixCC$SBCCButtonLikeSectionView, @selector(layoutSubviews), (IMP)&_logos_method$MixCC$SBCCButtonLikeSectionView$layoutSubviews, (IMP*)&_logos_orig$MixCC$SBCCButtonLikeSectionView$layoutSubviews);Class _logos_class$MixCC$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterController, @selector(isUILocked), (IMP)&_logos_method$MixCC$SBControlCenterController$isUILocked, (IMP*)&_logos_orig$MixCC$SBControlCenterController$isUILocked);Class _logos_class$MixCC$SBCCSettingsSectionController = objc_getClass("SBCCSettingsSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCSettingsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCSettingsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCSettingsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCSettingsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCSettingsSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCMediaControlsSectionController = objc_getClass("SBCCMediaControlsSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCMediaControlsSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCMediaControlsSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCMediaControlsSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCMediaControlsSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCAirStuffSectionController = objc_getClass("SBCCAirStuffSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCAirStuffSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCAirStuffSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCAirStuffSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCAirStuffSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCAirStuffSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBCCQuickLaunchSectionController = objc_getClass("SBCCQuickLaunchSectionController"); MSHookMessageEx(_logos_class$MixCC$SBCCQuickLaunchSectionController, @selector(enabledForOrientation:), (IMP)&_logos_method$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCQuickLaunchSectionController$enabledForOrientation$);MSHookMessageEx(_logos_class$MixCC$SBCCQuickLaunchSectionController, @selector(contentSizeForOrientation:), (IMP)&_logos_method$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$, (IMP*)&_logos_orig$MixCC$SBCCQuickLaunchSectionController$contentSizeForOrientation$);Class _logos_class$MixCC$SBControlCenterContentContainerView = objc_getClass("SBControlCenterContentContainerView"); MSHookMessageEx(_logos_class$MixCC$SBControlCenterContentContainerView, @selector(layoutSubviews), (IMP)&_logos_method$MixCC$SBControlCenterContentContainerView$layoutSubviews, (IMP*)&_logos_orig$MixCC$SBControlCenterContentContainerView$layoutSubviews);}
    }
}
