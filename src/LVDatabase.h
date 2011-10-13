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
- (BOOL)putString:(NSString*)value forKey:(NSString*)key;
- (BOOL)putObject:(NSObject<NSCoding>*)value forKey:(NSString*)key;
- (NSString*)stringForKey:(NSString*)key;
- (NSObject<NSCoding>*)objectForKey:(NSString*)key;
- (BOOL)removeKey:(NSString*)key;
- (LVTransaction*)transaction;
- (LVSnapshot*)snapshot;
- (void*)underlyingDatabase;
- (BOOL)enumerateKeyValuePairsWithCallback:(void(^)(NSString*,NSString*,BOOL*))callback;
- (BOOL)enumerateKeyValuePairsFromKey:(NSString*)start toKey:(NSString*)limit callback:(void(^)(NSString*,NSString*,BOOL*))callback;

@end
