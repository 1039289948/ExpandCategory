//
//  UILabel+Expand.m
//

#import "UILabel+Expand.h"

@implementation UILabel (Expand)

+ (instancetype)ex_labelWithFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor TextAlignment:(NSTextAlignment)textAlignment Font:(UIFont *)font{
    
    UILabel *label      = [[[self class] alloc] initWithFrame:frame];
    label.text          = text;
    label.textColor     = textColor;
    label.textAlignment = textAlignment;
    label.font          = font;
    
    return label;
}

- (void)ex_setLineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString *attStr = [self.attributedText mutableCopy];
    
    if (attStr == nil && self.text)
        attStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    if (!attStr) 
        return;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment                = self.textAlignment;
    
    [style setLineSpacing:lineSpacing];
    
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.text.length)];
    
    self.attributedText = attStr;
}

- (void)ex_setTextColor:(UIColor *)color AndFont:(UIFont *)font {
    self.textColor = color;
    self.font      = font;
}

@end
