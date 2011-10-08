//
//  LVDatabase.m
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LVDatabase.h"
#import "LVTransaction.h"
#include <iostream>
#include "leveldb/db.h"

@implementation LVDatabase {
    leveldb::DB* db;
}

- (void*)underlyingDatabase {
    return db;
}

- (LVTransaction*)transaction {
    return [[[LVTransaction alloc] initWithDatabase: self] autorelease];
}

- (BOOL)putValue:(NSString*)value forKey:(NSString*)key {
    leveldb::Status s = db->Put(leveldb::WriteOptions(), [key UTF8String], [value UTF8String]);
    return s.ok();
}

- (NSString*)valueForKey:(NSString*)key {
    std::string value;
    leveldb::Status s = db->Get(leveldb::ReadOptions(), [key UTF8String], &value);
    return s.ok() ? [NSString stringWithUTF8String: value.c_str()] : nil;
}

- (BOOL)deleteValueForKey:(NSString*)key {
    leveldb::Status s = db->Delete(leveldb::WriteOptions(), [key UTF8String]);
    return s.ok();
}

- (id)initWithPath:(NSString*)path {
    if ((self = [super init])) {
        leveldb::Options options;
        options.create_if_missing = true;
        leveldb::Status status = leveldb::DB::Open(options, [path UTF8String], &db);
        if (!status.ok()) {
            std::cerr << status.ToString() << std::endl;
            [self autorelease];
            return nil;
        }
    }
    return self;
}

- (void)dealloc {
    if (db != NULL) delete db;
    [super dealloc];
}

@end
