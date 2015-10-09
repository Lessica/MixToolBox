#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixNC.xm"
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

#include <logos/logos.h>
#include <substrate.h>
@class SBNotificationsAllModeViewController; @class SBTodayTableHeaderView; @class SBBannerContainerView; @class SBTodayBulletinCell; @class SBNotificationCenterViewController; @class SBNotificationSeparatorView; @class SBNotificationCenterController; @class SBTodayTableFooterView; @class SBModeViewController; @class SBNotificationCenterSeparatorView; @class SBNotificationCenterHeaderView; @class _SBUIWidgetViewController; @class SBUIController; 


#line 155 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixNC.xm"
static void (*_logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$)(SBUIController*, SEL, id); static void _logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$(SBUIController*, SEL, id); static BOOL (*_logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe)(SBUIController*, SEL); static BOOL _logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$)(SBNotificationCenterController*, SEL, CGPoint); static void _logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController*, SEL, CGPoint); static CGSize (*_logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$)(SBTodayTableHeaderView*, SEL, CGSize); static CGSize _logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView*, SEL, CGSize); static void (*_logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews)(SBTodayTableFooterView*, SEL); static void _logos_method$MixNC$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView*, SEL); static void (*_logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews)(SBTodayBulletinCell*, SEL); static void _logos_method$MixNC$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell*, SEL); static id (*_logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$)(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static id _logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView*, SEL, CGRect, int); static void (*_logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews)(SBNotificationCenterHeaderView*, SEL); static void _logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad)(SBNotificationCenterViewController*, SEL); static void _logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController*, SEL); static void (*_logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule)(SBNotificationCenterViewController*, SEL); static void _logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController*, SEL); static float (*_logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$)(SBModeViewController*, SEL, int); static float _logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$(SBModeViewController*, SEL, int); static void (*_logos_orig$MixNC$SBModeViewController$hostWillPresent)(SBModeViewController*, SEL); static void _logos_method$MixNC$SBModeViewController$hostWillPresent(SBModeViewController*, SEL); static id (*_logos_orig$MixNC$_SBUIWidgetViewController$init)(_SBUIWidgetViewController*, SEL); static id _logos_method$MixNC$_SBUIWidgetViewController$init(_SBUIWidgetViewController*, SEL); static id (*_logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText)(SBNotificationsAllModeViewController*, SEL); static id _logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController*, SEL); static UIView * (*_logos_orig$MixNC$SBBannerContainerView$backgroundView)(SBBannerContainerView*, SEL); static UIView * _logos_method$MixNC$SBBannerContainerView$backgroundView(SBBannerContainerView*, SEL); static id (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState)(Class, SEL); static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState(Class, SEL); static int (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState)(Class, SEL); static int _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class, SEL); static id (*_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$)(Class, SEL, float, int); static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class, SEL, float, int); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$setBounds$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$MixNC$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$setFrame$)(SBNotificationSeparatorView*, SEL, CGRect); static void _logos_method$MixNC$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView*, SEL, CGRect); static void (*_logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState)(SBNotificationSeparatorView*, SEL); static void _logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView*, SEL); static id (*_logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$)(SBNotificationSeparatorView*, SEL, CGRect, int); static id _logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView*, SEL, CGRect, int); 


static void _logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$(SBUIController* self, SEL _cmd, id gesture) {
    if (removeNotify && enabled) {
        
    } else {
        _logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$(self, _cmd, gesture);
    }
}

static BOOL _logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(SBUIController* self, SEL _cmd) {
    if (noFirstSlideNotify && enabled) {
        return YES;
    } else {
        return _logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe(self, _cmd);
    }
}



static void _logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(SBNotificationCenterController* self, SEL _cmd, CGPoint touchLocation) {
    loadPrefs();
    _logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$(self, _cmd, touchLocation);
}



static CGSize _logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$(SBTodayTableHeaderView* self, SEL _cmd, CGSize fits) {
    CGSize original = _logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$(self, _cmd, fits);
    if (hideTodayDate && enabled) {
        [self setHidden:YES];
        return CGSizeMake(0,0);
    } else {
        return original;
    }
}



static void _logos_method$MixNC$SBTodayTableFooterView$layoutSubviews(SBTodayTableFooterView* self, SEL _cmd) {
    _logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews(self, _cmd);
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



static void _logos_method$MixNC$SBTodayBulletinCell$layoutSubviews(SBTodayBulletinCell* self, SEL _cmd) {
    _logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews(self, _cmd);
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




static id _logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(SBNotificationCenterSeparatorView* self, SEL _cmd, CGRect theRect, int theInt) {
    if (hideLines && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$(self, _cmd, theRect, theInt);
    }
}



static void _logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews(SBNotificationCenterHeaderView* self, SEL _cmd) {
    _logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews(self, _cmd);
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



static void _logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad(SBNotificationCenterViewController* self, SEL _cmd) {
    _logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad(self, _cmd);
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

static void _logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule(SBNotificationCenterViewController* self, SEL _cmd) {
    if (hideFootRule && enabled) {
        
    } else {
        return _logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule(self, _cmd);
    }
}



static float _logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$(SBModeViewController* self, SEL _cmd, int mode) {
    if (hideTodayTabs && enabled) {
        return 0;
    } else {
        return _logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$(self, _cmd, mode);
    }
}

static void _logos_method$MixNC$SBModeViewController$hostWillPresent(SBModeViewController* self, SEL _cmd) {
    int index = 0;
    if (hideToday && enabled) {
        index = 1;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    if (hideNotify && enabled) {
        index = 0;
        [self setSelectedViewController:[[self viewControllers] objectAtIndex:index]];
    }
    _logos_orig$MixNC$SBModeViewController$hostWillPresent(self, _cmd);
}



static id _logos_method$MixNC$_SBUIWidgetViewController$init(_SBUIWidgetViewController* self, SEL _cmd) {
    if ([NSStringFromClass([self class]) isEqualToString:@"AttributionWeeAppController"] && hideTodayFootText && enabled) {
        return nil;
    } else {
        self = _logos_orig$MixNC$_SBUIWidgetViewController$init(self, _cmd);
        return self;
    }
}



static id _logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(SBNotificationsAllModeViewController* self, SEL _cmd) {
    if (hideNotifyText && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText(self, _cmd);
    }
}



static UIView * _logos_method$MixNC$SBBannerContainerView$backgroundView(SBBannerContainerView* self, SEL _cmd) {
    if (hideNotifyBanners && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBBannerContainerView$backgroundView(self, _cmd);
    }
}



static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState(self, _cmd);
    }
}

static int _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(Class self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        return 0;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState(self, _cmd);
    }
}


static id _logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(Class self, SEL _cmd, float screenScale, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$(self, _cmd, screenScale, mode);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$setBounds$(SBNotificationSeparatorView* self, SEL _cmd, CGRect bounds) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$setBounds$(self, _cmd, bounds);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$setFrame$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$setFrame$(self, _cmd, frame);
    }
}

static void _logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState(SBNotificationSeparatorView* self, SEL _cmd) {
    if (hideNotifyLines && enabled) {
        
    } else {
        _logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState(self, _cmd);
    }
}
static id _logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(SBNotificationSeparatorView* self, SEL _cmd, CGRect frame, int mode) {
    if (hideNotifyLines && enabled) {
        return nil;
    } else {
        return _logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$(self, _cmd, frame, mode);
    }
}




static __attribute__((constructor)) void _logosLocalCtor_1e5f32c4() {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        {Class _logos_class$MixNC$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$MixNC$SBUIController, @selector(handleShowNotificationsSystemGesture:), (IMP)&_logos_method$MixNC$SBUIController$handleShowNotificationsSystemGesture$, (IMP*)&_logos_orig$MixNC$SBUIController$handleShowNotificationsSystemGesture$);MSHookMessageEx(_logos_class$MixNC$SBUIController, @selector(shouldShowNotificationCenterTabControlOnFirstSwipe), (IMP)&_logos_method$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe, (IMP*)&_logos_orig$MixNC$SBUIController$shouldShowNotificationCenterTabControlOnFirstSwipe);Class _logos_class$MixNC$SBNotificationCenterController = objc_getClass("SBNotificationCenterController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterController, @selector(beginPresentationWithTouchLocation:), (IMP)&_logos_method$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$, (IMP*)&_logos_orig$MixNC$SBNotificationCenterController$beginPresentationWithTouchLocation$);Class _logos_class$MixNC$SBTodayTableHeaderView = objc_getClass("SBTodayTableHeaderView"); MSHookMessageEx(_logos_class$MixNC$SBTodayTableHeaderView, @selector(sizeThatFits:), (IMP)&_logos_method$MixNC$SBTodayTableHeaderView$sizeThatFits$, (IMP*)&_logos_orig$MixNC$SBTodayTableHeaderView$sizeThatFits$);Class _logos_class$MixNC$SBTodayTableFooterView = objc_getClass("SBTodayTableFooterView"); MSHookMessageEx(_logos_class$MixNC$SBTodayTableFooterView, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBTodayTableFooterView$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBTodayTableFooterView$layoutSubviews);Class _logos_class$MixNC$SBTodayBulletinCell = objc_getClass("SBTodayBulletinCell"); MSHookMessageEx(_logos_class$MixNC$SBTodayBulletinCell, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBTodayBulletinCell$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBTodayBulletinCell$layoutSubviews);Class _logos_class$MixNC$SBNotificationCenterSeparatorView = objc_getClass("SBNotificationCenterSeparatorView"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$MixNC$SBNotificationCenterSeparatorView$initWithFrame$mode$);Class _logos_class$MixNC$SBNotificationCenterHeaderView = objc_getClass("SBNotificationCenterHeaderView"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterHeaderView, @selector(layoutSubviews), (IMP)&_logos_method$MixNC$SBNotificationCenterHeaderView$layoutSubviews, (IMP*)&_logos_orig$MixNC$SBNotificationCenterHeaderView$layoutSubviews);Class _logos_class$MixNC$SBNotificationCenterViewController = objc_getClass("SBNotificationCenterViewController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterViewController, @selector(viewDidLoad), (IMP)&_logos_method$MixNC$SBNotificationCenterViewController$viewDidLoad, (IMP*)&_logos_orig$MixNC$SBNotificationCenterViewController$viewDidLoad);MSHookMessageEx(_logos_class$MixNC$SBNotificationCenterViewController, @selector(_loadhidefootrule), (IMP)&_logos_method$MixNC$SBNotificationCenterViewController$_loadhidefootrule, (IMP*)&_logos_orig$MixNC$SBNotificationCenterViewController$_loadhidefootrule);Class _logos_class$MixNC$SBModeViewController = objc_getClass("SBModeViewController"); MSHookMessageEx(_logos_class$MixNC$SBModeViewController, @selector(_headerViewHeightForMode:), (IMP)&_logos_method$MixNC$SBModeViewController$_headerViewHeightForMode$, (IMP*)&_logos_orig$MixNC$SBModeViewController$_headerViewHeightForMode$);MSHookMessageEx(_logos_class$MixNC$SBModeViewController, @selector(hostWillPresent), (IMP)&_logos_method$MixNC$SBModeViewController$hostWillPresent, (IMP*)&_logos_orig$MixNC$SBModeViewController$hostWillPresent);Class _logos_class$MixNC$_SBUIWidgetViewController = objc_getClass("_SBUIWidgetViewController"); MSHookMessageEx(_logos_class$MixNC$_SBUIWidgetViewController, @selector(init), (IMP)&_logos_method$MixNC$_SBUIWidgetViewController$init, (IMP*)&_logos_orig$MixNC$_SBUIWidgetViewController$init);Class _logos_class$MixNC$SBNotificationsAllModeViewController = objc_getClass("SBNotificationsAllModeViewController"); MSHookMessageEx(_logos_class$MixNC$SBNotificationsAllModeViewController, @selector(contentUnavailableText), (IMP)&_logos_method$MixNC$SBNotificationsAllModeViewController$contentUnavailableText, (IMP*)&_logos_orig$MixNC$SBNotificationsAllModeViewController$contentUnavailableText);Class _logos_class$MixNC$SBBannerContainerView = objc_getClass("SBBannerContainerView"); MSHookMessageEx(_logos_class$MixNC$SBBannerContainerView, @selector(backgroundView), (IMP)&_logos_method$MixNC$SBBannerContainerView$backgroundView, (IMP*)&_logos_orig$MixNC$SBBannerContainerView$backgroundView);Class _logos_class$MixNC$SBNotificationSeparatorView = objc_getClass("SBNotificationSeparatorView"); Class _logos_metaclass$MixNC$SBNotificationSeparatorView = object_getClass(_logos_class$MixNC$SBNotificationSeparatorView); MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorForCurrentState), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorForCurrentState, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorForCurrentState);MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorViewModeForCurrentState), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorViewModeForCurrentState);MSHookMessageEx(_logos_metaclass$MixNC$SBNotificationSeparatorView, @selector(separatorWithScreenScale:mode:), (IMP)&_logos_meta_method$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$, (IMP*)&_logos_meta_orig$MixNC$SBNotificationSeparatorView$separatorWithScreenScale$mode$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(setBounds:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$setBounds$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$setBounds$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(setFrame:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$setFrame$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$setFrame$);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(updateForCurrentState), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$updateForCurrentState, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$updateForCurrentState);MSHookMessageEx(_logos_class$MixNC$SBNotificationSeparatorView, @selector(initWithFrame:mode:), (IMP)&_logos_method$MixNC$SBNotificationSeparatorView$initWithFrame$mode$, (IMP*)&_logos_orig$MixNC$SBNotificationSeparatorView$initWithFrame$mode$);}
    }
}
