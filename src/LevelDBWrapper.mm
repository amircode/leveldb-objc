//
//  LevelDBWrapper.m
//  LevelDBWrapper
//
//  Created by Petr Homola on 10/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "LevelDBWrapper.h"
#import "LVDatabase.h"

@implementation LevelDBWrapper

+ (LVDatabase*)databaseWithName:(NSString*)name {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex: 0];
	NSString* path = [documentsDirectory stringByAppendingFormat: @"/%@", name];
    return [[[LVDatabase alloc] initWithPath: path] autorelease];
}

@end
