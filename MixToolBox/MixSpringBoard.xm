#import <substrate.h>
#import "define.h"
#import <UIKit/UIKit.h>

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

MBOOL(enabled, NO);
MBOOL(noFolderBackground, NO);
MBOOL(hideNews, NO);
MBOOL(noClockAnimate, NO);
MBOOL(rmSearch, NO);
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



static void loadPrefs() {
    MAKEPREFS(@"var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
    if (prefs) {
        SETBOOL(enabled, "enabled");
        SETBOOL(noFolderBackground, "noFolderBackground");
        SETBOOL(hideNews, "hideNews");
        SETBOOL(noClockAnimate, "noClockAnimate");
        SETBOOL(rmSearch, "rmSearch");
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
    }
    [prefs release];
}

%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}


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
      brightness:(double)image2{ //隐藏所有角标
    if (HideBadge && enabled)
        return;
    %orig;
}
%end