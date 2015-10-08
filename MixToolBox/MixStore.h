//
//  MixStore.h
//  MixToolBox
//
//  Created by Zheng on 10/6/15.
//
//

#import <Foundation/Foundation.h>

@interface MixStore : NSObject

@property (nonatomic, assign) BOOL yourMotherHasBeenFucked;
@property (nonatomic, assign) BOOL perfectExperience;
@property (nonatomic, assign) int alertType;

+ (MixStore *)sharedInstance;
- (BOOL)fuckYourMother;

@end
