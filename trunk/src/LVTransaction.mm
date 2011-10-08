//
//  LVTransaction.m
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LVTransaction.h"
#import "LVDatabase.h"
#include "leveldb/db.h"
#include "leveldb/write_batch.h"

@implementation LVTransaction {
    leveldb::WriteBatch batch;
    leveldb::DB* db;
}

- (id)initWithDatabase:(LVDatabase*)database {
    if ((self = [super init])) {
        db = (leveldb::DB*) [database underlyingDatabase];
        /*leveldb::WriteBatch batch;
        batch.Delete(key1);
        batch.Put(key2, value);
        s = db->Write(leveldb::WriteOptions(), &batch);*/
    }
    return self;
}

- (BOOL)commit {
    leveldb::Status s = db->Write(leveldb::WriteOptions(), &batch);
    return s.ok();
}

- (void)putValue:(NSString*)value forKey:(NSString*)key {
    batch.Put([key UTF8String], [value UTF8String]);
}

- (void)deleteValueForKey:(NSString*)key {
    batch.Delete([key UTF8String]);
}

@end
