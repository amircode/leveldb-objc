//
//  LevelDBWrapper.h
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LVDatabase;

@interface LevelDBWrapper : NSObject

+ (LVDatabase*)databaseWithName:(NSString*)name;

@end
