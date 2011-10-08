//
//  LVDatabase.h
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LVTransaction;

@interface LVDatabase : NSObject

- (id)initWithPath:(NSString*)path;
- (BOOL)putValue:(NSString*)value forKey:(NSString*)key;
- (NSString*)valueForKey:(NSString*)key;
- (BOOL)deleteValueForKey:(NSString*)key;
- (LVTransaction*)transaction;
- (void*)underlyingDatabase;

@end
