#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixNCListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation MixNCListController

- (UIColor*) tintColor { return [UIColor darkGrayColor]; }
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
             PSSwitchCell(@"Hide Today Tabs", @"hideTodayTabs"),
             PSSwitchCell(@"Hide Today Date", @"hideTodayDate"),
             PSSwitchCell(@"Hide Today Headers", @"hideTodayHeaders"),
             PSSwitchCell(@"Hide All Headers", @"hideNotifyHeaders"),
             PSSwitchCell(@"Hide Notification Banners", @"hideNotifyBanners"),
             PSSwitchCell(@"Hide Edit Button", @"hidEditButton"),
             PSSwitchCell(@"Hide \"New Widget\" Tips", @"hideWidgetNew"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"Hide All Dividing Lines", @"hideNotifyLines"),
             PSSwitchCell(@"Hide Footer Lines", @"hideFootRule"),
             PSSwitchCell(@"Hide Edit Lines", @"hideEditRule"),
             PSSwitchCell(@"Hide More Lines", @"hideLines"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"Hide Background Image", @"hideNCBackground"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"Hide Today Weather Label", @"hideTodayWeatherText"),
             PSSwitchCell(@"Hide \"No Notification\" Label", @"hideNotifyText"),
             PSSwitchCell(@"Hide Statusbar", @"hideStatus"),
             PSSwitchCell(@"Hide Notification Labels", @"hideNotify"),
             PSSwitchCell(@"Swipe Again To Activate", @"noFirstSlideNotify"),
             PSGroupCellWithOutLabel,
             PSSwitchCell(@"Remove Notification Center", @"removeNotify"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
