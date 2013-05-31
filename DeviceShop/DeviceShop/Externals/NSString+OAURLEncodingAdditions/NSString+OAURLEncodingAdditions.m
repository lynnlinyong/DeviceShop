//
//  NSString+OAURLEncodingAdditions.m
//  DeviceShop
//
//  Created by lynn on 13-5-30.
//  Copyright (c) 2013年 lynn. All rights reserved.
//

#import "NSString+OAURLEncodingAdditions.h"

@implementation NSString (OAURLEncodingAdditions)

//UTF8编码
- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes       (kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"),                                                                 kCFStringEncodingUTF8);
    [result autorelease];
    return result;
}

//UTF8解码
- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)self,CFSTR(""),kCFStringEncodingUTF8);
    [result autorelease];
    return result;
}

@end
