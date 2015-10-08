#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixStatusBarListController : SKTintedListController <SKListControllerProtocol>
@end

@implementation MixStatusBarListController

-(UIColor *) tintColor { return [UIColor darkGrayColor]; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) showHeartImage { return NO; }
-(NSString *) headerSubText { return @"Statusbar"; }

- (NSArray *) customSpecifiers
{
    return @[
             @{
                 @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixStatusBarTitleCell",
                 },
             PSGroupCell(@""),
             PSGroupCell(@""),
             @{
                 @"cell": @"PSSwitchCell",
                 @"default": @NO,
                 @"defaults": @"com.apple.springboard",
                 @"PostNotification": @"com.jc.MixToolBox/changed",
                 @"key": @"SBShowGSMRSSI",
                 @"label": @"Digital Signal"
                 },
             PSGroupCellLAF(@"Time Format Settings", @"\"Show Free Memory\" and \"Show IP Address\" will be applied to the new formatted time string. "),
             PSEditTextCell(@"Input new time format here. ", @"timeFormat"),
             PSSwitchCell(@"Show Free Memory", @"MixRAM"),
             PSSwitchCell(@"Show IP Address", @"MixIP"),
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"Show an icon on your statusbar when muted. "
                 },
//             PSSwitchCell(@"Show Mute Icon", @"MixMinVol"),
             PSGroupCell (@"Hide Elements"),
             PSSwitchCell(@"Hide \"Time\" Label", @"MixHideTime"),
             PSSwitchCell(@"Hide \"No Disturb\" Icon", @"MixHideNotDisturb"),
             PSSwitchCell(@"Hide \"Airmode\" Icon", @"MixHideAirplane"),
             PSSwitchCell(@"Hide \"Signal\" Icon", @"MixHideSignal"),
             PSGroupCell (@""),
             PSSwitchCell(@"Hide \"Carrier\" Label", @"MixHideCarrier"),
             PSSwitchCell(@"Hide \"Cellular\" Icon", @"MixHideData"),
             PSSwitchCell(@"Hide \"Battery\" Icon", @"MixHideBattery"),
             PSSwitchCell(@"Show \"Battery Percentage\"", @"MixShowBP"),
             PSGroupCell (@""),
             PSSwitchCell(@"Hide \"Alarm\" Icon", @"MixHideAlarm"),
             PSSwitchCell(@"Hide \"Location\" Icon", @"MixHideGeoItem"),
             PSSwitchCell(@"Hide \"Rotation Lock\" Icon", @"MixHideRotation"),
             PSSwitchCell(@"Hide \"Data Spinner\" Icon", @"MixHideDataSpinner"),
             PSGroupCell (@""),
             PSEditTextCell(@"Custom Carrier Text", @"customSignal"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
