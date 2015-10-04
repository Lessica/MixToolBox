#import "header/PSListController.h"
#import "header/PSSpecifier.h"
#import "header/PSViewController.h"
#import "header/PSTableCell.h"

@interface MixCCTitleCell : PSTableCell {
    UILabel *heading;
}
@end

@implementation MixCCTitleCell

- (void)layoutSubviews {
    [super layoutSubviews];
    heading.frame = CGRectMake(0, 15, self.frame.size.width, 50);
}

- (id)initWithSpecifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"headerCell"
                      specifier:specifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        int width = [[UIScreen mainScreen] bounds].size.width;
        CGRect frame = CGRectMake(0, 15, width, 50);
        heading = [[UILabel alloc] initWithFrame:frame];
        [heading setNumberOfLines:1];
        heading.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:35];
        [heading setText:@"Control Center"];
        [heading setBackgroundColor:[UIColor clearColor]];
        heading.textColor = [UIColor darkGrayColor];
        heading.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:heading];
    }
    return self;
}

- (CGFloat)preferredHeightForWidth:(double)arg1
                       inTableView:(id)arg2 {
    return 75.0;
}

@end