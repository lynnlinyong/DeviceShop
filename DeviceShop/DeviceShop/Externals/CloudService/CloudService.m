//
//  CloudService.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "CloudService.h"

static CloudService *shareCloudService = nil;
@implementation CloudService
@synthesize delegate;

//获得网络服务框架单例
+ (CloudService *)sharedInstance
{
    @synchronized(self)
    {
        if(shareCloudService == nil)
        {
            shareCloudService = [[self alloc] init];
        }
    }
    return shareCloudService;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (shareCloudService == nil)
        {
            shareCloudService = [super allocWithZone:zone];
            return shareCloudService;
        }
    }
    
    return nil;
}

//网络请求函数
- (BOOL) sendRequest:(NSString *)jsonParameters
{
    NSString *resJson = nil;
    if (delegate)
    {
        if (![delegate respondsToSelector:@selector(responseFormNetwork:)])
        {
            return NO;
        }
        
        NSDictionary *dict = [jsonParameters JSONValue];
        if (!dict)
        {
            return NO;
        }
        NSString *fid = [dict objectForKey:@"fid"];
        CLog(@"fid:%@", fid);
        switch (fid.integerValue)
        {
            case kRegistUser:               //注册
            {
                resJson = REGIST_RESULT;
                break;
            }
            case kLoginSystem:              //登录
            {
                resJson = LOGIN_RESULT;
                break;
            }
            case kRequestPassword:          //忘记密码
            {
                resJson = FORGET_PWD_RESULT;
                break;
            }
            case kRequestDevList:           //获得设备列表
            {
                break;
            }
            case kRequestDevListByLookUpId: //分页查询设备列表
            {
                break;
            }
            case kDeviceDriverDownload:     //设备驱动下载
            {
                break;
            }
            case kGetHelpInfo:              //获得帮助信息
            {
                break;
            }
            case kBackToCloud:              //备份系统
            {
                break;
            }
            case kGetCloudBackupFileList:   //获取备份列表
            {
                break;
            }
            case kDownloadCloudBackupFile:  //恢复系统
            {
                break;
            }
            case kGetInstallingList:        //获得预安装列表
            {
                break;
            }
            case kAddShareUser:             //将备份系统分享给其他人
            {
                break;
            }
            case kDeleteShareUser:          //删除共享系统
            {
                break;
            }
            case kGetShareUserList:         //获得共享用户列表
            {
                break;
            }
            case kCheckControlPwd:          //是否验证网络控制密码
            {
                break;
            }
            default:
            {
                return NO;
                break;
            }
        }
        
        if (![delegate responseFormNetwork:resJson])
        {
            return NO;
        }
    }

    return YES;
}


@end
