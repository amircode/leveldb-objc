//
//  LVDatabase.h
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LVTransaction;
@class LVSnapshot;

@interface LVDatabase : NSObject

- (id)initWithPath:(NSString*)path;
- (BOOL)putValue:(NSString*)value forKey:(NSString*)key;
- (NSString*)valueForKey:(NSString*)key;
- (BOOL)deleteValueForKey:(NSString*)key;
- (LVTransaction*)transaction;
- (LVSnapshot*)snapshot;
- (void*)underlyingDatabase;
- (BOOL)enumerateKeyValuePairsWithCallback:(void(^)(NSString*,NSString*))callback;
- (BOOL)enumerateKeyValuePairsFromKey:(NSString*)start toKey:(NSString*)limit callback:(void(^)(NSString*,NSString*))callback;

@end
