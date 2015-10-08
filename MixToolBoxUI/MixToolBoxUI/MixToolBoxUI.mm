#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import <SettingsKit/SKSharedHelper.h>
#import <UIKit/UIKit.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixToolBoxUIController: SKTintedListController <SKListControllerProtocol>
@end

@implementation MixToolBoxUIController

NSString *path = @"/private/var/mobile/Library/Preferences/com.jc.MixToolBox.plist";
NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
static UIColor *tintcolor;
static NSInteger colorChoose = [[prefs objectForKey:@"colorChoose"] integerValue];

-(UIColor*) tintColor {
    switch(colorChoose)
    {
        case 0:
            tintcolor = [UIColor darkGrayColor];
            break;
        case 1:
            tintcolor = [UIColor colorWithRed:255.0/255.0 green:182.0/255.0 blue:193.0/255.0 alpha:1.0];
            break;
        default:
            tintcolor = [UIColor darkGrayColor];
            break;
    }
    return tintcolor;
}

-(UIColor*) switchTintColor {
    switch(colorChoose)
    {
        case 0:
            tintcolor = [UIColor grayColor];
            break;
        case 1:
            tintcolor = [UIColor  colorWithRed:255.0/255.0 green:182.0/255.0 blue:193.0/255.0 alpha:1.0];
            break;
            
        default:
            tintcolor = [UIColor grayColor];
            break;
    }
    return tintcolor;
}
-(BOOL) tintNavigationTitleText { return NO; }


-(NSString*) headerText {
    return @"MixToolBox"; }
-(NSString*) headerSubText { return @"By JailbreakCatTeam"; }

-(NSString*) customTitle { return @"MixToolBox"; }
-(NSString*) headerByText {
    NSArray *choice = @[@"Your Phone, Your Way. ", @"Customize Your Control Center! ", @"Customize Your Notification Center! ", @"Customize Your Statusbar! ", @"Customize Your SpringBoard! "];
    NSUInteger randomIndex = arc4random() % [choice count];
    return choice[randomIndex];
}

-(NSString*) shareMessage { return MIXLocalizedString(@"I have found a great tweak called \"MixToolBox\". You can customize every detail of your iDevice! Have a look at http://www.yymao.net/"); }

-(NSArray*) customSpecifiers
{
    return @[
             PSGroupCell(@""),
             PSGroupCellLAF(@"", @"All the functions are controlled by this toggle. "),
             PSSwitchCell(@"enabled", @"enabled"),
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"This function is experimental. Respring after toggling this. ",
                 },
             @{
                 @"cell": @"PSLinkListCell",
                 @"label": @"Theme",
                 @"detail": @"PSListItemsController",
                 @"validValues": [NSArray arrayWithObjects:@"0", @"1", nil],
                 @"validTitles": [NSArray arrayWithObjects:@"Cool Gray", @"Cute Pink", nil],
                 @"key": @"colorChoose",
                 @"defaults": @"com.jc.MixToolBox",
                 @"PostNotification": @"com.jc.MixToolBox/changed"
                 },
             PSGroupCell(@""),
             PSGroupCell(@"Function Toggles"),
             PSLinkCell(@"Lock Screen", @"MixLSListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"Status Bar", @"MixStatusBarListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"Home Screen", @"MixSBListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"Notification Center", @"MixNCListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"Control Center", @"MixCCListController"),
             @{
                 @"cell": @"PSButtonCell",
                 @"label": @"Respring & Apply",
                 @"action": @"respring:",
                 @"alignment": @2,
                 },
             // PSGroupCell(@""),
             PSGroupCell(@""),
             @{
                 @"cell": @"PSTitleValueCell",
                 @"label": [NSString stringWithFormat:@"%@%@", @"Version: ", MIX_VERSION],
                 },
             PSLinkCell(@"About J.C.T.", @"MixJCTListController"),
             PSGroupCell(@""),
             PSButtonCell(@"Visit Our Website", @"website:"),
             PSButtonCell(@"Give Us Some Advice", @"giveAdvice:"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

- (void)website:(PSSpecifier*)PSSpecifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yymao.net/"]];
}

-(void)giveAdvice:(PSSpecifier*)PSSpecifier {
    [SKSharedHelper openEmail:@"jct@82flex.com" subject:@"MixToolBox"];
}

- (void)respring:(PSSpecifier*)PSSpecifier {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:MIXLocalizedString(@"Confirm")
                                                    message:MIXLocalizedString(@"Click \"Respring Now\" to apply your changes. ")
                                                   delegate:self
                                          cancelButtonTitle:MIXLocalizedString(@"Cancel")
                                          otherButtonTitles:MIXLocalizedString(@"Respring Now"), nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) //&& alertView.cancelButtonIndex != buttonIndex)
    {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-9", "SpringBoard", "backboardd", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }
}

@end
