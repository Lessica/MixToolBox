#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixNCListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation MixNCListController

- (UIColor*) tintColor { return [UIColor blackColor]; }
- (UIColor*) navigationTitleTintColor { return [UIColor darkGrayColor]; }
- (BOOL) tintNavigationTitleText { return NO; }
- (BOOL) showHeartImage { return NO; }

- (NSArray *) customSpecifiers
{
    return @[
             @{
                 @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixNCTitleCell"
                 },
             PSGroupCellWithOutLabel,
             PSGroupCell (@""),
             PSSwitchCell(@"隐藏通知中心今日头部标签", @"hideTodayTabs"),
             PSSwitchCell(@"隐藏通知中心今日日期", @"hideTodayDate"),
             PSSwitchCell(@"隐藏通知中心部件标签", @"hideTodayHeaders"),
             PSSwitchCell(@"隐藏通知中心所有头部标签", @"hideNotifyHeaders"),
             PSSwitchCell(@"隐藏通知中心推送", @"hideNotifyBanners"),
             PSSwitchCell(@"隐藏通知中心编辑按钮", @"hidEditButton"),
             PSSwitchCell(@"隐藏通知中心新部件通知", @"hideWidgetNew"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"隐藏通知中心所有分割线", @"hideNotifyLines"),
             PSSwitchCell(@"隐藏通知中心底部分割线", @"hideFootRule"),
             PSSwitchCell(@"隐藏通知中心编辑按钮分割线", @"hideEditRule"),
             PSSwitchCell(@"隐藏通知中心更多分割线", @"hideLines"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"替换通知中心背景为黑色", @"hideNCBackground"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"隐藏通知中心天气信息", @"hideTodayWeatherText"),
             PSSwitchCell(@"隐藏 \"没有通知\"", @"hideNotifyText"),
             PSSwitchCell(@"隐藏通知中心状态栏", @"hideStatus"),
             PSSwitchCell(@"隐藏通知栏标签", @"hideNotify"),
             PSSwitchCell(@"首次滑动不显示通知中心", @"noFirstSlideNotify"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"完全移除通知中心", @"removeNotify"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
