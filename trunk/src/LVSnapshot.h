//
//  LVSnapshot.h
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LVDatabase;

@interface LVSnapshot : NSObject

- (id)initWithDatabase:(LVDatabase*)database;
- (BOOL)enumerateKeyValuePairsWithCallback:(void(^)(NSString*,NSString*,BOOL*))callback;
- (BOOL)enumerateKeyValuePairsFromKey:(NSString*)start toKey:(NSString*)limit callback:(void(^)(NSString*,NSString*,BOOL*))callback;

@end
