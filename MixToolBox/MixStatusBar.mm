#line 1 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixStatusBar.xm"
#import <substrate.h>
#import "define.h"
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
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
#import "MixStore.h"

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


MBOOL(MixShowBP, NO);
MBOOL(MixMinVol, NO);
MBOOL(MixHideAlarm, NO);
MBOOL(MixHideGeoItem, NO);
MBOOL(MixHideRotation, NO);
MBOOL(MixHideDataSpinner, NO);
TEXT(timeFormat);
TEXT(customSignal);

static NSString *address;
static LSStatusBarItem *mute;

static void loadPrefs() {
    MAKEPREFS(prefsPath);
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
        
        
        SETTEXT(timeFormat, "timeFormat");
        SETTEXT(customSignal, "customSignal");
    }
    [timeFormat retain];
    [customSignal retain];
    [prefs release];
}

#include <logos/logos.h>
#include <substrate.h>
@class SpringBoard; @class SBStatusBarStateAggregator; @class SBMediaController; @class SBTelephonyManager; @class SBCCSettingsSectionController; 


#line 74 "/Users/Zheng/Projects/MixToolBox/MixToolBox/MixStatusBar.xm"
static void (*_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter)(SBStatusBarStateAggregator*, SEL); static void _logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(SBStatusBarStateAggregator*, SEL); static BOOL (*_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$)(SBStatusBarStateAggregator*, SEL, int, BOOL); static BOOL _logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(SBStatusBarStateAggregator*, SEL, int, BOOL); static id (*_logos_orig$MixStatusBar$SBMediaController$init)(SBMediaController*, SEL); static id _logos_method$MixStatusBar$SBMediaController$init(SBMediaController*, SEL); static void (*_logos_orig$MixStatusBar$SBMediaController$_systemMuteChanged$)(SBMediaController*, SEL, id); static void _logos_method$MixStatusBar$SBMediaController$_systemMuteChanged$(SBMediaController*, SEL, id); static void (*_logos_orig$MixStatusBar$SBCCSettingsSectionController$_setMuted$)(SBCCSettingsSectionController*, SEL, _Bool); static void _logos_method$MixStatusBar$SBCCSettingsSectionController$_setMuted$(SBCCSettingsSectionController*, SEL, _Bool); static void (*_logos_orig$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$)(SpringBoard*, SEL, int, BOOL, BOOL); static void _logos_method$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$(SpringBoard*, SEL, int, BOOL, BOOL); static void (*_logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$)(SBTelephonyManager*, SEL, id); static void _logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(SBTelephonyManager*, SEL, id); 

 










































































static void _logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(SBStatusBarStateAggregator* self, SEL _cmd) {
    _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter(self, _cmd);
    NSDateFormatter *timeFormatter = MSHookIvar<NSDateFormatter *>(self, "_timeItemDateFormatter");
    if (!timeFormatter)
        return;
    else if (MixRAM && enabled)
    {
        timeFormat = [timeFormat reRAM];
    }
    else if (MixIP && enabled)
    {
        [NSTimer scheduledTimerWithTimeInterval:600.0f target:self selector:@selector(updateLocalIP) userInfo:nil repeats:YES];
        [timeFormat stringByAppendingString:[NSString stringWithFormat:@"-%@", address]];
    }
    [timeFormatter setDateFormat:timeFormat];
    [timeFormat release];
    
    
    
    
}



static BOOL _logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(SBStatusBarStateAggregator* self, SEL _cmd, int item, BOOL arg2) {
    if (item == 0  && MixHideTime && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 1  && MixHideNotDisturb && enabled) return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 2  && MixHideAirplane && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 3  && MixHideSignal && enabled)    return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 4  && MixHideCarrier && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 5  && MixHideData && enabled)         return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 7  && MixHideBattery && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 8  && MixShowBP && enabled)        return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, YES);
    if (item == 13 && MixHideAlarm && enabled)        return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 16 && MixHideGeoItem && enabled)      return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 17 && MixHideRotation && enabled)     return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    if (item == 23 && MixHideDataSpinner && enabled)  return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
    return _logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, arg2);
}





static id _logos_method$MixStatusBar$SBMediaController$init(SBMediaController* self, SEL _cmd) {
    id result = _logos_orig$MixStatusBar$SBMediaController$init(self, _cmd);
    if (result) {
        bool ringerSwitchState = MSHookIvar<bool>(self,"_ringerMuted");
        mute.visible = (!ringerSwitchState && MixMinVol && enabled);
    }
    return result;
}

static void _logos_method$MixStatusBar$SBMediaController$_systemMuteChanged$(SBMediaController* self, SEL _cmd, id arg1) {
    if (arg1 && MixMinVol && enabled) {
        mute.visible = YES;
    }
}



static void _logos_method$MixStatusBar$SBCCSettingsSectionController$_setMuted$(SBCCSettingsSectionController* self, SEL _cmd, _Bool arg1) {
    _logos_orig$MixStatusBar$SBCCSettingsSectionController$_setMuted$(self, _cmd, arg1);
    mute.visible = arg1 && MixMinVol && enabled;
}






static void _logos_method$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$(SpringBoard* self, SEL _cmd, int state, BOOL visuals, BOOL aRegister) {
    _logos_orig$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$(self, _cmd, state, visuals, aRegister);
    if (MixMinVol && enabled) {
        mute.visible = !state;
    }
}


 
static void _logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(SBTelephonyManager* self, SEL _cmd, id userName) {
    if ([customSignal isEqualToString:@""] || customSignal == nil || !enabled)
    {
        _logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(self, _cmd, userName);
    }  else if (enabled && customSignal) {
        userName = customSignal;
        _logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$(self, _cmd, userName);
    }
}




static __attribute__((constructor)) void _logosLocalCtor_a63c6e76() {
    if ([[MixStore sharedInstance] fuckYourMother]) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.jc.MixToolBox/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        loadPrefs();
        mute = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"mixtoolbox.mute" alignment:StatusBarAlignmentRight];
        mute.imageName = @"cmemory";
        mute.visible = NO;
        {Class _logos_class$MixStatusBar$SBStatusBarStateAggregator = objc_getClass("SBStatusBarStateAggregator"); MSHookMessageEx(_logos_class$MixStatusBar$SBStatusBarStateAggregator, @selector(_resetTimeItemFormatter), (IMP)&_logos_method$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter, (IMP*)&_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_resetTimeItemFormatter);MSHookMessageEx(_logos_class$MixStatusBar$SBStatusBarStateAggregator, @selector(_setItem:enabled:), (IMP)&_logos_method$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$, (IMP*)&_logos_orig$MixStatusBar$SBStatusBarStateAggregator$_setItem$enabled$);Class _logos_class$MixStatusBar$SBMediaController = objc_getClass("SBMediaController"); MSHookMessageEx(_logos_class$MixStatusBar$SBMediaController, @selector(init), (IMP)&_logos_method$MixStatusBar$SBMediaController$init, (IMP*)&_logos_orig$MixStatusBar$SBMediaController$init);MSHookMessageEx(_logos_class$MixStatusBar$SBMediaController, @selector(_systemMuteChanged:), (IMP)&_logos_method$MixStatusBar$SBMediaController$_systemMuteChanged$, (IMP*)&_logos_orig$MixStatusBar$SBMediaController$_systemMuteChanged$);Class _logos_class$MixStatusBar$SBCCSettingsSectionController = objc_getClass("SBCCSettingsSectionController"); MSHookMessageEx(_logos_class$MixStatusBar$SBCCSettingsSectionController, @selector(_setMuted:), (IMP)&_logos_method$MixStatusBar$SBCCSettingsSectionController$_setMuted$, (IMP*)&_logos_orig$MixStatusBar$SBCCSettingsSectionController$_setMuted$);Class _logos_class$MixStatusBar$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$MixStatusBar$SpringBoard, @selector(_updateRingerState:withVisuals:updatePreferenceRegister:), (IMP)&_logos_method$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$, (IMP*)&_logos_orig$MixStatusBar$SpringBoard$_updateRingerState$withVisuals$updatePreferenceRegister$);Class _logos_class$MixStatusBar$SBTelephonyManager = objc_getClass("SBTelephonyManager"); MSHookMessageEx(_logos_class$MixStatusBar$SBTelephonyManager, @selector(_reallySetOperatorName:), (IMP)&_logos_method$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$, (IMP*)&_logos_orig$MixStatusBar$SBTelephonyManager$_reallySetOperatorName$);}
    }
}
