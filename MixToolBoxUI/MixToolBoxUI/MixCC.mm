#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>
#import "SKdefines.h"
#import <spawn.h>

@interface MixCCListController : SKTintedListController <SKListControllerProtocol>
@end

@implementation MixCCListController

- (UIColor *) tintColor { return [UIColor blackColor]; }
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
             PSSwitchCell(@"隐藏快捷功能开关", @"hidesSwitching"),
             PSSwitchCell(@"隐藏亮度控制条", @"hideBrightness"),
             PSSwitchCell(@"隐藏音乐控制", @"hideMedia"),
             PSSwitchCell(@"隐藏 Airplay / Airdrop", @"hideAirad"),
             PSSwitchCell(@"隐藏快捷启动", @"hideQuickLaunch"),
             PSGroupCell (@""),
             PSSwitchCell(@"隐藏控制中心模糊效果", @"hideCCBlur"),
             PSSwitchCell(@"隐藏控制中心背景", @"hideCCBackground"),
             PSSwitchCell(@"修复锁屏界面不显示控制中心", @"fixLockShowCC"),
             PSSwitchCell(@"隐藏控制中心分割线", @"hideCCRules"),
             PSSwitchCell(@"使用 7.x 旧动画", @"ccOldBound"),
             PSSwitchCell(@"首次滑动不显示控制中心", @"noFirstSlideCC"),
             PSGroupCell (@""),
             PSSwitchCell(@"完全移除控制中心", @"removeCC"),
             PSGroupCenterCell(PSCopyrightFooter),
             ];
}

/*
- (void)respring:(PSSpecifier*)PSSpecifier {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你确定注销么？"
                                                    message:@"注销会保存并应用当前设置"
                                                   delegate:self
                                          cancelButtonTitle:@"还是算了"
                                          otherButtonTitles:@"我确定",nil];
    [alert show];
}
 
- (void)viewWillAppear:(BOOL)animated {
     UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"注销"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(respring:)];
    ((UINavigationItem*)[super navigationItem]).rightBarButtonItem = barButton;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) //&& alertView.cancelButtonIndex != buttonIndex)
  {
      pid_t pid;
      int status;
      const char* args[] = {"killall", "-9", "backboardd", NULL};
      posix_spawn(&pid, "usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
      waitpid(pid,&status,WEXITED);
  }
}
 */
           
@end
