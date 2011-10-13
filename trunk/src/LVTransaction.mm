//
//  LVTransaction.m
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LVTransaction.h"
#import "LVDatabase.h"
#import "EXNSAdditions.h"
#include "leveldb/db.h"
#include "leveldb/write_batch.h"

@implementation LVTransaction {
    leveldb::WriteBatch batch;
    leveldb::DB* db;
}

- (id)initWithDatabase:(LVDatabase*)database {
    if ((self = [super init])) {
        db = (leveldb::DB*) [database underlyingDatabase];
    }
    return self;
}

- (BOOL)commit {
    leveldb::Status s = db->Write(leveldb::WriteOptions(), &batch);
    return s.ok();
}

- (void)putString:(NSString*)value forKey:(NSString*)key {
    batch.Put([key UTF8String], [value UTF8String]);
}

- (void)putObject:(NSObject<NSCoding>*)value forKey:(NSString*)key {
    NSMutableData* data = [[NSMutableData alloc] init];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData: data];
    [archiver encodeObject: value forKey: @"object"];
    [archiver finishEncoding];
    [self putString: [data base64String] forKey: key];
    [archiver release];
    [data release];
}

- (void)removeKey:(NSString*)key {
    batch.Delete([key UTF8String]);
}

@end
