//
//  UIImage+Expand.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Expand)

+ (instancetype)ex_getImageWithName:(NSString *)name EdgeInsets:(UIEdgeInsets)edgeInsets;

- (instancetype)ex_getImageWithEdgeInsets:(UIEdgeInsets)edgeInsets;

/** 调整图片方向为Up */
- (instancetype)ex_adjustImageOrientationUp;

/**
 调整图片方向

 @param aImage 原图片
 @return 旋转后图片
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;
@end
