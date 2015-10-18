#import "ReRAM.h"
#import "define.h"
#import "update.h"
#import "MixStore.h"
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

/* Mix Control Center */
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

/* Mix Lock Screen */
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

/* Mix Notification Center */
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

/* Mix SpringBoard */
MBOOL(noFolderBackground, NO);
MBOOL(hideNews, NO);
MBOOL(noClockAnimate, NO);
MBOOL(rmSearch, NO);
MBOOL(rmLeftSearch,NO);
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

/* Mix Status Bar */
MBOOL(MixRAM, NO);
MBOOL(MixIP, NO);
MBOOL(MixHideTime, NO);
MBOOL(MixHideNotDisturb, NO);
MBOOL(MixHideAirplane, NO);
MBOOL(MixHideSignal, NO);
MBOOL(MixHideCarrier, NO);
MBOOL(MixHideData, NO);
MBOOL(MixHideBattery, NO);
//static double RAMTimeValue;
MBOOL(MixShowBP, NO);
MBOOL(MixMinVol, NO);
MBOOL(MixHideAlarm, NO);
MBOOL(MixHideGeoItem, NO);
MBOOL(MixHideRotation, NO);
MBOOL(MixHideDataSpinner, NO);
TEXT(timeFormat);
TEXT(customSignal);
static NSString *address;
//static LSStatusBarItem *mute;

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
        
        /* Mix Control Center */
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
        
        /* Mix Lock Screen */
        SETBOOL(showMiniTime, "showMiniTime");
        SETBOOL(hideText, "hideText");
        SETBOOL(hideTopGrabber, "hideTopGrabber");
        SETBOOL(hideBottomGrabber, "hideBottomGrabber");
        SETBOOL(showImmediately, "showImmediately");
        SETBOOL(showStatusBarTime, "showStatusBarTime");
        SETBOOL(hideCameraGrabber, "hideCameraGrabber");
        SETTEXT(slideText, "slideText");
        SETBOOL(sameStatusBar, "sameStatusBar");
        
        /* Mix Notification Center */
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
        
        /* Mix SpringBoard */
        SETBOOL(noFolderBackground, "noFolderBackground");
        SETBOOL(hideNews, "hideNews");
        SETBOOL(noClockAnimate, "noClockAnimate");
        SETBOOL(rmSearch, "rmSearch");
        SETBOOL(rmLeftSearch, "rmLeftSearch");
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
        
        /* Mix Status Bar */
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
        //SETDOUBLE(RAMTimeValue, "RAMTimeValue");
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
-(void)layoutSubviews {
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
    _UIBackdropView *backView = MSHookIvar<_UIBackdropView *>(self, "_backdropView");
    if (hideCCBlur && enabled) {
        backView.backgroundColor = [UIColor blackColor];
    }
    if (hideCCBackground && enabled) {
        backView.hidden = YES;
    }
}
%end

%end

#pragma mark - Mix Lock Screen

@interface SBLockScreenScrollView : UIScrollView
@end

@interface SBFLockScreenDateView : UIView
-(void) setContentAlpha:(double)arg1 withDateVisible:(BOOL)arg2;
@end

@interface _UIGlintyStringView : UIView
-(id) chevron;
@end

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

%group MixNC

%hook SBUIController
- (void)handleShowNotificationsSystemGesture:(id)gesture {
    if (removeNotify && enabled) {
        
    } else {
        %orig(gesture);
    }
}

- (BOOL)shouldShowNotificationCenterTabControlOnFirstSwipe {
    if (noFirstSlideNotify && enabled) {
        return YES;
    } else {
        return %orig;
    }
}
%end

%hook SBNotificationCenterController
-(void)beginPresentationWithTouchLocation:(CGPoint)touchLocation {
    loadPrefs();
    %orig(touchLocation);
}
%end

%hook SBTodayTableHeaderView
- (CGSize)sizeThatFits:(CGSize)fits {
    CGSize original = %orig(fits);
    if (hideTodayDate && enabled) {
        [self setHidden:YES];
        return CGSizeMake(0,0);
    } else {
        return original;
    }
}
%end

%hook SBTodayTableFooterView
- (void)layoutSubviews {
    %orig;
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
%end

%hook SBTodayBulletinCell
- (void)layoutSubviews {
    %orig;
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
%end

%hook SBNotificationCenterSeparatorView
- (id)initWithFrame:(CGRect)theRect
mode:(int)theInt {
    if (hideLines && enabled) {
        return nil;
    } else {
        return %orig(theRect, theInt);
    }
}
%end

%hook SBNotificationCenterHeaderView
- (void)layoutSubviews {
    %orig;
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
%end

%hook SBNotificationCenterViewController
- (void)viewDidLoad {
    %orig;
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

- (void)_loadhidefootrule {
    if (hideFootRule && enabled) {
        
    } else {
        return %orig;
    }
}
%end

%hook SBModeViewController
- (float)_headerViewHeightForMode:(int)mode {
    if (hideTodayTabs && enabled) {
        return 0;
    } else {
        return %orig(mode);
    }
}

- (void)hostWillPresent {
    int index = 0;
    if (hideToday && enabled) {
        index = 1;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    if (hideNotify && enabled) {
        index = 0;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    %orig;
}
%end

%hook _SBUIWidgetViewController
- (id)init {
    if ([NSStringFromClass([self class]) isEqualToString:@"AttributionWeeAppController"] && hideTodayFootText && enabled) {
        return nil;
    } else {
        self = %orig;
        return self;
    }
}
%end

%hook SBNotificationsAllModeViewController
- (id)contentUnavailableText {
    if (hideNotifyText && enabled) {
        return nil;
    } else {
        return %orig;
    }
}
%end

%hook SBBannerContainerView
- (UIView *)backgroundView {
    if (hideNotifyBanners && enabled) {
        return nil;
    } else {
        return %orig;
    }
}
%end

%hook SBNotificationSeparatorView
+ (id)separatorForCurrentState {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return %orig;
    }
}

+ (int)separatorViewModeForCurrentState {
    if (hideNotifyLines && enabled) {
        return 0;
    } else {
        return %orig;
    }
}

+ (id)separatorWithScreenScale:(float)screenScale
mode:(int)mode {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return %orig(screenScale, mode);
    }
}

- (void)setBounds:(CGRect)bounds {
    if (hideNotifyLines && enabled) {
        
    } else {
        %orig(bounds);
    }
}

- (void)setFrame:(CGRect)frame {
    if (hideNotifyLines && enabled) {
        
    } else {
        %orig(frame);
    }
}

- (void)updateForCurrentState {
    if (hideNotifyLines && enabled) {
        
    } else {
        %orig;
    }
}
- (id)initWithFrame:(CGRect)frame mode:(int)mode {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return %orig(frame, mode);
    }
}
%end

%end

#pragma mark - Mix SpringBoard

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

%group MixSpringBoard

%hook SBFolderIconBackgroundView  //隐藏文件夹背景（桌面文件夹，非内部，仍可打开）
- (id)initWithDefaultSize {
    if (noFolderBackground && enabled)
        return NULL;
    return %orig;
}
%end

%hook SBIconController   //隐藏报刊杂志
- (bool)isNewsstandSupported {
    if (hideNews && enabled)
        return FALSE;
    return %orig;
}
%end

%hook SBClockApplicationIconImageView //禁止桌面动画
- (void)_setAnimating:(bool)removeA {
    if (noClockAnimate && enabled)
        removeA = FALSE;
        %orig(removeA);
        }
%end

%hook SBSearchScrollView //禁用搜索界面
- (bool)gestureRecognizerShouldBegin:(id)arg1 {
    if (rmSearch && enabled)
        return FALSE;
    return %orig;
}
%end

%hook SBSpotlightSettings //禁用ios9左侧搜索界面
-(void) setEnableSpotlightOnMinusPage:(bool)minuspage {
	if (rmLeftSearch && enabled)
		return;
	%orig;
}

-(bool) enableSpotlightOnMinusPage {
	if (rmLeftSearch && enabled)
		return FALSE;
	return %orig;
}

%end

%hook SBVoiceControlController  //禁用语音助手
- (id)init {
    if (disVoice && enabled)
        return NULL;
    return %orig;
}
%end

%hook SBIconPageIndicatorImageSetResult //隐藏分页点
- (id)initWithIndicatorSet:(id)arg1
enabledIndicatorSet:(id)arg2 {
    %orig(arg1, arg2);
    if (SBHideIndicator && enabled)
        return NULL;
    return %orig;
}
%end

%hook SBFWallpaperView //去除壁纸阴影
- (float)contrast {
    if (rmShadow && enabled)
        return 0.0f;
    return %orig;
}
%end

%hook SBIconBetaLabelAccessoryView //去除小黄点
- (id)init {
    if (rmYellowDot && enabled)
        return nil;
    return %orig;
}
%end

%hook SBIconRecentlyUpdatedLabelAccessoryView //去除小蓝点
- (id)init {
    if (rmBlueDot && enabled)
        return nil;
    return %orig;
}
%end

%hook SBDockView //去除Dock背景
- (void)layoutSubviews {
    if (HideDockBackgrouond && enabled)
        return;
    %orig;
}
%end

%hook SBAppSwitcherHomePageCellView //隐藏AppSwitcher的主屏幕模糊背景
- (void)layoutSubviews {
    if (HideAppSwitcherBackground && enabled)
        return;
    %orig;
}
%end

%hook SBIconColorSettings //禁止图标抖动
- (BOOL)suppressJitter {
    if (rmIconJitter && enabled)
        return TRUE;
    return %orig;
}
%end

%hook SBSearchResultsBackdropView //去除Spotlight模糊背景
- (bool)useHighQualityGraphics {
    if (rmSpotlightBlur && enabled)
        return FALSE;
    return %orig;
}

- (id)initWithFrame:(CGRect)arg1 {
    if (rmSpotlightBlur && enabled)
        return NULL;
    return %orig;
}
%end

%hook SBAppParallaxSettings //去除壁纸视差效果
- (id)iconSettings {
    if (rmParallax && enabled)
        return NULL;
    return %orig;
}

- (id)lockscreenWallpaperSettings {
    if (rmParallax && enabled)
        return NULL;
    return %orig;
}

- (id)homescreenWallpaperSettings {
    if (rmParallax && enabled)
        return NULL;
    return %orig;
}

- (void)setLockscreenWallpaperSettings:(id)lock {
    if (rmParallax && enabled)
        lock = 0;
        %orig(lock);
        }

- (void)setHomescreenWallpaperSettings:(id)home {
    if (rmParallax && enabled)
        home = 0;
        %orig(home);
        }
%end

%hook SBWallpaperController //禁止壁纸放大
- (void)setHomescreenWallpaperScale:(float)wallpaper {
    if (rmWallpaperZoom && enabled) {
        wallpaper = 1;
    } else {
        %orig(wallpaper);
    }
}
%end

%hook SBFWallpaperSettings //全局微透效果
- (BOOL)replaceBlurs {
    if (AllReplaceBlur && enabled)
        return TRUE;
    return %orig;
}
%end

%hook _UIBackdropViewSettings
- (double)grayscaleTintAlpha { //全局毛玻璃效果
    if (AllBlurGlass && enabled)
        return 0;
    return %orig;
}

- (id)initWithDefaultValuesForGraphicsQuality:(long long)qualityblur { //全局透明
    if (AllTransparent && enabled)
        return NULL;
    return %orig;
}

- (double)blurRadius { //全局微透2
    if (AllReplaceBlur2 && enabled)
        return 60;
    return %orig;
}

- (void)setZoomsBack:(bool)zoomsback {
    if (AllReplaceBlur2 && enabled)
        zoomsback = 0;
        %orig(zoomsback);
        }
%end

%hook SBDarkeningImageView
- (void)setImage:(id)image { //去除角标背景
    if (rmBadgeBackground && enabled)
        return;
    %orig;
}

- (void)setImage:(id)image1
brightness:(double)image2 { //隐藏所有角标
    if (HideBadge && enabled)
        return;
    %orig;
}
%end

%end

#pragma mark - Mix Status Bar

%group MixStatusBar

%hook SBStatusBarStateAggregator //初始化状态栏

/*
//获得IP(局域网)
%new
-(void)updateLocalIP
{
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
}
*/

//时间格式修改
-(void) _resetTimeItemFormatter {
    %orig;
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

//状态栏元素隐藏
- (BOOL)_setItem:(int)item
enabled:(BOOL)arg2 {
    if (item == 0  && MixHideTime && enabled)     return %orig(item, NO);
        if (item == 1  && MixHideNotDisturb && enabled) return %orig(item, NO);
            if (item == 2  && MixHideAirplane && enabled)     return %orig(item, NO);
                if (item == 3  && MixHideSignal && enabled)    return %orig(item, NO);
                    if (item == 4  && MixHideCarrier && enabled)      return %orig(item, NO);
                        if (item == 5  && MixHideData && enabled)         return %orig(item, NO);
                            if (item == 7  && MixHideBattery && enabled)      return %orig(item, NO);
                                if (item == 8  && MixShowBP && enabled)        return %orig(item, YES);
                                    if (item == 13 && MixHideAlarm && enabled)        return %orig(item, NO);
                                        if (item == 16 && MixHideGeoItem && enabled)      return %orig(item, NO);
                                            if (item == 17 && MixHideRotation && enabled)     return %orig(item, NO);
                                                if (item == 23 && MixHideDataSpinner && enabled)  return %orig(item, NO);
                                                    return %orig;
}

//获得空闲内存
%end

//%hook SBMediaController
//-(id) init {
//    id result = %orig;
//    if (result) {
//        bool ringerSwitchState = MSHookIvar<bool>(self,"_ringerMuted");
//        mute.visible = (!ringerSwitchState && MixMinVol && enabled);
//    }
//    return result;
//}
//
//-(void) _systemMuteChanged:(id)arg1 {
//    if (arg1 && MixMinVol && enabled) {
//        mute.visible = YES;
//    }
//}
//%end
//
//%hook SBCCSettingsSectionController
//-(void) _setMuted:(_Bool)arg1 {
//    %orig;
//    mute.visible = arg1 && MixMinVol && enabled;
//}
//%end
//
//%hook SpringBoard
//-(void)_updateRingerState:(int)state
//withVisuals:(BOOL)visuals
//updatePreferenceRegister:(BOOL)aRegister
//{
//    %orig;
//    if (MixMinVol && enabled) {
//        mute.visible = !state;
//    }
//}
//%end

%hook SBTelephonyManager //运营商自定义
- (void)_reallySetOperatorName:(id)userName {
    if ([customSignal isEqualToString:@""] || customSignal == nil || !enabled)
    {
        %orig(userName);
    }  else if (enabled && customSignal) {
        userName = customSignal;
        %orig(userName);
    }
}
%end

%end

%ctor {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        
//        mute = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"mixtoolbox.mute" alignment:StatusBarAlignmentRight];
//        mute.imageName = @"cmemory";
//        mute.visible = NO;
        
        %init(MixCC);
        %init(MixLockScreen);
        %init(MixNC);
        %init(MixSpringBoard);
        %init(MixStatusBar);
        
    } else {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)tryActivate, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    }
}
