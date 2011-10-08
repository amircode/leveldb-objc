//
//  LVTransaction.h
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LVDatabase;

@interface LVTransaction : NSObject

- (id)initWithDatabase:(LVDatabase*)database;
- (BOOL)commit;
- (void)putValue:(NSString*)value forKey:(NSString*)key;
- (void)deleteValueForKey:(NSString*)key;

@end
