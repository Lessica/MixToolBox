#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixSBListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation MixSBListController

-(UIColor*) tintColor { return [UIColor darkGrayColor]; }
-(UIColor*) navigationTitleTintColor { return [UIColor darkGrayColor]; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) showHeartImage { return NO; }

-(NSArray*) customSpecifiers
{
    return @[
             @{ @"cell": @"PSGroupCell",
                @"footerCellClass": @"MixSBTitleCell",
                },
             PSGroupCell (@""),
             PSGroupCell (@""),
             PSSwitchCell(@"隐藏文件夹背景", @"noFolderBackground"),
             PSSwitchCell(@"隐藏报刊杂志", @"hideNews"),
             PSSwitchCell(@"禁用时钟动画", @"noClockAnimate"),
             PSSwitchCell(@"禁用搜索栏", @"rmSearch"),
             PSGroupCell (@""),
             PSSwitchCell(@"禁用语音控制", @"disVoice"),
             PSSwitchCell(@"隐藏分页点", @"SBHideIndicator"),
             PSSwitchCell(@"去除桌面阴影", @"rmShadow"),
             PSSwitchCell(@"去除小黄点", @"rmYellowDot"),
             PSSwitchCell(@"去除小蓝点", @"rmBlueDot"),
             PSSwitchCell(@"去除 Dock 背景", @"HideDockBackgrouond"),
             PSSwitchCell(@"隐藏后台主屏幕模糊背景", @"HideAppSwitcherBackground"),
             PSSwitchCell(@"禁止图标抖动", @"rmIconJitter"),
             PSSwitchCell(@"去除 Spotlight 模糊背景", @"rmSpotlightBlur"),
             PSSwitchCell(@"去除壁纸视差效果", @"rmParallax"),
             PSSwitchCell(@"禁止壁纸放大", @"rmWallpaperZoom"),
             PSSwitchCell(@"全局微透效果", @"AllReplaceBlur"),
             PSSwitchCell(@"全局毛玻璃效果", @"AllBlurGlass"),
             PSSwitchCell(@"全局透明", @"AllTransparent"),
             PSSwitchCell(@"全局微透2", @"AllReplaceBlur2"),
             PSSwitchCell(@"去除角标背景", @"rmBadgeBackground"),
             PSSwitchCell(@"隐藏所有角标", @"HideBadge"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
