# CPTools

增加过滤数据类型的文字输入框CPCheckTextField

```objective-c
_checkTF = [[CPCheckTextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
_checkTF.dataType = CPTextFiledDataTypeAlphabet;
_checkTF.isUpercaseString = YES;
_checkTF.errorMsg = @"电话号码错误,请校对您输入的电话号码是否争取";

[self.view addSubview:_checkTF];
```
    
[简书地址](https://www.jianshu.com/p/2899ca1950d9)
