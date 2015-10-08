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
             PSSwitchCell(@"Hide Folder Background", @"noFolderBackground"),
             PSSwitchCell(@"Hide Newsstand", @"hideNews"),
             PSSwitchCell(@"Remove Clock Animation", @"noClockAnimate"),
             PSSwitchCell(@"Disable Spotlight", @"rmSearch"),
             PSGroupCell (@""),
             PSSwitchCell(@"Disable Voice Control", @"disVoice"),
             PSSwitchCell(@"Hide Page Indicator", @"SBHideIndicator"),
             PSSwitchCell(@"Remove Icon Shadow", @"rmShadow"),
             PSSwitchCell(@"\"Orange Me Not\"", @"rmYellowDot"),
             PSSwitchCell(@"\"Blue Me Not\"", @"rmBlueDot"),
             PSSwitchCell(@"Hide Dock Background", @"HideDockBackgrouond"),
             PSSwitchCell(@"Hide App Switcher Background", @"HideAppSwitcherBackground"),
             PSSwitchCell(@"Disable Icon Jittering", @"rmIconJitter"),
             PSSwitchCell(@"Disable Spotlight Blur", @"rmSpotlightBlur"),
             PSSwitchCell(@"Disable Wallpaper Parallax", @"rmParallax"),
             PSSwitchCell(@"Disable Wallpaper Zooming", @"rmWallpaperZoom"),
             PSSwitchCell(@"Global Blur View 1", @"AllReplaceBlur"),
             PSSwitchCell(@"Global Blur View 2", @"AllReplaceBlur2"),
             PSSwitchCell(@"Global Glass View", @"AllBlurGlass"),
             PSSwitchCell(@"Global Transparent View", @"AllTransparent"),
             PSSwitchCell(@"Hide Badge Background", @"rmBadgeBackground"),
             PSSwitchCell(@"Hide All Badges", @"HideBadge"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

@end
