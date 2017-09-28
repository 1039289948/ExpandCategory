//
//  UILabel+Expand.h
//

#import <UIKit/UIKit.h>

@interface UILabel (Expand)

/**
 *  生成Label
 */
+ (instancetype)ex_labelWithFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor TextAlignment:(NSTextAlignment)textAlignment Font:(UIFont *)font;


/**
 *  设置行间距
 */
- (void)ex_setLineSpacing:(CGFloat)lineSpacing;

- (void)ex_setTextColor:(UIColor *)color AndFont:(UIFont *)font;

@end
