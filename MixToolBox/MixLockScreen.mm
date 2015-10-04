#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixLockScreen.xm"

#import "define.h"
#import "substrate.h"
#import "update.m"
#import <ifaddrs.h>
#import <net/if.h>

@interface SBLockScreenScrollView : UIScrollView
@end

@interface SBFLockScreenDateView : UIView
-(void) setContentAlpha:(double)arg1 withDateVisible:(BOOL)arg2;
@end

@interface _UIGlintyStringView : UIView
-(id) chevron;
@end

MBOOL(enabled, NO);
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

#include <logos/logos.h>
#include <substrate.h>
@class SBLockScreenView; @class SpringBoard; @class _UIGlintyStringView; @class SBLockScreenViewController; @class SBFLockScreenDateView; 
static void (*_logos_orig$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$)(SBFLockScreenDateView*, SEL, double, BOOL); static void _logos_method$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$(SBFLockScreenDateView*, SEL, double, BOOL); static void (*_logos_orig$_ungrouped$SBLockScreenView$didMoveToWindow)(SBLockScreenView*, SEL); static void _logos_method$_ungrouped$SBLockScreenView$didMoveToWindow(SBLockScreenView*, SEL); static void (*_logos_orig$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$)(SBLockScreenView*, SEL, bool, id); static void _logos_method$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$(SBLockScreenView*, SEL, bool, id); static void (*_logos_orig$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$)(SBLockScreenView*, SEL, bool, id); static void _logos_method$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$(SBLockScreenView*, SEL, bool, id); static void (*_logos_orig$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$)(SBLockScreenView*, SEL, id); static void _logos_method$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$(SBLockScreenView*, SEL, id); static BOOL (*_logos_orig$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately)(SBLockScreenViewController*, SEL); static BOOL _logos_method$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(SBLockScreenViewController*, SEL); static BOOL (*_logos_orig$_ungrouped$SBLockScreenViewController$shouldShowLockStatusBarTime)(SBLockScreenViewController*, SEL); static BOOL _logos_method$_ungrouped$SBLockScreenViewController$shouldShowLockStatusBarTime(SBLockScreenViewController*, SEL); static long long (*_logos_orig$_ungrouped$SBLockScreenViewController$statusBarStyle)(SBLockScreenViewController*, SEL); static long long _logos_method$_ungrouped$SBLockScreenViewController$statusBarStyle(SBLockScreenViewController*, SEL); static BOOL (*_logos_orig$_ungrouped$SBLockScreenViewController$_shouldShowChargingText)(SBLockScreenViewController*, SEL); static BOOL _logos_method$_ungrouped$SBLockScreenViewController$_shouldShowChargingText(SBLockScreenViewController*, SEL); static id (*_logos_orig$_ungrouped$_UIGlintyStringView$chevron)(_UIGlintyStringView*, SEL); static id _logos_method$_ungrouped$_UIGlintyStringView$chevron(_UIGlintyStringView*, SEL); static bool (*_logos_orig$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber)(SpringBoard*, SEL); static bool _logos_method$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber(SpringBoard*, SEL); 

#line 34 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixLockScreen.xm"


static void _logos_method$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$(SBFLockScreenDateView* self, SEL _cmd, double arg1, BOOL arg2) {
    if (showMiniTime && enabled) {
        timeColors = MSHookIvar<UIColor *>(self, "_textColor");
        _logos_orig$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$(self, _cmd, 0.0, NO);
    } else {
        _logos_orig$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$(self, _cmd, arg1,arg2);
    }
}



static void _logos_method$_ungrouped$SBLockScreenView$didMoveToWindow(SBLockScreenView* self, SEL _cmd) {
    if (showMiniTime && enabled) {
        SBLockScreenScrollView *scrollView = MSHookIvar<SBLockScreenScrollView *>(self, "_foregroundScrollView");
        NSInteger panding = 20;
        NSInteger height = 96;
        NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
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
        [dt setDateFormat:@"EEEE\nM月d日"];
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
    
    _logos_orig$_ungrouped$SBLockScreenView$didMoveToWindow(self, _cmd);
}


static void _logos_method$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$(SBLockScreenView* self, SEL _cmd, bool hidden, id requester) {
    if (hideTopGrabber && enabled) {
        _logos_orig$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$(self, _cmd, YES, requester);
    } else {
        _logos_orig$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$(self, _cmd, hidden, requester);
    }
}


static void _logos_method$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$(SBLockScreenView* self, SEL _cmd, bool hidden, id requester) {
    if (hideBottomGrabber && enabled) {
        _logos_orig$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$(self, _cmd, YES, requester);
    } else {
        _logos_orig$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$(self, _cmd, hidden, requester);
    }
}

static void _logos_method$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$(SBLockScreenView* self, SEL _cmd, id arg1) {
    if (slideText.length > 0 && enabled) {
        arg1 = slideText;
        _logos_orig$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    } else if (hideText && enabled) {
        arg1 = @"";
        _logos_orig$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    } else {
        _logos_orig$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$(self, _cmd, arg1);
    }
}



static BOOL _logos_method$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(SBLockScreenViewController* self, SEL _cmd) {
    if(showImmediately && enabled) {
        return YES;
    } else { return _logos_orig$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately(self, _cmd); }
}

static BOOL _logos_method$_ungrouped$SBLockScreenViewController$shouldShowLockStatusBarTime(SBLockScreenViewController* self, SEL _cmd) {
    if (showStatusBarTime && enabled)
    {
        return YES;
    } else { return NO; }
}

static long long _logos_method$_ungrouped$SBLockScreenViewController$statusBarStyle(SBLockScreenViewController* self, SEL _cmd) {
    if (sameStatusBar && enabled)
    {
        return 0;
    } else { return _logos_orig$_ungrouped$SBLockScreenViewController$statusBarStyle(self, _cmd); }
}

static BOOL _logos_method$_ungrouped$SBLockScreenViewController$_shouldShowChargingText(SBLockScreenViewController* self, SEL _cmd) {
    if (hideChargingText && enabled)
    {
        return NO;
    } else { return _logos_orig$_ungrouped$SBLockScreenViewController$_shouldShowChargingText(self, _cmd); }
}




static id _logos_method$_ungrouped$_UIGlintyStringView$chevron(_UIGlintyStringView* self, SEL _cmd) {
    if (enabled && hideText)
    {
        return NULL;
    } else { return _logos_orig$_ungrouped$_UIGlintyStringView$chevron(self, _cmd); }
}




static bool _logos_method$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber(SpringBoard* self, SEL _cmd) {
    if (hideCameraGrabber && enabled)
    {
        return NO;
    } else { return _logos_orig$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber(self, _cmd); }
}


static void loadPrefs() {
    MAKEPREFS(@"/var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
    if (prefs)
    {
        SETBOOL(enabled, "enabled");
        SETBOOL(showMiniTime, "showMiniTime");
        SETBOOL(hideText, "hideText");
        SETBOOL(hideTopGrabber, "hideTopGrabber");
        SETBOOL(hideBottomGrabber, "hideBottomGrabber");
        SETBOOL(showImmediately, "showImmediately");
        SETBOOL(showStatusBarTime, "showStatusBarTime");
        SETBOOL(hideCameraGrabber, "hideCameraGrabber");
        SETTEXT(slideText, "slideText");
        SETBOOL(sameStatusBar, "sameStatusBar");
    }
    [slideText retain];
    [prefs release];
}

static __attribute__((constructor)) void _logosLocalCtor_f1ecb8a2() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFLockScreenDateView = objc_getClass("SBFLockScreenDateView"); MSHookMessageEx(_logos_class$_ungrouped$SBFLockScreenDateView, @selector(setContentAlpha:withDateVisible:), (IMP)&_logos_method$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$, (IMP*)&_logos_orig$_ungrouped$SBFLockScreenDateView$setContentAlpha$withDateVisible$);Class _logos_class$_ungrouped$SBLockScreenView = objc_getClass("SBLockScreenView"); MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$SBLockScreenView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$SBLockScreenView$didMoveToWindow);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenView, @selector(setTopGrabberHidden:forRequester:), (IMP)&_logos_method$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$, (IMP*)&_logos_orig$_ungrouped$SBLockScreenView$setTopGrabberHidden$forRequester$);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenView, @selector(setBottomGrabberHidden:forRequester:), (IMP)&_logos_method$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$, (IMP*)&_logos_orig$_ungrouped$SBLockScreenView$setBottomGrabberHidden$forRequester$);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenView, @selector(setCustomSlideToUnlockText:), (IMP)&_logos_method$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$, (IMP*)&_logos_orig$_ungrouped$SBLockScreenView$setCustomSlideToUnlockText$);Class _logos_class$_ungrouped$SBLockScreenViewController = objc_getClass("SBLockScreenViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewController, @selector(shouldShowSlideToUnlockTextImmediately), (IMP)&_logos_method$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewController$shouldShowSlideToUnlockTextImmediately);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewController, @selector(shouldShowLockStatusBarTime), (IMP)&_logos_method$_ungrouped$SBLockScreenViewController$shouldShowLockStatusBarTime, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewController$shouldShowLockStatusBarTime);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewController, @selector(statusBarStyle), (IMP)&_logos_method$_ungrouped$SBLockScreenViewController$statusBarStyle, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewController$statusBarStyle);MSHookMessageEx(_logos_class$_ungrouped$SBLockScreenViewController, @selector(_shouldShowChargingText), (IMP)&_logos_method$_ungrouped$SBLockScreenViewController$_shouldShowChargingText, (IMP*)&_logos_orig$_ungrouped$SBLockScreenViewController$_shouldShowChargingText);Class _logos_class$_ungrouped$_UIGlintyStringView = objc_getClass("_UIGlintyStringView"); MSHookMessageEx(_logos_class$_ungrouped$_UIGlintyStringView, @selector(chevron), (IMP)&_logos_method$_ungrouped$_UIGlintyStringView$chevron, (IMP*)&_logos_orig$_ungrouped$_UIGlintyStringView$chevron);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(canShowLockScreenCameraGrabber), (IMP)&_logos_method$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber, (IMP*)&_logos_orig$_ungrouped$SpringBoard$canShowLockScreenCameraGrabber);} }
#line 198 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixLockScreen.xm"
