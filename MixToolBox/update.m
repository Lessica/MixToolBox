#import "update.h"

@implementation UILabel (update)

/*
double freeMemory;
double total;
double rate;

static void getMemory() {
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
    total = (vmstat.wire_count + vmstat.active_count + vmstat.inactive_count + vmstat.free_count) * pagesize / unit / 4;
    //double wired = vmstat.wire_count * pagesize / unit;
    //double active = vmstat.active_count * pagesize / unit;
    //double inactive = vmstat.inactive_count * pagesize / unit;
    freeMemory = vmstat.free_count * pagesize / unit / 4;
    //double resident = info.resident_size / unit;
    NSError *error1 = nil;
    NSString *path = @"/var/mobile/MixToolBoxLog.txt";
    NSString *logWt = [NSString stringWithFormat:@"FM:%.2lfMB,total:%.2lfMB",freeMemory,total];
    [logWt writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error1];
}
*/

-(void) timeLabelSet {
      NSDateFormatter *dt = [[NSDateFormatter alloc] init];
      [dt setDateFormat:@"HH:mm"];
      self.text = [dt stringFromDate:[NSDate date]];
      [dt release];
}

-(void) updateTimeLabel {
     NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(timeLabelSet) userInfo:nil repeats:YES];
     if (!timer)
     {
     	timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(timeLabelSet) userInfo:nil repeats:YES];
     }
}
/*
-(void) secondsLabelSet {
      NSDateFormatter *dt = [[NSDateFormatter alloc] init];
      [dt setDateFormat:@"ss"];
      self.text = [dt stringFromDate:[NSDate date]];
      [dt release];
}

-(void) updateSecondsLabel {
     NSTimer *timer1 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(secondsLabelSet) userInfo:nil repeats:YES];
     if (!timer1)
     {
     	timer1 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(secondsLabelSet) userInfo:nil repeats:YES];
     }
}
*/
-(void) dateLabelSet {
      NSDateFormatter *dt = [[NSDateFormatter alloc] init];
//      dt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
      [dt setDateFormat:@"EEEE\nM月d日"];
      self.text = [dt stringFromDate:[NSDate date]];
      [dt release];
}

-(void) updateDateLabel {
     NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(dateLabelSet) userInfo:nil repeats:YES];
     if (!timer2)
     {

     }
}

/*
-(void) APMLabelSet {
      NSDateFormatter *dt = [[NSDateFormatter alloc] init];
      dt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
      [dt setDateFormat:@"a"];
      self.text = [dt stringFromDate:[NSDate date]];
      [dt release];
}

-(void) updateAPMLabel {
     NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(APMLabelSet) userInfo:nil repeats:YES];
     if (!timer3)
     {
     	timer3 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(APMLabelSet) userInfo:nil repeats:YES];
     }
}

-(void) RAMProgressSet {
  getMemory();
  rate = freeMemory/total;
  CGFloat origwidth = 75.0f;
  CGFloat width = origwidth * rate;
  NSError *error1 = nil;
    NSString *path = @"/var/mobile/MixToolBoxLog.txt";
    NSString *logWt = [NSString stringWithFormat:@"rate:%.2lf,width:%.2lf",rate,width];
    [logWt writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error1]; 
    self.frame = CGRectMake(0,0,width,1);
    //self.backgroundColor = [UIColor whiteColor];
  }

-(void) updateProgressLabel {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(RAMProgressSet) userInfo:nil repeats:YES];
    if (!timer)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(RAMProgressSet) userInfo:nil repeats:YES];
    }
}

-(void) valueLabelSet {
    self.text = [NSString stringWithFormat:@"%.2lf%%",rate*100];
    NSError *error1 = nil;
    NSString *path = @"/var/mobile/MixToolBoxLog.txt";
    NSString *logWt = [NSString stringWithFormat:@"rate:%.2lf",rate];
    [logWt writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error1];
}

-(void) updateValueLabel {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(valueLabelSet) userInfo:nil repeats : YES];
    if (!timer)
    {
     	timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(valueLabelSet) userInfo:nil repeats:YES];
    }
}
*/  

@end
