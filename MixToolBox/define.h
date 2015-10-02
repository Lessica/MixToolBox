#define SETBOOL(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] boolValue] : (NAME))
#define SETDOUBLE(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] doubleValue] : (NAME))
#define SETINT(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [[prefs objectForKey:@(NAMEE)] integerValue] : (NAME))
#define SETTEXT(NAME,NAMEE) (NAME) = ([prefs objectForKey:@(NAMEE)] ? [prefs objectForKey:@(NAMEE)] : (NAME))
#define MAKEPREFS(PATH) NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:(PATH)]
#define MBOOL(Arg1,Arg2) static BOOL (Arg1) = (Arg2)
#define TEXT(NAME) static NSString *(NAME)