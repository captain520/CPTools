//
//  CPCheckTextField.h
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/12.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPView.h"

typedef NS_ENUM(NSInteger, CPTextFiledDataType) {
    CPTextFiledDataTypeAll,             //  无限制
    CPTextFiledDataTypeAlphabet,        //  字母
    CPTextFiledDataTypeNum,             //  数字
    CPTextFiledDataTypeNumDecimal,      //  浮点数
    CPTextFiledDataTypeNumAlphabet,     //  数字字母
    CPTextFiledDataTypeOther            //  预留
};

@protocol CPCheckTextFieldDelegate<NSObject>

@optional
- (void)cp_textFieldDidBeginEditing:(UITextField *)textField;
- (void)cp_textFieldDidEndEditing:(UITextField *)textField;

@end

@interface CPCheckTextField : CPView<UITextFieldDelegate>

@property (nonatomic, weak) id <CPCheckTextFieldDelegate> delegate;

//  文本最大长度
@property (nonatomic, assign) NSInteger maxContentLength;

//键盘类型
@property (nonatomic, assign) UIKeyboardType keyboardType;

//是否密码输入模式
@property (nonatomic, assign) BOOL secureTextEntry;

//错误信息提示内容
@property (nonatomic, copy) NSString *errorMsg;

//自动大写模式
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;

//数据类型
@property (nonatomic, assign) CPTextFiledDataType dataType;

//是否需要大写
@property (nonatomic, assign) BOOL isUpercaseString;

@end
