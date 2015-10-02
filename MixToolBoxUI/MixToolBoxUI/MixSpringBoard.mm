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
    @{ @"cell":@"PSGroupCell",
       @"footerCellClass":@"MixSBTitleCell", },
    PSGroupCell(@""),   
    PSGroupCell(@""),   
    PSSwitchCell(@"隐藏文件夹背景",@"noFolderBackground"),
    PSSwitchCell(@"隐藏报刊杂志",@"hideNews"),
    PSSwitchCell(@"禁用时钟动画",@"noClockAnimate"),
    PSSwitchCell(@"禁用搜索栏",@"rmSearch"),
    PSGroupCell(@""),
    PSSwitchCell(@"禁用语音控制",@"disVoice"),
    PSSwitchCell(@"隐藏分页点",@"SBHideIndicator"),
    PSSwitchCell(@"去除桌面阴影",@"rmShadow"),
    PSSwitchCell(@"去除小黄点",@"rmYellowDot"),
    PSSwitchCell(@"去除小蓝点",@"rmBlueDot"),
    PSSwitchCell(@"去除Dock背景",@"HideDockBackgrouond"),
    PSSwitchCell(@"隐藏后台主屏幕模糊背景",@"HideAppSwitcherBackground"),
    PSSwitchCell(@"禁止图标抖动",@"rmIconJitter"),
    PSSwitchCell(@"去除Spotlight模糊背景",@"rmSpotlightBlur"),
    PSSwitchCell(@"去除壁纸视差效果",@"rmParallax"),
    PSSwitchCell(@"禁止壁纸放大",@"rmWallpaperZoom"),
    PSSwitchCell(@"全局微透效果",@"AllReplaceBlur"),
    PSSwitchCell(@"全局毛玻璃效果",@"AllBlurGlass"),
    PSSwitchCell(@"全局透明",@"AllTransparent"),
    PSSwitchCell(@"全局微透2",@"AllReplaceBlur2"),
    PSSwitchCell(@"去除角标背景",@"rmBadgeBackground"),
    PSSwitchCell(@"隐藏所有角标",@"HideBadge"),
    
    PSGroupCenterCell(@"Mix ToolBox © 2015 By J.C.T"),      ];
}

-(void) respring:(PSSpecifier*)PSSpecifier {
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
@end
