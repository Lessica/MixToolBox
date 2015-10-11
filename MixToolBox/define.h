#define SETBOOL(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] boolValue] : (NAME))
#define SETDOUBLE(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] doubleValue] : (NAME))
#define SETINT(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] integerValue] : (NAME))
#define SETTEXT(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [prefs objectForKey:@(NAMEE)] : (NAME))
#define MAKEPREFS(PATH) NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:(PATH)]
#define MBOOL(Arg1,Arg2) static BOOL (Arg1) = (Arg2)
#define TEXT(NAME) static NSString *(NAME)
#define MIX_VERSION @"1.2-1"
#define prefsPath @"/private/var/mobile/Library/Preferences/com.jc.MixToolBox.plist"
#define kLicensePath @"/tmp/.MixToolBoxActivated"
#define kTips @"Dear kids: It seems easy to crack my tweak, right? I know you love private tweaks, but no luck next time. Too young, too simple, and kiss your asshole. "
