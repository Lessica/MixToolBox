#import <substrate.h>
#import <UIKit/UIKit.h>
#import "define.h"
#import <sys/utsname.h>
#import <mach/mach.h>
#import <sys/types.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <sys/sysctl.h>
#import <mach/host_info.h>
#import <mach/mach_host.h>
#import <mach/task_info.h>
#import <mach/task.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import "ReRAM.m"
#import "LSStatusBarItem.h"

MBOOL(enabled, YES);
MBOOL(MixRAM, NO);
MBOOL(MixIP, NO);
MBOOL(MixHideTime, NO);
MBOOL(MixHideNotDisturb, NO);
MBOOL(MixHideAirplane, NO);
MBOOL(MixHideSignal, NO);
MBOOL(MixHideCarrier, NO);
MBOOL(MixHideData, NO);
MBOOL(MixHideBattery, NO);
//static double RAMTimeValue;
//待测试
MBOOL(MixShowBP, NO);
MBOOL(MixMinVol, NO);
MBOOL(MixHideAlarm, NO);
MBOOL(MixHideGeoItem, NO);
MBOOL(MixHideRotation, NO);
MBOOL(MixHideDataSpinner, NO);
TEXT(timeFormat);
TEXT(customSignal);
NSString *address;
LSStatusBarItem *mute;

static void loadPrefs() {
    MAKEPREFS(@"var/mobile/Library/Preferences/com.jc.MixToolBox.plist");
    if (prefs) {
        SETBOOL(enabled, "enabled");
        SETBOOL(MixRAM, "MixRAM");
        SETBOOL(MixIP, "MixIP");
        SETBOOL(MixHideTime, "MixHideTime");
        SETBOOL(MixHideNotDisturb, "MixHideNotDisturb");
        SETBOOL(MixHideAirplane, "MixHideAirplane");
        SETBOOL(MixHideSignal, "MixHideSignal");
        SETBOOL(MixHideCarrier, "MixHideCarrier");
        SETBOOL(MixHideData, "MixHideData");
        SETBOOL(MixHideBattery, "MixHideBattery");
        SETBOOL(MixShowBP, "MixShowBP");
        SETBOOL(MixHideAlarm, "MixHideAlarm");
        SETBOOL(MixHideGeoItem, "MixHideGeoItem");
        SETBOOL(MixHideRotation, "MixHideRotation");
        SETBOOL(MixMinVol, "MixMinVol");
        SETBOOL(MixHideDataSpinner, "MixHideDataSpinner");
        //SETDOUBLE(RAMTimeValue, "RAMTimeValue");
        SETTEXT(timeFormat, "timeFormat");
        SETTEXT(customSignal, "customSignal");
    }
    [timeFormat retain];
    [customSignal retain];
    [prefs release];
}

%group MixStatusBar

%hook SBStatusBarStateAggregator //初始化状态栏
/*
%new
- (void)refreshRAM {
    int mib[6];
    mib[0] = CTL_HW;
    mib[1] = HW_PAGESIZE;
    
    int pagesize;
    size_t length;
    length = sizeof (pagesize);
    if (sysctl (mib, 2, &pagesize, &length, NULL, 0) < 0)
    {
        fprintf (stderr, "getting page size");
    }
    
    mach_msg_type_number_t count = HOST_VM_INFO_COUNT;
    
    vm_statistics_data_t vmstat;
    if (host_statistics (mach_host_self (), HOST_VM_INFO, (host_info_t) &vmstat, &count) != KERN_SUCCESS)
    {
        fprintf (stderr, "Failed to get VM statistics.");
    }
    task_basic_info_64_data_t info;
    unsigned size = sizeof (info);
    task_info (mach_task_self (), TASK_BASIC_INFO_64, (task_info_t) &info, &size);
    double unit = 1024 * 1024;
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *pl = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([pl isEqualToString:@"iPhone6,1"] ||
        [pl isEqualToString:@"iPhone6,2"] ||
        [pl isEqualToString:@"iPad4,1"]   ||
        [pl isEqualToString:@"iPad4,2"]   ||
        [pl isEqualToString:@"iPad4,4"]   ||
        [pl isEqualToString:@"iPad4,5"]   ||
        [pl isEqualToString:@"iPhone7,1"] ||
        [pl isEqualToString:@"iPhone7,2"])
    {
        freeMemory = vmstat.free_count * pagesize / unit / 4;
    }
    freeMemory = vmstat.free_count * pagesize / unit;
    
}

//获得IP(局域网)
%new
-(void)updateLocalIP
{
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
}
*/

//时间格式修改
-(void) _resetTimeItemFormatter {
    %orig;
    NSDateFormatter *timeFormatter = MSHookIvar<NSDateFormatter*>(self,"_timeItemDateFormatter");
    if (!timeFormatter)
        return;
    else if (MixRAM && enabled)
    {
        timeFormat = [timeFormat reRAM];
    }
    else if (MixIP && enabled)
    {
        [NSTimer scheduledTimerWithTimeInterval:60*10 target:self selector:@selector(updateLocalIP) userInfo:nil repeats:YES];
        [timeFormat stringByAppendingString:[NSString stringWithFormat:@"-%@",address]];
    }
    [timeFormatter setDateFormat:timeFormat];
    [timeFormat release];
    // NSString *data = [NSString stringWithFormat:@"空闲内存:%lf",freeMemory];
    // NSString *path = @"/var/mobile/data.txt";
    // NSError *error = nil;
    // [data writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
}

//状态栏元素隐藏
- (BOOL)_setItem:(int)item
         enabled:(BOOL)arg2 {
 	if (item == 0  && MixHideTime && enabled)       return %orig(item, NO);
    if (item == 1  && MixHideNotDisturb && enabled) return %orig(item, NO);
    if (item == 2  && MixHideAirplane && enabled)   return %orig(item, NO);
    if (item == 3  && MixHideSignal && enabled)     return %orig(item, NO);
    if (item == 4  && MixHideCarrier && enabled)    return %orig(item, NO);
    if (item == 5  && MixHideData && enabled)       return %orig(item, NO);
    if (item == 7  && MixHideBattery && enabled)    return %orig(item, NO);
    if (item == 8  && MixShowBP && enabled)         return %orig(item, YES);
    if (item == 13 && MixHideAlarm && enabled)      return %orig(item, NO);
    if (item == 16 && MixHideGeoItem && enabled)    return %orig(item, NO);
    if (item == 17 && MixHideRotation && enabled)   return %orig(item, NO);
    if (item == 23 && MixHideDataSpinner && enabled)return %orig(item, NO);
    return %orig;
}
%end

%hook SBMediaController
-(id) init {
    id result = %orig;
    if (result) {
        bool ringerSwitchState = MSHookIvar<bool>(self, "_ringerMuted");
        mute.visible = (!ringerSwitchState && MixMinVol && enabled);
    }
    return result;
}

-(void) _systemMuteChanged:(id)arg1 {
    if (arg1 && MixMinVol && enabled) {
        mute.visible = YES;
    }
}
%end

%hook SBCCSettingsSectionController
-(void) _setMuted:(_Bool)arg1 {
    %orig;
    mute.visible = arg1 && MixMinVol && enabled;
}
%end

%hook SpringBoard

-(void)_updateRingerState:(int)state
              withVisuals:(BOOL)visuals
 updatePreferenceRegister:(BOOL)aRegister
{
    %orig;
    if (MixMinVol && enabled)
    {
        mute.visible = !state;
    }
}
%end

%hook SBTelephonyManager //运营商自定义

- (void)_reallySetOperatorName:(id)userName {
    if ([customSignal isEqualToString:@""] || customSignal == nil || !enabled)
    {
        %orig(userName);
    }  else if (enabled && customSignal) {
        userName = customSignal;
        %orig(userName);
    }
}
%end

%end

%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
    mute = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"mixtoolbox.mute" alignment:StatusBarAlignmentRight];
    mute.imageName = @"mute";
    mute.visible = NO;
    %init(MixStatusBar);
}
