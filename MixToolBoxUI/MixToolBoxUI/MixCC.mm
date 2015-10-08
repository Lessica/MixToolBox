#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixCCListController : SKTintedListController <SKListControllerProtocol>
@end

@implementation MixCCListController

- (UIColor *) tintColor { return [UIColor blackColor]; }
- (UIColor *) navigationTitleTintColor { return [UIColor darkGrayColor]; }
- (BOOL) tintNavigationTitleText { return NO; }
- (BOOL) showHeartImage { return NO; }

- (NSArray*) customSpecifiers
{
    return @[
             @{
                 @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixCCTitleCell",
                 },
             PSGroupCell (@""),
             PSGroupCell (@""),
             PSSwitchCell(@"隐藏快捷功能开关", @"hidesSwitching"),
             PSSwitchCell(@"隐藏亮度控制条", @"hideBrightness"),
             PSSwitchCell(@"隐藏音乐控制", @"hideMedia"),
             PSSwitchCell(@"隐藏 AirPlay / AirDrop", @"hideAirad"),
             PSSwitchCell(@"隐藏快捷启动", @"hideQuickLaunch"),
             PSGroupCell (@""),
             PSSwitchCell(@"隐藏控制中心模糊效果", @"hideCCBlur"),
             PSSwitchCell(@"隐藏控制中心背景", @"hideCCBackground"),
             PSSwitchCell(@"修复锁屏界面不显示控制中心", @"fixLockShowCC"),
             PSSwitchCell(@"隐藏控制中心分割线", @"hideCCRules"),
             PSSwitchCell(@"使用 7.x 旧动画", @"ccOldBound"),
             PSSwitchCell(@"首次滑动不显示控制中心", @"noFirstSlideCC"),
             PSGroupCell (@""),
             PSSwitchCell(@"完全移除控制中心", @"removeCC"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
