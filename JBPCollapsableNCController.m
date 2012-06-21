//
//  JBPCollapsableNCController.m
//  ZZZZZZZ
//
//  Created by Jonathan Bailey on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JBPCollapsableNCController.h"

@implementation JBPCollapsableNCController
@synthesize collapsedSIDs;
static JBPCollapsableNCController *instance;
+(JBPCollapsableNCController *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JBPCollapsableNCController alloc] init];
    });
    return instance;
}
-(id)init {
    if (self = [super init]) {
        collapsedSIDs = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
