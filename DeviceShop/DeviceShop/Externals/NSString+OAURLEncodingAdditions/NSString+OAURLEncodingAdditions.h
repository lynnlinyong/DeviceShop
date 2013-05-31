//
//  NSString+OAURLEncodingAdditions.h
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (OAURLEncodingAdditions)

//UTF8编码
- (NSString *)URLEncodedString;

//UTF8解码
- (NSString*)URLDecodedString;

@end
