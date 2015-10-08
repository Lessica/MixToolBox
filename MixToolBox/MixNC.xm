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

@interface _UIBackdropView : UIView
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

MBOOL(enabled, NO);
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

static void loadPrefs() {
    MAKEPREFS(prefsPath);
    if (prefs) {
        SETBOOL(enabled, "enabled");
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
    }
    [prefs release];
}

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

%ctor {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        %init(MixNC);
    }
}
