//
//  CPSpeech.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface CPSpeech : NSObject

@property (nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;

+ (instancetype)shareInstance;

- (void)speak:(NSString *)content;

- (void)speak:(NSString *)content voice:(NSString *)language;

@end
