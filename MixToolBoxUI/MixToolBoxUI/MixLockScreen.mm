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
             PSSwitchCell(@"Mini Time", @"showMiniTime"),
             PSGroupCell(@""),
             PSSwitchCell(@"Hide Top Grabber", @"hideTopGrabber"),
             PSSwitchCell(@"Hide Bottom Grabber", @"hideBottomGrabber"),
             PSSwitchCell(@"Hide Camera Icon", @"hideCameraGrabber"),
             PSSwitchCell(@"Hide Charging Text", @"hideChargingText"),
             PSSwitchCell(@"Hide \"Slide To Unlock\"", @"hideText"),
             PSGroupCell(@""),
             PSSwitchCell(@"Show Statusbar Time", @"showStatusBarTime"),
             PSSwitchCell(@"Home Screen Statusbar", @"sameStatusBar"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}
@end
