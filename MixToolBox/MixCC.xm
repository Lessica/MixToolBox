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

%group MixCC

%hook SBUIController
- (void)handleShowControlCenterSystemGesture:(id)gesture {
    if (removeCC && enabled) {
        
    } else {
        %orig(gesture);
    }
}

- (BOOL)shouldShowControlCenterTabControlOnFirstSwipe {
    if (noFirstSlideCC && enabled) {
        return YES;
    } else {
        return %orig;
    }
}
%end

%hook SBControlCenterSettings
- (BOOL)useNewBounce {
    if (ccOldBound && enabled) {
        return NO;
    } else {
        return %orig;
    }
}
%end

%hook SBControlCenterViewController
- (void)loadView {
    %orig;
    if (enabledCCScale && scale && enabled) {
        [MSHookIvar<SBControlCenterContainerView *>(self, "_containerView") setTransform:CATransform3DGetAffineTransform(CATransform3DMakeScale(scale, scale, 0))];
    }
}
%end

%hook SBControlCenterKnockoutView
- (void)setHidden:(BOOL)hidden {
    if (hideCCRules && enabled) {
        return %orig(YES);
    } else {
        return %orig(NO);
    }
}
%end

%hook SBCCBrightnessSectionController
- (bool)_shouldDarkenBackground {
    if (hideCCRules && enabled) {
        return FALSE;
    } else {
        return %orig;
    }
}
%end

%hook SBCCButtonLikeSectionView
-(void)layoutSubviews{
    %orig;
    if (hideCCRules && enabled) {
        UIVisualEffectView *vibrantDarkenLayer = MSHookIvar<UIVisualEffectView *>(self, "_vibrantDarkenLayer");
        vibrantDarkenLayer.alpha = 0.0;
    }
}
%end

%hook SBControlCenterController
- (BOOL)isUILocked {
    if (fixLockShowCC && enabled) {
        return NO;
    } else {
        return %orig;
    }
}
%end

%hook SBCCSettingsSectionController
- (BOOL)enabledForOrientation:(int)orientation {
    if (hideSwitching && enabled) {
        return NO;
    } else {
        return %orig;
    }
}

- (CGSize)contentSizeForOrientation:(int)orientation {
    if (hideSwitching && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return %orig(orientation);
    }
}
%end

%hook SBCCBrightnessSectionController
- (BOOL)enabledForOrientation:(int)orientation {
    if (hideBrightness && enabled) {
        return NO;
    } else {
        return %orig;
    }
}

- (CGSize)contentSizeForOrientation:(int)orientation {
    if (hideBrightness && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return %orig(orientation);
    }
}
%end

%hook SBCCMediaControlsSectionController
- (BOOL)enabledForOrientation:(int)orientation {
    if (hideMedia && enabled) {
        return NO;
    } else {
        return %orig;
    }
}

- (CGSize)contentSizeForOrientation:(int)orientation {
    if (hideMedia && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return %orig(orientation);
    }
}
%end

%hook SBCCAirStuffSectionController
- (BOOL)enabledForOrientation:(int)orientation {
    
    if (hideAirad && enabled) {
        
        return NO;
    } else {
        return %orig;
    }
}

- (CGSize)contentSizeForOrientation:(int)orientation {
    if (hideAirad && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return %orig(orientation);
    }
}
%end

%hook SBCCQuickLaunchSectionController
- (BOOL)enabledForOrientation:(int)orientation {
    if (hideQuickLaunch && enabled) {
        return NO;
    } else {
        return %orig;
    }
}

- (CGSize)contentSizeForOrientation:(int)orientation {
    if (hideQuickLaunch && enabled) {
        return CGSizeMake(0, 0);
    } else {
        return %orig(orientation);
    }
}
%end

%hook SBControlCenterContentContainerView
- (void)layoutSubviews {
    %orig;
    _UIBackdropView *backView = MSHookIvar<_UIBackdropView*>(self, "_backdropView");
    if (hideCCBlur && enabled) {
        backView.backgroundColor = [UIColor blackColor];
    }
    if (hideCCBackground && enabled) {
        backView.hidden = YES;
    }
}
%end

%end

%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
    %init(MixCC);
}
