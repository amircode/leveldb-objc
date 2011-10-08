//
//  LVSnapshot.m
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LVSnapshot.h"
#import "LVDatabase.h"
#include "leveldb/db.h"

@implementation LVSnapshot {
    leveldb::DB* db;
    leveldb::ReadOptions options;
}

- (id)initWithDatabase:(LVDatabase*)database {
    if ((self = [super init])) {
        db = (leveldb::DB*) [database underlyingDatabase];
        options.snapshot = db->GetSnapshot();
    }
    return self;
}

- (BOOL)enumerateKeyValuePairsWithCallback:(void(^)(NSString*,NSString*))callback {
    leveldb::Iterator* it = db->NewIterator(options);
    for (it->SeekToFirst(); it->Valid(); it->Next()) {
        callback([NSString stringWithUTF8String: it->key().ToString().c_str()], [NSString stringWithUTF8String: it->value().ToString().c_str()]);
    }
    BOOL retVal = it->status().ok();
    delete it;    
    return retVal;
}

- (BOOL)enumerateKeyValuePairsFromKey:(NSString*)start toKey:(NSString*)limit callback:(void(^)(NSString*,NSString*))callback {
    leveldb::Iterator* it = db->NewIterator(options);
    for (it->Seek([start UTF8String]); it->Valid() && it->key().ToString() < [limit UTF8String]; it->Next()) {
        callback([NSString stringWithUTF8String: it->key().ToString().c_str()], [NSString stringWithUTF8String: it->value().ToString().c_str()]);
    }
    BOOL retVal = it->status().ok();
    delete it;    
    return retVal;
}

- (void)dealloc {
    db->ReleaseSnapshot(options.snapshot);
    [super dealloc];
}

@end
