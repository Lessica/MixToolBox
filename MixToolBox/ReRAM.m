#import "ReRAM.h"

@implementation NSString (ReRAM)


double freeMemory;
-(NSString *) reRAM {

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
    } else {
   freeMemory = vmstat.free_count * pagesize / unit; }

   self = [self stringByAppendingString:[NSString stringWithFormat:@" - %.1lf MiB",freeMemory]];
   return self;
   }
   
   -(void) reRAMUpdate {
   	 NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(reRAM) userInfo:nil repeats:YES];
   	if (!timer)
   	{
   	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(reRAM) userInfo:nil repeats:YES];
   	}

   }
   @end