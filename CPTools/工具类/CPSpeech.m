//
//  CPSpeech.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/10.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPSpeech.h"

@implementation CPSpeech

+ (instancetype)shareInstance {
    static CPSpeech *obj;
    static dispatch_once_t once;
    
    if (nil == obj) {
        dispatch_once(&once, ^{
            obj = [[CPSpeech alloc] init];
            
            obj.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        });
    }
    
    return obj;
}

- (void)speak:(NSString *)content {
    
    AVSpeechUtterance *speechUtterance = [[AVSpeechUtterance alloc] initWithString:content];

    [self.speechSynthesizer speakUtterance:speechUtterance];
}

- (void)speak:(NSString *)content voice:(NSString *)language {
    
    AVSpeechUtterance *speechUtterance = [[AVSpeechUtterance alloc] initWithString:content];
    speechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:language];
    
    [self.speechSynthesizer speakUtterance:speechUtterance];
}

@end
