//
//  MixStore.m
//  MixToolBox
//
//  Created by Zheng on 10/6/15.
//
//

#import "MixStore.h"
#import <dlfcn.h>
#import <spawn.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSData (encrypto)
- (NSString *) md5;
- (NSString *) sha1;
- (NSString *) base64_encode;
@end
@implementation NSData (encrypto)
- (NSString*) sha1
{
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

-(NSString *) md5
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

- (NSString *) base64_encode
{
    return [self base64EncodedStringWithOptions:0];
}
@end

@interface NSString (encrypto)
- (NSData *) base64_decode;
@end
@implementation NSString (encrypto)
- (NSData *) base64_decode
{
    return [[NSData alloc] initWithBase64EncodedString:self
                                               options:0];
}
@end

static MixStore *easyToCrack = nil;

static CFStringRef (*$MGCopyAnswer)(CFStringRef);

static NSString *UniqueIdentifier(UIDevice *device = nil) {
    if (kCFCoreFoundationVersionNumber < 800) // iOS 7.x
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"
        return [device ? : [UIDevice currentDevice] uniqueIdentifier];
#pragma clang diagnostic pop
    else
        return [(id)$MGCopyAnswer(CFSTR("UniqueDeviceID")) autorelease];
}

@implementation MixStore

+ (MixStore *)sharedInstance {
    @synchronized(self) {
        if (!easyToCrack) {
            easyToCrack = [[MixStore alloc] init];
        }
    }
    return easyToCrack;
}

- (id)init {
    if (self = [super init])
    {
        void *gestalt(dlopen("/usr/lib/libMobileGestalt.dylib", RTLD_GLOBAL | RTLD_LAZY));
        $MGCopyAnswer = reinterpret_cast<CFStringRef (*)(CFStringRef)>(dlsym(gestalt, "MGCopyAnswer"));
        _yourMotherHasBeenFucked = NO;
        _perfectExperience = NO;
        _alertType = -1;
    }
    return self;
}

- (void)showAlert {
    @autoreleasepool {
        NSString *currentLanguage = [NSLocale preferredLanguages][0];
        NSDictionary *alert_title_langs =
        @{
          @"en": @"Activation Failed",
          @"zh-Hans": @"激活失败",
          @"zh-Hant": @"激活失敗",
          };
        NSDictionary *alert_success_title_langs =
        @{
          @"en": @"Activation Succeed",
          @"zh-Hans": @"激活成功",
          @"zh-Hant": @"激活成功",
          };
        NSDictionary *alert_btn_langs =
        @{
          @"en": @"Ok",
          @"zh-Hans": @"好",
          @"zh-Hant": @"好",
          };
        NSDictionary *alert_cancel_btn_langs =
        @{
          @"en": @"Cancel",
          @"zh-Hans": @"取消",
          @"zh-Hant": @"取消",
          };
        NSDictionary *alert_message_0_langs =
        @{
          @"en": @"Thanks for your purchase! \nClick \"Ok\" to respring your device and finish this process. ",
          @"zh-Hans": @"感谢您的购买! \n轻按 \"好\" 注销设备以完成激活. ",
          @"zh-Hant": @"感謝您的購買! \n輕按 \"好\" 註銷設備以完成激活. ",
          };
        NSDictionary *alert_message_1_langs =
        @{
          @"en": @"Failed to fetch the purchase record of this device. \n Please purchase MixToolBox in Cydia and respring to retry the activation. ",
          @"zh-Hans": @"未能获取到该设备的购买记录. \n请在 Cydia 中完成 MixToolBox 的购买, 然后注销设备以重试激活. ",
          @"zh-Hant": @"未能獲取到該設備的購買記錄. \n請在 Cydia 中完成 MixToolBox 的購買, 然後註銷設備以重試激活. ",
          };
        NSDictionary *alert_message_2_langs =
        @{
          @"en": @"Communication with the MixToolBox activation server failed. Please check the network connection.",
          @"zh-Hans": @"与 MixToolBox 激活服务器请求超时, 请检查网络连接. ",
          @"zh-Hant": @"與 MixToolBox 激活服務器請求超時, 請檢查網絡連接. ",
          };
        NSDictionary *alert_message_3_langs =
        @{
          @"en": @"I do not know why, but anyway, the authorization file cannot be verified. ",
          @"zh-Hans": @"我也不知道为什么, 反正这台设备上的 MixToolBox 授权文件验证失败了. ",
          @"zh-Hant": @"我也不知道為什麽, 反正此設備上的 MixToolBox 授權文件驗證失敗了. ",
          };
        NSString *message = nil;
        NSString *title = nil;
        NSString *btn = nil;
        NSString *cancelBtn = nil;
        switch (_alertType) {
            case 1:
                if ([alert_message_1_langs.allKeys containsObject:(NSString *)currentLanguage])
                    message = alert_message_1_langs[(NSString *)currentLanguage];
                else
                    message = alert_message_1_langs[@"en"];
                break;
            case 2:
                if ([alert_message_2_langs.allKeys containsObject:(NSString *)currentLanguage])
                    message = alert_message_2_langs[(NSString *)currentLanguage];
                else
                    message = alert_message_2_langs[@"en"];
                break;
            case 3:
                if ([alert_message_3_langs.allKeys containsObject:(NSString *)currentLanguage])
                    message = alert_message_3_langs[(NSString *)currentLanguage];
                else
                    message = alert_message_3_langs[@"en"];
                break;
            case 0:
                if ([alert_message_0_langs.allKeys containsObject:(NSString *)currentLanguage])
                    message = alert_message_0_langs[(NSString *)currentLanguage];
                else
                    message = alert_message_0_langs[@"en"];
                break;
            default:
                break;
        }
        switch (_alertType) {
            case 1: case 2: case 3:
                if ([alert_title_langs.allKeys containsObject:(NSString *)currentLanguage])
                    title = alert_title_langs[(NSString *)currentLanguage];
                else
                    title = alert_title_langs[@"en"];
                if ([alert_btn_langs.allKeys containsObject:(NSString *)currentLanguage])
                    cancelBtn = alert_btn_langs[(NSString *)currentLanguage];
                else
                    cancelBtn = alert_btn_langs[@"en"];
                break;
            case 0:
                if ([alert_success_title_langs.allKeys containsObject:(NSString *)currentLanguage])
                    title = alert_success_title_langs[(NSString *)currentLanguage];
                else
                    title = alert_success_title_langs[@"en"];
                if ([alert_btn_langs.allKeys containsObject:(NSString *)currentLanguage])
                    btn = alert_btn_langs[(NSString *)currentLanguage];
                else
                    btn = alert_btn_langs[@"en"];
                if ([alert_cancel_btn_langs.allKeys containsObject:(NSString *)currentLanguage])
                    cancelBtn = alert_cancel_btn_langs[(NSString *)currentLanguage];
                else
                    cancelBtn = alert_cancel_btn_langs[@"en"];
                break;
            default:
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelBtn
                                              otherButtonTitles:btn, nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-9", "SpringBoard", "backboardd", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
    }
}

- (BOOL)fuckYourMother {
    @autoreleasepool {
        if (_perfectExperience) {
            return YES;
        }
        
        if (!_yourMotherHasBeenFucked) {
            _yourMotherHasBeenFucked = YES;
            
            NSString *udid = UniqueIdentifier();
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *filePath = kLicensePath;
            NSString *tips = kTips;
            NSString *checkStr = [[[tips stringByAppendingString:udid] dataUsingEncoding:NSUTF8StringEncoding] sha1];
            
            if ([fileManager fileExistsAtPath:filePath]) {
                NSError *error = nil;
                NSString *content = [NSString stringWithContentsOfFile:filePath
                                                              encoding:NSUTF8StringEncoding
                                                                 error:&error];
                if (!error && content && [content isEqualToString:checkStr]) {
                    _perfectExperience = YES;
                } else {
                    [fileManager removeItemAtPath:filePath
                                            error:&error];
                }
            }
        }
        
        return _perfectExperience;
    }
}

- (void)kissYourAsshole {
    @autoreleasepool {
        NSString *udid = UniqueIdentifier();
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = kLicensePath;
        NSString *tips = kTips;
        NSString *checkStr = [[[tips stringByAppendingString:udid] dataUsingEncoding:NSUTF8StringEncoding] sha1];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://admin.cydia.so/Admin/Mixtoolboxapi"]
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                           timeoutInterval:10.0f];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[[NSString stringWithFormat:@"udid=%@&package=org.thebigboss.MixToolBox&time=%@&version=%@&tips=fuckyourmother", udid, [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]], MIX_VERSION] dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSHTTPURLResponse *response = nil;
        NSError	*error = nil;
        NSData *data	 = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&response
                                                          error:&error];
        
        if ( !error && data )
        {
            NSError	*error = nil;
            NSDictionary *retDict = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&error];
            if ( !error && retDict )
            {
                id errorCode = [retDict objectForKey:@"error"];
                if (errorCode) {
                    if ([errorCode intValue] == 200) {
                        [fileManager createFileAtPath:filePath contents:[checkStr dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
                        _perfectExperience = YES;
                        _alertType = 0;
                    } else {
                        _alertType = 1;
                    }
                } else {
                    _alertType = 2;
                }
            } else {
                _alertType = 2;
            }
        } else {
            _alertType = 2;
        }
    }
}

@end
