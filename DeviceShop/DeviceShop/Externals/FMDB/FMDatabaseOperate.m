//
//  DBOperate.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "FMDatabaseOperate.h"

@implementation FMDatabaseOperate

- (id) init
{
    self = [super init];
    if (self)
    {
        //数据库名字
        dbName = [NSString stringWithFormat:@"%@.db", DB_NAME];
        
        //这个是资源文件目录
        sourcePath = [NSString stringWithFormat:@"%@/%@",
                      [[NSBundle mainBundle] resourcePath], dbName];
        
        //document目录用户才有写权限
        targePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                          NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:dbName];
        
        if ([self initDB])
        {
            CLog(@"Func:%s,init db success!", __func__);
        }
        else
        {
            CLog(@"Func:%s,init db failed!", __func__);
            return nil;
        }
    }
    
    return self;
}

- (BOOL) initDB
{
    if( [[NSFileManager defaultManager] fileExistsAtPath:targePath] )
    {
        db = [FMDatabase databaseWithPath:targePath];
        if( ![db open] )
        {
            return NO;
        }
        
        [db setShouldCacheStatements:YES];
        return YES;
    }

    NSError *err = [[[NSError alloc] init]autorelease];
    BOOL isSuc   = [[NSFileManager defaultManager] copyItemAtPath:sourcePath
                                                           toPath:targePath
                                                            error:&err];
    if (!isSuc)
    {
        return NO;
    }
    
    //重新打开
    db = [FMDatabase databaseWithPath:targePath];
    if( ![db open] )
    {
        return NO;
    }
    
    [db setShouldCacheStatements:YES];
    return YES;
}

-(BOOL)removeLocalDB
{
    NSError *err = [[[NSError alloc] init]autorelease];
    BOOL isSuc   = [[NSFileManager defaultManager] removeItemAtPath:targePath
                                                              error:&err];
    if (!isSuc)
    {
        return NO;
    }
    
    return YES;
}

-(BOOL)copyLocalDB
{
    NSError *err = [[[NSError alloc] init]autorelease];
    BOOL isSuc   = [[NSFileManager defaultManager] copyItemAtPath:sourcePath
                                                           toPath:targePath
                                                            error:&err];
    if (isSuc)
    {
        return YES;
    }
    
    return NO;
}

- (void) dealloc
{
    [db         close];
    [super dealloc];
}

- (BOOL) insertData:(NSString *)sql
{
    [db beginTransaction];
    BOOL isSuc = [db executeUpdate:sql];
    if (!isSuc)
    {
        return NO;
    }
    [db commit];
    return YES;
}

- (FMResultSet *) queryData:(NSString *)sql
{
    FMResultSet *rs = [db executeQuery:sql];
    if (!rs)
    {
        return nil;
    }
    
    return rs;
}
@end
