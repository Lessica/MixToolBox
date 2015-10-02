#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixNCListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation MixNCListController

 -(UIColor*) tintColor { return [UIColor blackColor]; }
-(UIColor*) navigationTitleTintColor { return [UIColor darkGrayColor]; }
 -(BOOL) tintNavigationTitleText { return NO; }
 -(BOOL) showHeartImage { return NO; }
 
-(NSArray*) customSpecifiers
{
    return @[
                @{ @"cell": @"PSGroupCell",
                 @"footerCellClass": @"MixNCTitleCell"
                 },
             @{ @"cell": @"PSGroupCell" },
             @{
                 @"cell": @"PSGroupCell",
                 @"label": @""
                 },
             PSSwitchCell(@"隐藏通知中心今日头部标签",@"hideTodayTabs"),
             PSSwitchCell(@"隐藏通知中心今日日期",@"hideTodayDate"),
             PSSwitchCell(@"隐藏通知中心部件标签",@"hideTodayHeaders"),
             PSSwitchCell(@"隐藏通知中心所有头部标签",@"hideNotifyHeaders"),
             PSSwitchCell(@"隐藏通知中心推送",@"hideNotifyBanners"),
             PSSwitchCell(@"隐藏通知中心编辑按钮",@"hidEditButton"),
             PSSwitchCell(@"隐藏通知中心新部件通知",@"hideWidgetNew"),
             @{ @"cell": @"PSGroupCell" },
             PSSwitchCell(@"隐藏通知中心所有分割线",@"hideNotifyLines"),
             PSSwitchCell(@"隐藏通知中心底部分割线",@"hideFootRule"),
             PSSwitchCell(@"隐藏通知中心编辑按钮分割线",@"hideEditRule"),
             PSSwitchCell(@"隐藏通知中心更多分割线",@"hideLines"),
             @{ @"cell": @"PSGroupCell" },             
             PSSwitchCell(@"替换通知中心背景为黑色",@"hideNCBackground"),
             @{ @"cell": @"PSGroupCell" },            
             PSSwitchCell(@"隐藏通知中心天气信息",@"hideTodayWeatherText"),
             PSSwitchCell(@"隐藏'没有通知'",@"hideNotifyText"),
             PSSwitchCell(@"隐藏通知中心状态栏",@"hideStatus"),            
             PSSwitchCell(@"隐藏通知栏标签",@"hideNotify"),
             PSSwitchCell(@"首次滑动不显示通知中心",@"noFirstSlideNotify"),
             @{ @"cell": @"PSGroupCell" },
             PSSwitchCell(@"完全移除通知中心",@"removeNotify"),
             @{
                 @"cell": @"PSGroupCell",
                 @"alignment": @"1",
                 @"label": @"Mix ToolBox © 2015 By J.C.T. ",
                 },
             ];
}

/*-(void) respring:(PSSpecifier*)PSSpecifier {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你确定注销么？"
           message:@"注销会保存并应用当前设置"
           delegate:self
           cancelButtonTitle:@"还是算了"
           otherButtonTitles:@"我确定",nil];
     [alert show];
 }
 
 -(void) viewWillAppear:(BOOL)animated {
 UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"注销"
    style:UIBarButtonItemStyleBordered
       target:self
       action:@selector(respring:)];
 
 ((UINavigationItem*)[super navigationItem]).rightBarButtonItem = barButton;
 }
 
 - (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) //&& alertView.cancelButtonIndex != buttonIndex)
  {
pid_t pid;
int status;
const char* args[] = {"killall","-9","backboardd",NULL};
posix_spawn(&pid,"usr/bin/killall",NULL,NULL,(char*const*)args,NULL);
waitpid(pid,&status,WEXITED);
  }
}
*/

@end
