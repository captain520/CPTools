//
//  CPCall.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPCall.h"
#import <UIKit/UIKit.h>

@implementation CPCall

+ (instancetype)shareInstance {
    static CPCall *obj;
    static dispatch_once_t once;
    
    if (nil == obj) {
        dispatch_once(&once, ^{
            obj = [[CPCall alloc] init];
        });
    }
    
    return obj;
}

- (void)call:(NSString *)phoneNumber {
    NSMutableString* str= [[NSMutableString alloc]initWithFormat:@"telprompt://%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
