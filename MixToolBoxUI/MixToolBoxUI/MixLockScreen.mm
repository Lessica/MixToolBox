#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixLSListController : SKTintedListController <SKListControllerProtocol, UIAlertViewDelegate>
@end

@implementation MixLSListController

- (UIColor*) tintColor {
    return [UIColor darkGrayColor];
}
- (BOOL) tintNavigationTitleText { return NO; }
- (BOOL) showHeartImage { return NO; }


- (NSArray*) customSpecifiers
{
    return @[
             @{
                 @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixLSTitleCell",
                 },
             PSGroupCell(@""),
             PSGroupCell(@""),
             PSSwitchCell(@"开启锁屏迷你时钟", @"showMiniTime"),
             PSGroupCell(@""),
             PSSwitchCell(@"隐藏通知中心拉手", @"hideTopGrabber"),
             PSSwitchCell(@"隐藏控制中心拉手", @"hideBottomGrabber"),
             PSSwitchCell(@"隐藏右下角相机图标", @"hideCameraGrabber"),
             PSSwitchCell(@"隐藏充电文字显示", @"hideChargingText"),
             PSSwitchCell(@"隐藏解锁文字", @"hideText"),
             PSGroupCell(@""),
             PSSwitchCell(@"状态栏日期显示", @"showStatusBarTime"),
             PSSwitchCell(@"状态栏大小与桌面一致", @"sameStatusBar"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}
@end
