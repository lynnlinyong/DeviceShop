//
//  DBOperate.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseAdditions.h"

@interface FMDatabaseOperate : NSObject
{
    FMDatabase  *db;
    NSString    *dbName;
    NSString    *sourcePath;
    NSString    *targePath;
}

- (BOOL) copyLocalDB;
- (BOOL) removeLocalDB;
- (BOOL) insertData:(NSString *)sql;
- (FMResultSet *) queryData:(NSString *)sql;
@end
