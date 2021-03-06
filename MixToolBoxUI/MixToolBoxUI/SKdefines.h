#define PSGroupCellWithOutLabel @{ @"cell": @"PSGroupCell" }
#define PSGroupCell(LABEL) @{ @"cell" : @"PSGroupCell" , @"label":(LABEL),}
#define PSGroupCellLAF(LABEL,FOOTER) @{ @"cell" : @"PSGroupCell" , @"label":(LABEL), @"footerText" : (FOOTER),}
#define PSSwitchCell(LABEL,KEY) @{@"cell":@"PSSwitchCell", @"label":(LABEL),@"default":@NO, @"defaults":@"com.jc.MixToolBox",  @"key":(KEY), @"PostNotification": @"com.jc.MixToolBox/changed",}
#define PSLinkCell(LABEL,CONTROLLER) @{@"cell":@"PSLinkCell", @"label":(LABEL), @"isController":@YES, @"detail":(CONTROLLER),}
#define PSEditTextCell(LABEL,KEY) @{@"cell":@"PSEditTextCell", @"label":(LABEL), @"defaults":@"com.jc.MixToolBox", @"key":(KEY), @"PostNotification":@"com.jc.MixToolBox/changed",}
#define PSButtonCell(LABEL,ACTION) @{@"cell":@"PSButtonCell", @"label":(LABEL), @"action":(ACTION), @"alignment":@2,}
#define PSGroupCenterCell(LABEL) @{ @"cell" : @"PSGroupCell" , @"label":(LABEL), @"alignment":@1}
#define PSCopyrightFooter @"MixToolBox © 2015 By J.C.T."
#define MIX_VERSION @"1.2"
#define MIXLocalizedString(key) [[self bundle] localizedStringForKey:key value:@"" table:nil]
