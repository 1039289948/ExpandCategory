//
//  UITextField+Expand.m
//

#import "UITextField+Expand.h"
#import "UIButton+Expand.h"
#import "NSString+Expand.h"
#import "UIView+Expand.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@implementation UITextField (Expand)

+ (instancetype)ex_textFieldWithFrame:(CGRect)frame KeyboardType:(UIKeyboardType)keyboardType Placeholder:(NSString *)placeholder TextAlignment:(NSTextAlignment)textAlignment Delegate:(id<UITextFieldDelegate>)delegate{
    
    UITextField *textField      = [[[self class] alloc] initWithFrame:frame];
    textField.keyboardType      = keyboardType;
    textField.placeholder       = placeholder;
    textField.font              = [UIFont systemFontOfSize:14];
    textField.textAlignment     = textAlignment;
    textField.textColor         = RGBCOLOR(52, 52, 52);
    textField.delegate          = delegate;
    textField.clearButtonMode   = UITextFieldViewModeWhileEditing;
    [textField ex_setLeftViewWithText:@"  "];
    
//    UIKeyboardView *keyboardView = [[UIKeyboardView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 38)];
//    [[keyboardView itemForIndex:1] setTitle:@"完成"];
//    keyboardView.delegate = delegate;
//    textField.inputAccessoryView = keyboardView;

    
    return textField;
}

+ (instancetype)ex_defaultSearchTextFieldWithFrame:(CGRect)frame
                                       Placeholder:(NSString *)placeholder
                                          Delegate:(id<UITextFieldDelegate>)delegate
                                            Target:(id)target Action:(SEL)action {
    
    UITextField *textField = [[self class] ex_textFieldWithFrame:frame
                                                    KeyboardType:UIKeyboardTypeDefault
                                                     Placeholder:placeholder
                                                   TextAlignment:NSTextAlignmentLeft Delegate:delegate];
    
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField ex_setBorderWidth:12.f IsLeft:true];
    
    UIButton *searchBtn = [UIButton ex_buttonWithFrame:CGRectMake(0, 0, 55, CGRectGetHeight(frame))
                                                NorImg:nil selImg:nil
                                                Target:target Action:action];
    
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"Button_Normal_Blue"] forState:UIControlStateNormal];
    
    [textField setRightView:searchBtn];
    [textField setRightViewMode:UITextFieldViewModeAlways];
    [textField ex_setLayerCornerRadius:5.f AndBorderColor:[UIColor colorWithRed:224/255 green:224/255 blue:224/255 alpha:1]];
    
    return textField;
}

- (void)ex_setLeftViewWithImg:(UIImage *)img{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.contentMode  = UIViewContentModeCenter;
    imgView.frame        = CGRectMake(0, 0, 35, CGRectGetHeight(self.frame));
    
    self.leftView        = imgView;
    self.leftViewMode    = UITextFieldViewModeAlways;
}

- (void)ex_setLeftViewWithText:(NSString *)text{
    UILabel *label    = [[UILabel alloc] init];
    label.text        = text;
    label.textColor   = RGBCOLOR(40, 40, 40);
    label.font        = [UIFont systemFontOfSize:14];    
    [label sizeToFit];
    self.leftView     = label;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)ex_setLeftTextColor:(UIColor *)color{
    UILabel *label  = (UILabel *)self.leftView;
    
    if (![label isMemberOfClass:[UILabel class]]) return;
    
    label.textColor = color;
}

- (void)ex_setBorderWidth:(CGFloat)width IsLeft:(BOOL)isLeft{
    UIView *view   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    
    if (isLeft) {
        self.leftView     = view;
        self.leftViewMode = UITextFieldViewModeAlways;
    }else{
        self.rightView      = view;
        self.rightViewMode  = UITextFieldViewModeAlways;
    }
}

- (void)ex_setRightViewWithImg:(UIImage *)img{
    if (img) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        imgView.contentMode  = UIViewContentModeCenter;
        imgView.frame        = CGRectMake(0, 0, 30, CGRectGetHeight(self.frame));
        
        self.rightView       = imgView;
        self.rightViewMode   = UITextFieldViewModeAlways;   
    }
}

- (void)ex_setRightViewWithImg:(UIImage *)img AndWidth:(CGFloat)width{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.contentMode  = UIViewContentModeCenter;
    imgView.frame        = CGRectMake(0, 0, width, CGRectGetHeight(self.frame));
    
    self.rightView       = imgView;
    self.rightViewMode   = UITextFieldViewModeAlways;
}

- (void)ex_setRightViewWithText:(NSString *)text{
    UILabel *label    = [[UILabel alloc] init];
    label.text        = text;
    label.textColor   = RGBCOLOR(40, 40, 40);
    label.font        = [UIFont systemFontOfSize:14];
    
    [label sizeToFit];
    self.rightView     = label;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)ex_setPlaceholderColor:(UIColor *)color {
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)ex_setPlaceholderFont:(UIFont *)font {
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
}



- (BOOL)ex_canOnlyEnterAnIntegerWithReplacementString:(NSString *)string InRange:(NSRange)range {
    if ([string isEqualToString:@""])
        return true;
    
    return [NSString ex_isPureInt:string];
}

- (BOOL)ex_canOnlyEnterAnFloatWithReplacementString:(NSString *)string InRange:(NSRange)range {
    if ([string isEqualToString:@""])
        return true;
    
    NSString *newStr = [self.text stringByReplacingCharactersInRange:range withString:string];
    
    return [NSString ex_isPureFloat:newStr];
}


- (void)ex_setLayerCornerRadius:(CGFloat)radius AndBorderColor:(UIColor *)borderColor{
    self.layer.borderWidth   = 0.5f;
    self.layer.borderColor   = [borderColor CGColor];
    self.layer.cornerRadius  = radius;
    self.layer.masksToBounds = true;
}

@end
