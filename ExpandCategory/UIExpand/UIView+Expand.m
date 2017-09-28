//
//  UIView+Expand.m
//

#import "UIView+Expand.h"

@implementation UIView (Expand)


- (void)setM_x:(CGFloat)m_x{
    CGRect frame   = self.frame;
    frame.origin.x = m_x;
    
    self.frame     = frame;
}

- (void)setM_y:(CGFloat)m_y{
    CGRect frame   = self.frame;
    frame.origin.y = m_y;
    
    self.frame     = frame;
}

- (void)setM_width:(CGFloat)m_width{
    CGRect frame     = self.frame;
    frame.size.width = m_width;
    
    self.frame       = frame;
}

- (void)setM_height:(CGFloat)m_height{
    CGRect frame      = self.frame;
    frame.size.height = m_height;
    
    self.frame        = frame;
}

- (void)setM_size:(CGSize)m_size{
    CGRect frame      = self.frame;
    frame.size        = m_size;
    
    self.frame        = frame;
}

- (void)setM_centerX:(CGFloat)m_centerX{
    CGPoint point = CGPointMake(m_centerX, self.center.y);
    
    self.center   = point;
}

- (void)setM_centerY:(CGFloat)m_centerY{
    CGPoint point = CGPointMake(self.m_centerX, m_centerY);
    
    self.center   = point;
}

- (CGFloat)m_x{
    return self.frame.origin.x;
}

- (CGFloat)m_y{
    return self.frame.origin.y;
}

- (CGFloat)m_width{
    return self.frame.size.width;
}

- (CGFloat)m_height{
    return self.frame.size.height;
}

- (CGSize)m_size{
    return self.frame.size;
}

- (CGFloat)m_centerX{
    return self.center.x;
}

- (CGFloat)m_centerY{
    return self.center.y;
}

- (CGFloat)m_midX{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)m_midY{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)m_maxX{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)m_maxY{
    return CGRectGetMaxY(self.frame);
}

- (CAShapeLayer *)ex_addDottedLineWithFrame:(CGRect)frame StrokeColor:(UIColor *)strokeColor SolidLineLength:(CGFloat)lineLenght Interval:(CGFloat)interval{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    [layer setFrame:frame];
    
    layer.fillColor   = [[UIColor clearColor] CGColor];
    layer.strokeColor = [strokeColor CGColor];
    layer.lineJoin    = kCALineCapRound;
    layer.lineWidth   = MIN(frame.size.height, frame.size.width);
    
    layer.lineDashPattern = @[@(lineLenght) , @(interval)];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);

    CGPathAddLineToPoint(path, NULL, frame.size.width, frame.size.height);
    
    layer.path = path;
    CGPathRelease(path);

    [self.layer addSublayer:layer];
    
    return layer;
}

- (CALayer *)ex_addLineWithFrame:(CGRect)frame BackgroundColor:(UIColor *)backgroundColor{
    CALayer *layer = [CALayer layer];
    
    [layer setFrame:frame];
    layer.backgroundColor = [backgroundColor CGColor];
    
    [self.layer addSublayer:layer];
    
    return layer;
}

- (CAShapeLayer *)ex_addRoundedCornersLineWithFrame:(CGRect)frame IsVertical:(BOOL)isVertical BackgroundColor:(UIColor *)backgroundColor{
    CAShapeLayer *layer = [CAShapeLayer layer];
    [layer setFrame:frame];
    
    CGFloat lineW = isVertical ? lineW = frame.size.width : frame.size.height;
    
    layer.fillColor   = [[UIColor clearColor] CGColor];
    layer.strokeColor = [backgroundColor CGColor];
    layer.lineCap     = kCALineCapRound;
    layer.lineWidth   = lineW;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (lineW == frame.size.width) {
        CGPathMoveToPoint(path, NULL, lineW/2.f, 0);
        CGPathAddLineToPoint(path, NULL, lineW/2.f, frame.size.height);
    } else {
        CGPathMoveToPoint(path, NULL, 0, lineW/2.f);
        CGPathAddLineToPoint(path, NULL, frame.size.width, lineW/2.f);
    }
    
    layer.path = path;
    CGPathRelease(path);
    
    [self.layer addSublayer:layer];
    
    return layer;
}

- (void)ex_addTransparentLayerInFrame:(CGRect)frame AndRadius:(CGFloat)radius {

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path          = path.CGPath;
    
    [self.layer setMask:shapeLayer];
}

//- (void)ex_addDefaultShadow{
//    [self ex_addShadowWithColor:RGBCOLOR(198, 198, 198) withRadius:5.f withShadowOffset:CGSizeMake(3, 3)];
//}

- (void)ex_addShadowWithColor:(UIColor *)color {
    [self ex_addShadowWithColor:color withRadius:5.f withShadowOffset:CGSizeMake(3, 3)];
}

- (void)ex_addShadowWithColor:(UIColor *)color withRadius:(CGFloat)radius withShadowOffset:(CGSize)offSize{
    self.layer.shadowColor   = [color CGColor];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius  = radius;
    self.layer.shadowOffset  = offSize;
}


//- (void)ex_addVisualEffectViewWithStyle:(UIBlurEffectStyle)style {
//    if (ISIOS8) {
//        UIVisualEffectView *effView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
//        
//        [self addSubview:effView];
//        
////        [effView setFrame:self.bounds];
//        [effView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo (UIEdgeInsetsZero);
//        }];
//    }else
//        ZNLog(@"不支持iOS8以下版本！");
//}

- (void)ex_setRadius:(CGFloat)radius Masks:(BOOL)masks{
    self.layer.cornerRadius = radius;

    if (masks)
        self.layer.masksToBounds = true;
}

- (void)ex_setBorderWidth:(CGFloat)width AndColor:(UIColor *)color{
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}








#pragma mark 事件





@end
