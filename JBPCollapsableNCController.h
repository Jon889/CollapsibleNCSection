//
//  JBPCollapsableNCController.h
//  ZZZZZZZ
//
//  Created by Jonathan Bailey on 21/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBPCollapsableNCController : NSObject
@property (nonatomic, retain) NSMutableArray *collapsedSIDs;
+(JBPCollapsableNCController *)sharedInstance;
@end
