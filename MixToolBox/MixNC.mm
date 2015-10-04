#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixNC.xm"
#import <substrate.h>
#import "define.h"
#import <UIKit/UIKit.h>

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
    MAKEPREFS(@"var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
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


static __attribute__((constructor)) void _logosLocalCtor_7513fb95() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}

#include <logos/logos.h>
#include <substrate.h>
@class SBNotificationCenterController; @class SBTodayBulletinCell; @class SBUIController; @class SBBannerContainerView; @class SBNotificationCenterViewController; @class SBModeViewController; @class SBTodayTableFooterView; @class _SBUIWidgetViewController; @class SBTodayTableHeaderView; @class SBNotificationCenterHeaderView; @class SBNotificationCenterSeparatorView; @class SBNotificationSeparatorView; @class SBNotificationsAllModeViewController; 
static void (*_logos_orig$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$)(SBUIController*, SEL, id); static void _logos_method$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$(SBUIController*, SEL, id); static BOOL (*_logos_orig$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe)(SBUIController*, SEL); static BOOL _logos_method$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController*, SEL); static void (*_logos_orig$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$)(SBNotificationCenterController*, SEL, CGPoint); static void _logos_method$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController*, SEL, CGPoint); static CGSize (*_logos_orig$_ungrouped$SBTodayTableHeaderView$sizeThatFits$)(SBTodayTableHeaderView*, SEL, CGSize); static CGSize _logos_method$_ungrouped$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView*, SEL, CGSize); static void (*_logos_orig$_ungrouped$SBTodayTableFooterView$layoutSubviews)(SBTodayTableFooterView*, SEL); static void _logos_method$_ungrouped$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView*, SEL); static void (*_logos_orig$_ungrouped$SBTodayBulletinCell$layoutSubviews)(SBTodayBulletinCell*, SEL); static void _logos_method$_ungrouped$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell*, SEL); static id (*_logos_orig$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$)(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static id _logos_method$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static void (*_logos_orig$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews)(SBNotificationCenterHeaderView*, SEL); static void _logos_method$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView*, SEL); static void (*_logos_orig$_ungrouped$SBNotificationCenterViewController$viewDidLoad)(SBNotificationCenterViewController*, SEL); static void _logos_method$_ungrouped$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController*, SEL); static void (*_logos_orig$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule)(SBNotificationCenterViewController*, SEL); static void _logos_method$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController*, SEL); static float (*_logos_orig$_ungrouped$SBModeViewController$_headerViewHeightForMode$)(SBModeViewController*, SEL, int); static float _logos_method$_ungrouped$SBModeViewController$_headerViewHeightForMode$(SBModeViewController*, SEL, int); static void (*_logos_orig$_ungrouped$SBModeViewController$hostWillPresent)(SBModeViewController*, SEL); static void _logos_method$_ungrouped$SBModeViewController$hostWillPresent(SBModeViewController*, SEL); static id (*_logos_orig$_ungrouped$_SBUIWidgetViewController$init)(_SBUIWidgetViewController*, SEL); static id _logos_method$_ungrouped$_SBUIWidgetViewController$init(_SBUIWidgetViewController*, SEL); static id (*_logos_orig$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText)(SBNotificationsAllModeViewController*, SEL); static id _logos_method$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController*, SEL); static UIView * (*_logos_orig$_ungrouped$SBBannerContainerView$backgroundView)(SBBannerContainerView*, SEL); static UIView * _logos_method$_ungrouped$SBBannerContainerView$backgroundView(SBBannerContainerView*, SEL); static id (*_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState)(Class, SEL); static id _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState(Class, SEL); static int (*_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState)(Class, SEL); static int _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class, SEL); static id (*_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$)(Class, SEL, float, int); static id _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class, SEL, float, int); static void (*_logos_orig$_ungrouped$SBNotificationSeparatorView$setBounds$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$_ungrouped$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$_ungrouped$SBNotificationSeparatorView$setFrame$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$_ungrouped$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$_ungrouped$SBNotificationSeparatorView$updateForCurrentState)(SBNotificationSeparatorView*, SEL); static void _logos_method$_ungrouped$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView*, SEL); static id (*_logos_orig$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$)(SBNotificationSeparatorView*, SEL, CGRect, int); static id _logos_method$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView*, SEL, CGRect, int); 

#line 162 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixNC.xm"

static void _logos_method$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$(SBUIController* self, SEL _cmd, id gesture) {
    if (removeNotify && enabled) {
        
    } else {
        _logos_orig$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$(self, _cmd, gesture);
    }
}

static BOOL _logos_method$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController* self, SEL _cmd) {
    if (noFirstSlideNotify && enabled) {
        return YES;
    } else {
        return _logos_orig$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(self, _cmd);
    }
}



static void _logos_method$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController* self, SEL _cmd, CGPoint touchLocation) {
    loadPrefs();
    _logos_orig$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$(self, _cmd, touchLocation);
}



static CGSize _logos_method$_ungrouped$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView* self, SEL _cmd, CGSize fits) {
    CGSize original = _logos_orig$_ungrouped$SBTodayTableHeaderView$sizeThatFits$(self, _cmd, fits);
    if (hideTodayDate && enabled) {
        [self setHidden:YES];
        return CGSizeMake(0,0);
    } else {
        return original;
    }
}



static void _logos_method$_ungrouped$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBTodayTableFooterView$layoutSubviews(self, _cmd);
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



static void _logos_method$_ungrouped$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBTodayBulletinCell$layoutSubviews(self, _cmd);
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




static id _logos_method$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView* self, SEL _cmd, CGRect theRect, int theInt) {
    if (hideLines && enabled) {
        return nil;
    } else {
        return _logos_orig$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$(self, _cmd, theRect, theInt);
    }
}



static void _logos_method$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews(self, _cmd);
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



static void _logos_method$_ungrouped$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController* self, SEL _cmd) {
    _logos_orig$_ungrouped$SBNotificationCenterViewController$viewDidLoad(self, _cmd);
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

static void _logos_method$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController* self, SEL _cmd) {
    if (hideFootRule && enabled) {
        
    } else {
        return _logos_orig$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule(self, _cmd);
    }
}



static float _logos_method$_ungrouped$SBModeViewController$_headerViewHeightForMode$(SBModeViewController* self, SEL _cmd, int mode) {
    if (hideTodayTabs && enabled) {
        return 0;
    } else {
        return _logos_orig$_ungrouped$SBModeViewController$_headerViewHeightForMode$(self, _cmd, mode);
    }
}

static void _logos_method$_ungrouped$SBModeViewController$hostWillPresent(SBModeViewController* self, SEL _cmd) {
    int index = 0;
    if (hideToday && enabled) {
        index = 1;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    if (hideNotify && enabled) {
        index = 0;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    _logos_orig$_ungrouped$SBModeViewController$hostWillPresent(self, _cmd);
}



static id _logos_method$_ungrouped$_SBUIWidgetViewController$init(_SBUIWidgetViewController* self, SEL _cmd) {
    if ([NSStringFromClass([self class]) isEqualToString:@"AttributionWeeAppController"] && hideTodayFootText && enabled) {
        return nil;
    } else {
        self = _logos_orig$_ungrouped$_SBUIWidgetViewController$init(self, _cmd);
        return self;
    }
}



static id _logos_method$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController* self, SEL _cmd) {
    if (hideNotifyText && enabled) {
        return nil;
    } else {
        return _logos_orig$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText(self, _cmd);
    }
}



static UIView * _logos_method$_ungrouped$SBBannerContainerView$backgroundView(SBBannerContainerView* self, SEL _cmd) {
    if (hideNotifyBanners && enabled) {
        return nil;
    } else {
        return _logos_orig$_ungrouped$SBBannerContainerView$backgroundView(self, _cmd);
    }
}



static id _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState(self, _cmd);
    }
}

static int _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return 0;
    } else {
        return _logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState(self, _cmd);
    }
}


static id _logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class self, SEL _cmd, float screenScale, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$(self, _cmd, screenScale, mode);
    }
}

static void _logos_method$_ungrouped$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView* self, SEL _cmd, CGRect bounds) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$_ungrouped$SBNotificationSeparatorView$setBounds$(self, _cmd, bounds);
    }
}

static void _logos_method$_ungrouped$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$_ungrouped$SBNotificationSeparatorView$setFrame$(self, _cmd, frame);
    }
}

static void _logos_method$_ungrouped$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView* self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$_ungrouped$SBNotificationSeparatorView$updateForCurrentState(self, _cmd);
    }
}
static id _logos_method$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_orig$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$(self, _cmd, frame, mode);
    }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(handleShowNotificationsSystemGesture:), (IMP)&_logos_method$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$, (IMP*)&_logos_orig$_ungrouped$SBUIController$handleShowNotificationsSystemGesture$);MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(shouldShowNotificationCenterTabControlOnFirstSwipe), (IMP)&_logos_method$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$_ungrouped$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe);Class _logos_class$_ungrouped$SBNotificationCenterController = objc_getClass("SBNotificationCenterController"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterController, @selector(beginPresentationWithTouchLocation:), (IMP)&_logos_method$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterController$beginPresentationWithTouchLocation$);Class _logos_class$_ungrouped$SBTodayTableHeaderView = objc_getClass("SBTodayTableHeaderView"); MSHookMessageEx(_logos_class$_ungrouped$SBTodayTableHeaderView, @selector(sizeThatFits:), (IMP)&_logos_method$_ungrouped$SBTodayTableHeaderView$sizeThatFits$, (IMP*)&_logos_orig$_ungrouped$SBTodayTableHeaderView$sizeThatFits$);Class _logos_class$_ungrouped$SBTodayTableFooterView = objc_getClass("SBTodayTableFooterView"); MSHookMessageEx(_logos_class$_ungrouped$SBTodayTableFooterView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBTodayTableFooterView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBTodayTableFooterView$layoutSubviews);Class _logos_class$_ungrouped$SBTodayBulletinCell = objc_getClass("SBTodayBulletinCell"); MSHookMessageEx(_logos_class$_ungrouped$SBTodayBulletinCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBTodayBulletinCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBTodayBulletinCell$layoutSubviews);Class _logos_class$_ungrouped$SBNotificationCenterSeparatorView = objc_getClass("SBNotificationCenterSeparatorView"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterSeparatorView$initWithFrame$mode$);Class _logos_class$_ungrouped$SBNotificationCenterHeaderView = objc_getClass("SBNotificationCenterHeaderView"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterHeaderView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterHeaderView$layoutSubviews);Class _logos_class$_ungrouped$SBNotificationCenterViewController = objc_getClass("SBNotificationCenterViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBNotificationCenterViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBNotificationCenterViewController, @selector(_loadhidefootrule), (IMP)&_logos_method$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule, (IMP*)&_logos_orig$_ungrouped$SBNotificationCenterViewController$_loadhidefootrule);Class _logos_class$_ungrouped$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBModeViewController, @selector(_headerViewHeightForMode:), (IMP)&_logos_method$_ungrouped$SBModeViewController$_headerViewHeightForMode$, (IMP*)&_logos_orig$_ungrouped$SBModeViewController$_headerViewHeightForMode$);MSHookMessageEx(_logos_class$_ungrouped$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$_ungrouped$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$_ungrouped$SBModeViewController$hostWillPresent);Class _logos_class$_ungrouped$_SBUIWidgetViewController = objc_getClass("_SBUIWidgetViewController"); MSHookMessageEx(_logos_class$_ungrouped$_SBUIWidgetViewController, @selector(init), (IMP)&_logos_method$_ungrouped$_SBUIWidgetViewController$init, (IMP*)&_logos_orig$_ungrouped$_SBUIWidgetViewController$init);Class _logos_class$_ungrouped$SBNotificationsAllModeViewController = objc_getClass("SBNotificationsAllModeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBNotificationsAllModeViewController, @selector(contentUnavailableText), (IMP)&_logos_method$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText, (IMP*)&_logos_orig$_ungrouped$SBNotificationsAllModeViewController$contentUnavailableText);Class _logos_class$_ungrouped$SBBannerContainerView = objc_getClass("SBBannerContainerView"); MSHookMessageEx(_logos_class$_ungrouped$SBBannerContainerView, @selector(backgroundView), (IMP)&_logos_method$_ungrouped$SBBannerContainerView$backgroundView, (IMP*)&_logos_orig$_ungrouped$SBBannerContainerView$backgroundView);Class _logos_class$_ungrouped$SBNotificationSeparatorView = objc_getClass("SBNotificationSeparatorView"); Class _logos_metaclass$_ungrouped$SBNotificationSeparatorView = object_getClass(_logos_class$_ungrouped$SBNotificationSeparatorView); MSHookMessageEx(_logos_metaclass$_ungrouped$SBNotificationSeparatorView, @selector(separatorForCurrentState), (IMP)&_logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState, (IMP*)&_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorForCurrentState);MSHookMessageEx(_logos_metaclass$_ungrouped$SBNotificationSeparatorView, @selector(separatorViewModeForCurrentState), (IMP)&_logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState, (IMP*)&_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorViewModeForCurrentState);MSHookMessageEx(_logos_metaclass$_ungrouped$SBNotificationSeparatorView, @selector(separatorWithScreenScale:mode:), (IMP)&_logos_meta_method$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$, (IMP*)&_logos_meta_orig$_ungrouped$SBNotificationSeparatorView$separatorWithScreenScale$mode$);MSHookMessageEx(_logos_class$_ungrouped$SBNotificationSeparatorView, @selector(setBounds:), (IMP)&_logos_method$_ungrouped$SBNotificationSeparatorView$setBounds$, (IMP*)&_logos_orig$_ungrouped$SBNotificationSeparatorView$setBounds$);MSHookMessageEx(_logos_class$_ungrouped$SBNotificationSeparatorView, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$SBNotificationSeparatorView$setFrame$, (IMP*)&_logos_orig$_ungrouped$SBNotificationSeparatorView$setFrame$);MSHookMessageEx(_logos_class$_ungrouped$SBNotificationSeparatorView, @selector(updateForCurrentState), (IMP)&_logos_method$_ungrouped$SBNotificationSeparatorView$updateForCurrentState, (IMP*)&_logos_orig$_ungrouped$SBNotificationSeparatorView$updateForCurrentState);MSHookMessageEx(_logos_class$_ungrouped$SBNotificationSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$_ungrouped$SBNotificationSeparatorView$initWithFrame$mode$);} }
#line 437 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixNC.xm"
