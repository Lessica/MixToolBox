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
             PSSwitchCell(@"Disable Background Blur", @"hideCCBlur"),
             PSSwitchCell(@"Hide Background", @"hideCCBackground"),
             PSSwitchCell(@"Fix Control Center on Lockscreen", @"fixLockShowCC"),
             PSSwitchCell(@"Hide All Dividing Lines", @"hideCCRules"),
             PSSwitchCell(@"Use 7.x Old Animation", @"ccOldBound"),
             PSSwitchCell(@"Swipe Again to Activate", @"noFirstSlideCC"),
             PSGroupCell (@""),
             PSSwitchCell(@"Remove Control Center", @"removeCC"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}


@end
