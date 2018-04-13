//
//  CPCheckTextField.m
//  CPTools
//
//  Created by wangzhangchuan on 2018/4/12.
//  Copyright © 2018年 Captain. All rights reserved.
//

#import "CPCheckTextField.h"
#import "CPTextField.h"

#define ALPHABET   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

@implementation CPCheckTextField {
    
    CPTextField *textField;
    
    CPLabel *hintLB;
}

- (void)setupUI {
    
    {
        self.maxContentLength = NSNotFound;
    }

    {

        CGRect tFrame = {self.bounds.origin, self.bounds.size.width - 100,self.bounds.size.height};
        
        textField = [[CPTextField alloc] initWithFrame:tFrame];
        textField.placeholder = @"请输入字符串";
        textField.delegate = self;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;

        [self addSubview:textField];
//        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(cellSpaceOffset);
//            make.right.mas_equalTo(-100);
//            make.top.mas_equalTo(CPTOP_BOTTOM_OFFSET_F);
//            make.bottom.mas_equalTo(-CPTOP_BOTTOM_OFFSET_F);
//        }];
    }
    
    {
        CGRect tFrame = {self.bounds.size.width - 100, 0, 100, self.bounds.size.height};
        hintLB = [[CPLabel alloc] initWithFrame:tFrame];
        hintLB.text = @"输入错误";
        hintLB.hidden = YES;
        hintLB.textColor = UIColor.redColor;
        
        [self addSubview:hintLB];
//        [hintLB mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(0);
//            make.left.mas_equalTo(textField.mas_right).offset(cellSpaceOffset/2);
//            make.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(0);
//        }];
    }
}

#pragma mark - setter && getter method

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    textField.keyboardType = keyboardType;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    _secureTextEntry = secureTextEntry;
    textField.secureTextEntry = _secureTextEntry;
}

- (void)setErrorMsg:(NSString *)errorMsg {
    _errorMsg = errorMsg;
    hintLB.text = _errorMsg;
}


#pragma mark - textfield delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    //  总的字符串不能超过 maxContentLength
    if (textField.text.length + string.length > self.maxContentLength) {
        return NO;
    }
    
    NSMutableCharacterSet *cs = [NSMutableCharacterSet characterSetWithCharactersInString:@""];
    switch (self.dataType) {
        case CPTextFiledDataTypeAlphabet:
        {
            [cs addCharactersInString:ALPHABET];
        }
            break;
        case CPTextFiledDataTypeNum:
        {
            [cs formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
        }
            break;
        case CPTextFiledDataTypeNumDecimal:
        {
            [cs formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
            
            if (![textField.text containsString:@"."]) {
                [cs addCharactersInString:@"."];
            }
        }
            break;
        case CPTextFiledDataTypeNumAlphabet:
        {
            [cs addCharactersInString:ALPHABET];
            [cs formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
        }
            break;
            
        default:
            break;
    }

    NSString *filtered = [[string componentsSeparatedByCharactersInSet:[cs invertedSet]] componentsJoinedByString:@""];
    
    if ([filtered isEqualToString:string] == NO) {
        
        // 处理粘贴自动添加的前/后空格
        NSMutableString *tempStr = [[NSMutableString alloc] initWithString:string];
        if ([tempStr hasPrefix:@" "]) {
            [tempStr deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        
        if ([tempStr hasSuffix:@" "]) {
            [tempStr deleteCharactersInRange:NSMakeRange(tempStr.length - 1, 1)];
        }
        
        BOOL valied = [filtered isEqualToString:tempStr];
        if (valied == YES) {
            // 自动转为大写
            if (self.isUpercaseString) {
                return [self cp_upercaseSting:range replacementString:tempStr];
            }
                
        } else {
            return NO;
        }

    } else {
        
        // 自动转为大写
        if (self.isUpercaseString) {
            return [self cp_upercaseSting:range replacementString:string];
        }
        
        return YES;
    }

    return YES;
}


/**
 将字母转换为大写

 @param range 插入位置
 @param string 要处理的字符串
 @return YES：使用原字符  NO：使用处理过的字符
 */
- (BOOL)cp_upercaseSting:(NSRange )range replacementString:(NSString *)string {
    
    NSMutableString *tempStr = textField.text.mutableCopy;
    [tempStr insertString:string atIndex:range.location];
    textField.text = [tempStr uppercaseString];
    
    //  光标指定到指定位置
    UITextPosition *starP = [textField positionFromPosition:textField.beginningOfDocument offset:range.location + 1];
    UITextPosition *endP  = [textField positionFromPosition:textField.beginningOfDocument offset:range.location + 1];
    UITextRange *p        = [textField textRangeFromPosition:starP toPosition:endP];
    
    [textField setSelectedTextRange:p];
    
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    hintLB.hidden = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cp_textFieldDidBeginEditing:)]) {
        [self.delegate cp_textFieldDidBeginEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    hintLB.hidden = NO;
    
    //  有限制的类型，全部过滤掉空格，主要是防止iOS复制的时候自动在前/后增加空格
    if (self.dataType != CPTextFiledDataTypeAll) {
        textField.text = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cp_textFieldDidEndEditing:)]) {
        [self.delegate cp_textFieldDidEndEditing:textField];
    }
}

@end
