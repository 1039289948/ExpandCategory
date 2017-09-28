//
//  UIView+Expand.h
///

#import <UIKit/UIKit.h>

@interface UIView (Expand)

@property (nonatomic, assign) CGFloat m_x;

@property (nonatomic, assign) CGFloat m_y;

@property (nonatomic, assign) CGFloat m_width;

@property (nonatomic, assign) CGFloat m_height;

@property (nonatomic, assign) CGSize m_size;

@property (nonatomic, assign) CGFloat m_centerX;

@property (nonatomic, assign) CGFloat m_centerY;

@property (nonatomic, assign, readonly) CGFloat m_midX;

@property (nonatomic, assign, readonly) CGFloat m_midY;

@property (nonatomic, assign, readonly) CGFloat m_maxX;

@property (nonatomic, assign, readonly) CGFloat m_maxY;


/**
 *  添加一根虚线
 *
 *  @param frame       frame
 *  @param strokeColor 颜色
 *  @param lineLenght  线段长度
 *  @param interval    间隔
 */
- (CAShapeLayer *)ex_addDottedLineWithFrame:(CGRect)frame StrokeColor:(UIColor *)strokeColor SolidLineLength:(CGFloat)lineLenght Interval:(CGFloat)interval;

/**
 *  添加一根线
 */
- (CALayer *)ex_addLineWithFrame:(CGRect)frame BackgroundColor:(UIColor *)backgroundColor;

/**
 *  添加一根圆角线
 *  isVertical true竖线 false横线
 */
- (CAShapeLayer *)ex_addRoundedCornersLineWithFrame:(CGRect)frame IsVertical:(BOOL)isVertical BackgroundColor:(UIColor *)backgroundColor;

/**
 *  添加透明区域 自身透明 露出supperView
 */
- (void)ex_addTransparentLayerInFrame:(CGRect)frame AndRadius:(CGFloat)radius;

/**
 *  添加阴影
 */
//- (void)ex_addDefaultShadow;

- (void)ex_addShadowWithColor:(UIColor *)color;

- (void)ex_addShadowWithColor:(UIColor *)color withRadius:(CGFloat)radius withShadowOffset:(CGSize)offSize;

/**
 *  添加朦版
 */
//- (void)ex_addVisualEffectViewWithStyle:(UIBlurEffectStyle)style;

- (void)ex_setRadius:(CGFloat)radius Masks:(BOOL)masks;

- (void)ex_setBorderWidth:(CGFloat)width AndColor:(UIColor *)color;



#pragma mark 事件





@end
