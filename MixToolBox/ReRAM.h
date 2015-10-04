#import <UIKit/UIKit.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import <mach/host_info.h>
#import <mach/mach_host.h>
#import <mach/task_info.h>
#import <mach/task.h>
#import <sys/utsname.h>

@interface NSString (ReRAM)
-(NSString *) reRAM;
-(void) reRAMUpdate;
@end
