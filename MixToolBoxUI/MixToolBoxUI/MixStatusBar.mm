#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>


@interface MixStatusBarListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation MixStatusBarListController

 -(UIColor*) tintColor { return [UIColor darkGrayColor]; }
 -(BOOL) tintNavigationTitleText { return NO; }
 -(BOOL) showHeartImage { return NO; }
 -(NSString*) headerSubText { return @"Statusbar"; }
 
 
-(NSArray*) customSpecifiers
{
    return @[
    @{ @"cell":@"PSGroupCell",
       @"footerCellClass":@"MixStatusBarTitleCell", },
     PSGroupCell(@""),
     PSGroupCell(@""),
    @{
                 @"cell": @"PSSwitchCell",
                 @"default": @NO,
                 @"defaults": @"com.apple.springboard",
                 @"PostNotification": @"com.jc.mixtoolbox/changed",
                 @"key": @"SBShowGSMRSSI",
                 @"label": @"数字信号显示"
                 },
    PSGroupCellLAF(@"时间格式设置",@"开启空闲内存/内网IP显示会在自定义时间格式后增加空闲内存/内网IP显示"), 
    PSEditTextCell(@"请输入时间格式:",@"timeFormat"),
    PSSwitchCell(@"开始空闲内存显示",@"MixRAM"),
    PSSwitchCell(@"开始内网IP显示",@"MixIP"), 
    @{ @"cell":@"PSGroupCell",
          @"footerText":@"此选项可以在设备静音时在状态栏上显示静音标识"},
    PSSwitchCell(@"状态栏静音图标",@"MixMinVol"),     
    PSGroupCell(@"元素隐藏区"),
    PSSwitchCell(@"隐藏时间显示",@"MixHideTime"),
    PSSwitchCell(@"隐藏勿扰图标",@"MixHideNotDisturb"),
    PSSwitchCell(@"隐藏飞行模式图标",@"MixHideAirplane"),
    PSSwitchCell(@"隐藏信号显示",@"MixHideSignal"),
    PSGroupCell(@""),
    PSSwitchCell(@"隐藏运营商显示",@"MixHideCarrier"),
    PSSwitchCell(@"隐藏数据图标",@"MixHideData"),
    PSSwitchCell(@"隐藏电池图标",@"MixHideBattery"),
    PSSwitchCell(@"开启电池百分比显示(ipod专用)",@"MixShowBP"),
    PSGroupCell(@""),
    PSSwitchCell(@"隐藏闹钟图标",@"MixHideAlarm"),
    PSSwitchCell(@"隐藏定位图标",@"MixHideGeoItem"),
    PSSwitchCell(@"隐藏竖屏锁定图标",@"MixHideRotation"),
    PSSwitchCell(@"隐藏数据转换图标",@"MixHideDataSpinner"),
    PSGroupCell(@""),
    PSEditTextCell(@"运营商文字:",@"customSignal"),
    
    PSGroupCenterCell(@"© 2015 Mix ToolBox by J.C.T"),
             ];
}

/*-(void) respring:(PSSpecifier*)PSSpecifier {
 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你确定注销么？"
           message:@"注销会保存并应用当前设置入｀"
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
} */
@end