#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"

@interface MixJCTListController : SKTintedListController <SKListControllerProtocol>
@end

@implementation MixJCTListController

- (BOOL) showHeartImage { return NO; }

- (NSString*) customTitle { return @"Team Members"; }

- (NSArray*) customSpecifiers
{
    return @[
             @{
                 @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixMemberTitleCell",
                 },
             PSGroupCell(@""),
             PSGroupCell(@""),
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"Cat (Chief Engineer)",
                 @"icon": @"cat.png",
                 @"action": @"CatWeibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 
                 @"cell": @"PSLinkCell",
                 @"label": @"Min (Chief Engineer)",
                 @"icon": @"min.png",
                 @"action": @"MinWeibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"i_82 (Security Engineer)",
                 @"icon": @"i_82.png",
                 @"action": @"i82Weibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"JK (Backend Engineer)",
                 @"icon": @"jk.png",
                 @"action": @"JKWeibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"Rain (Designer)",
                 @"icon": @"rain.png",
                 @"action": @"RainWeibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"Code (Website)",
                 @"icon": @"code.png",
                 @"action": @"CodeWeibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"zsm1703 (Weibo)",
                 @"icon": @"zsm1703.png",
                 @"action": @"zsm1703Weibo",
                 @"height": @80,
                 },
             @{
                 @"cell": @"PSGroupCell",
                 @"footerText": @"",
                 },
             @{
                 @"cell": @"PSLinkCell",
                 @"label": @"Wind (Testing)",
                 @"icon": @"wind.png",
                 @"action": @"WindWeibo",
                 @"height": @80,
                 },
             ];
}

- (void)CatWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/u/5251074189"]];
}

- (void)MinWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/520523409"]];
}

- (void)i82Weibo{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/82flex"]];
}

- (void)JKWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/405901422"]];
}

- (void)RainWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/2307960667"]];
}

- (void)CodeWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/u/3196393195"]];
}

- (void)zsm1703Weibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/u/1766730601"]];
}

- (void)WindWeibo {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/u/2201353320"]];
}

@end