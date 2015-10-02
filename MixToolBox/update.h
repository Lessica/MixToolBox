#import <UIKit/UIKit.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import <mach/host_info.h>
#import <mach/mach_host.h>
#import <mach/task_info.h>
#import <mach/task.h>

@interface UILabel (update)
-(void) updateTimeLabel;
-(void) timeLabelSet;
//-(void) secondsLabelSet;
//-(void) updateSecondsLabel;
-(void) dateLabelSet;
-(void) updateDateLabel;
//-(void) APMLabelSet;
//-(void) updateAPMLabel;
//-(void) RAMProgressSet;
//-(void) updateProgressLabel;
//-(void) valueLabelSet;
//-(void) updateValueLabel;
@end