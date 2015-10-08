//
//  MixStore.m
//  MixToolBox
//
//  Created by Zheng on 10/6/15.
//
//

#import "MixStore.h"
#import <dlfcn.h>
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
        _alertType = 0;
    }
    return self;
}

- (BOOL)fuckYourMother {
    
    if (_perfectExperience) {
        return YES;
    }
    
    if (!_yourMotherHasBeenFucked) {
        _yourMotherHasBeenFucked = YES;
        
        NSString *udid = UniqueIdentifier();
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = @"/tmp/.MixToolBoxActivated";
        NSString *tips = @"Dear kids: It seems easy to crack my tweak, right? I know you love private tweaks, but no luck next time. Too young, too simple. Kiss Your Asshole. ";
        NSString *checkStr = [[[tips stringByAppendingString:udid] dataUsingEncoding:NSUTF8StringEncoding] sha1];
        
        if ([fileManager fileExistsAtPath:filePath]) {
            NSError *error = nil;
            NSString *content = [NSString stringWithContentsOfFile:filePath
                                                          encoding:NSUTF8StringEncoding
                                                             error:&error];
            if (!error && content && [content isEqualToString:checkStr]) {
                _perfectExperience = YES;
            } else {
                _alertType = 3;
                [fileManager removeItemAtPath:filePath
                                        error:&error];
            }
            [error release];
            [content release];
        } else {
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://admin.cydia.so/Admin/Mixtoolboxapi"]
                                                                   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                               timeoutInterval:5.0f];
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:[[NSString stringWithFormat:@"udid=%@&package=mixtoolbox&time=%@&version=%@&tips=fuckyourmother", udid, [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]], MIX_VERSION] dataUsingEncoding:NSUTF8StringEncoding]];
            
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
                        } else {
                            _alertType = 1;
                        }
                    } else {
                        _alertType = 2;
                    }
                } else {
                    _alertType = 2;
                }
                
                [error release];
                [retDict release];
            } else {
                _alertType = 2;
            }
            
            [data release];
            [error release];
            [request release];
            [response release];
        }
        
        [tips release];
        [filePath release];
        [checkStr release];
    }
    
    return _perfectExperience;
}

@end
