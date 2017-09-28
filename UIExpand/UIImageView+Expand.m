//
//  UIImageView+Expand.m
//

#import "UIImageView+Expand.h"

@implementation UIImageView (Expand)

+ (instancetype)ex_imageViewWithFrame:(CGRect)frame Image:(UIImage *)image ContentMode:(UIViewContentMode)mode {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    
    imgView.image        = image;

    imgView.contentMode  = mode;
    
    if (imgView.contentMode == UIViewContentModeScaleAspectFill)
        imgView.clipsToBounds = true;
    
    return imgView;
}

@end
