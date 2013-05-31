//
//  CloudService.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

//测试注册接口Json反馈
#define  REGIST_RESULT  @"{\"Status\":\"1\",\"Result\":\"1\",\"FuncID\":\"0\"}"

#define  LOGIN_RESULT   @"{\"Status\":\"1\",\"Result\":\"1\",\"FuncID\":\"1\"}"

#define  FORGET_PWD_RESULT @"{\"Status\":\"1\",\"Result\":\"1\",\"FuncID\":\"2\"}"


//接口函数标识
typedef enum _tagFuncID{
    kRegistUser = 0,                //注册用户
    kLoginSystem,                   //登录系统
    kRequestPassword,               //忘记密码
    kRequestDevList,                //获得设备列表
    kRequestDevListByLookUpId,      //分页查询设备列表
    kDeviceDriverDownload,          //设备驱动下载
    kGetHelpInfo,                   //获得帮助信息
    kBackToCloud,                   //备份系统
    kGetCloudBackupFileList,        //获取备份列表
    kDownloadCloudBackupFile,       //恢复系统
    kGetInstallingList,             //获得预安装列表
    kAddShareUser,                  //将备份系统分享给其他人
    kDeleteShareUser,               //删除共享系统
    kGetShareUserList,              //获得共享用户列表
    kCheckControlPwd                //是否验证网络控制密码
}FuncID;

/**
 * 网络服务框架类,回调反馈协议
 **/
@protocol CloudServiceDelegate <NSObject>

-(BOOL)responseFormNetwork:(NSString *)resJson;

@end

/**
 * 网络服务框架类,主要模拟底层接口
 **/
@interface CloudService : NSObject
{
    id<CloudServiceDelegate> delegate;
}
@property (nonatomic, assign) id<CloudServiceDelegate> delegate;

//获得网络服务框架单例
+ (CloudService *)sharedInstance;

//网络请求函数
- (BOOL) sendRequest:(NSString *)jsonParameters;
@end
