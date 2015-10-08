#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixCCListController : SKTintedListController <SKListControllerProtocol>
@end

@implementation MixCCListController

- (UIColor *) tintColor { return [UIColor darkGrayColor]; }
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
             PSSwitchCell(@"Hide Quick Switcher", @"hidesSwitching"),
             PSSwitchCell(@"Hide Brightness Slider", @"hideBrightness"),
             PSSwitchCell(@"Hide Media Control", @"hideMedia"),
             PSSwitchCell(@"Hide AirPlay / AirDrop", @"hideAirad"),
             PSSwitchCell(@"Hide Quick Launcher", @"hideQuickLaunch"),
             PSGroupCell (@""),
             PSSwitchCell(@"No ControlCenter Blur", @"hideCCBlur"),
             PSSwitchCell(@"Hide ControlCenter Background", @"hideCCBackground"),
             PSSwitchCell(@"Fix ControlCenter on Lockscreen", @"fixLockShowCC"),
             PSSwitchCell(@"Hide ControlCenter Lines", @"hideCCRules"),
             PSSwitchCell(@"Use 7.x Old Animation", @"ccOldBound"),
             PSSwitchCell(@"Swipe Again to Activitive ControlCenter", @"noFirstSlideCC"),
             PSGroupCell (@""),
             PSSwitchCell(@"Remove ControlCenter Completely;", @"removeCC"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}


@end
