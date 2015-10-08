
#import "define.h"
#import "substrate.h"
#import "update.m"
#import "MixStore.h"
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
//MBOOL(hideDate, NO);
MBOOL(showStatusBarTime, NO);
MBOOL(sameStatusBar, NO);
MBOOL(hideCameraGrabber, NO);

static NSString *slideText;
static UIColor *timeColors;

static void loadPrefs() {
    MAKEPREFS(prefsPath);
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

%group MixLockScreen

%hook SBFLockScreenDateView
- (void)setContentAlpha:(double)arg1
        withDateVisible:(BOOL)arg2 {
    if (showMiniTime && enabled) {
        timeColors = MSHookIvar<UIColor *>(self, "_textColor");
        %orig(0.0, NO);
    } else {
        %orig(arg1,arg2);
    }
}
%end

%hook SBLockScreenView
- (void)didMoveToWindow {
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
        [dt setDateFormat:@"EEEE\nM / d"];
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
    
    %orig;
}

- (void)setTopGrabberHidden:(bool)hidden
               forRequester:(id)requester {
    if (hideTopGrabber && enabled) {
        %orig(YES, requester);
    } else {
        %orig(hidden, requester);
    }
}

- (void)setBottomGrabberHidden:(bool)hidden
                  forRequester:(id)requester {
    if (hideBottomGrabber && enabled) {
        %orig(YES, requester);
    } else {
        %orig(hidden, requester);
    }
}

- (void)setCustomSlideToUnlockText:(id)arg1 {
    if (slideText.length > 0 && enabled) {
        arg1 = slideText;
        %orig(arg1);
    } else if (hideText && enabled) {
        arg1 = @"";
        %orig(arg1);
    } else {
        %orig(arg1);
    }
}
%end

%hook SBLockScreenViewController
-(BOOL) shouldShowSlideToUnlockTextImmediately {
    if(showImmediately && enabled) {
        return YES;
    } else { return %orig; }
}

-(BOOL) shouldShowLockStatusBarTime {
    if (showStatusBarTime && enabled)
    {
        return YES;
    } else { return NO; }
}

-(long long) statusBarStyle {
    if (sameStatusBar && enabled)
    {
        return 0;
    } else { return %orig; }
}

-(BOOL) _shouldShowChargingText {
    if (hideChargingText && enabled)
    {
        return NO;
    } else { return %orig; }
}
%end

%hook _UIGlintyStringView
-(void) show {
    if (enabled && hideText)
    {
        return;
    } else { return %orig; }
}
%end

%hook SpringBoard
-(bool) canShowLockScreenCameraGrabber {
    if (hideCameraGrabber && enabled)
    {
        return NO;
    } else { return %orig; }
}
%end

%end

%ctor {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        %init(MixLockScreen);
    }
}


