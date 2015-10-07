#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import <UIKit/UIKit.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixToolBoxUIController: SKTintedListController <SKListControllerProtocol>
@end

@implementation MixToolBoxUIController

NSString *path = @"/var/mobile/Library/Preferences/com.jc.MixToolBox.plist";
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
-(NSString*) headerSubText { return @"By JailCatTeam"; }

-(NSString*) customTitle { return @"MixToolBox"; }
-(NSString*) headerByText {
    NSArray *choice = @[@"Your phone, Your way", @"Custom your Control Center!", @"Custom your Notification Center!", @"Custom your Statusbar!", @"Custom your SpringBoard!", @"Imagine Change For Your Call"];
    NSUInteger randomIndex = arc4random() % [choice count];
    return choice[randomIndex];
}

-(NSString*) shareMessage {return @"MixToolBox 这插件很不错呢，我正在在用，小伙伴们一起来用吧～，详情请查看 http://www.yymao.net/";}

-(NSArray*) customSpecifiers
{
    return @[
             PSGroupCell(@""),
             PSGroupCellLAF(@"", @"以下功能区中的开关均以此开关为基础"),
             PSSwitchCell(@"开启", @"enabled"),
             //PSGroupCell(@""),
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"此功能为试验功能，目前仅支持主界面的主题替换！主题更改后需注销才可生效！我们会尽快更新",
                 },
             @{
                 @"cell": @"PSLinkListCell",
                 @"label": @"主题选择",
                 @"detail": @"PSListItemsController",
                 @"validValues": [NSArray arrayWithObjects:@"0", @"1", nil],
                 @"validTitles": [NSArray arrayWithObjects:@"炫酷深灰", @"呆萌粉色", nil],
                 @"key": @"colorChoose",
                 @"defaults": @"com.jc.MixToolBox",
                 @"PostNotification": @"com.jc.MixToolBox/changed"
                 },
             PSGroupCell(@""),
             PSGroupCell(@"功能区"),
             PSLinkCell(@"锁屏", @"MixLSListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"状态栏", @"MixStatusBarListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"主屏幕 (SpringBoard)", @"MixSBListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"通知中心", @"MixNCListController"),
             //PSGroupCell(@""),
             PSLinkCell(@"控制中心", @"MixCCListController"),
             @{
                 @"cell": @"PSButtonCell",
                 @"label": @"注销",
                 @"action": @"respring:",
                 @"alignment": @2,
                 },
             // PSGroupCell(@""),
             PSGroupCell(@""),
             @{
                 @"cell": @"PSTitleValueCell",
                 @"label": @"Version:2.0",
                 },
             PSLinkCell(@"J.C.T 成员名单", @"MixJCTListController"),
             PSGroupCell(@""),
             PSButtonCell(@"访问越狱猫首页", @"website:"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

- (void)website:(PSSpecifier*)PSSpecifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yymao.net/"]];
}

- (void)respring:(PSSpecifier*)PSSpecifier {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你确定注销么？"
                                                    message:@"注销会保存并应用当前设置"
                                                   delegate:self
                                          cancelButtonTitle:@"还是算了"
                                          otherButtonTitles:@"我确定",nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) //&& alertView.cancelButtonIndex != buttonIndex)
    {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-9", "backboardd", NULL};
        posix_spawn(&pid, "usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }
}

@end