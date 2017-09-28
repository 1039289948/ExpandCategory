//
//  UIButton+VerificCode.m
//
//

#import "UIButton+VerificCode.h"

@implementation UIButton (VerificCode)


- (void)ex_toWaitingWithOutTime:(CGFloat)outTime{
    
    self.userInteractionEnabled = NO;
    __block int timeout=59; //倒计时时间
    if (outTime != 0)
        timeout = outTime;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                for (id view in [self subviews]) {
                    if([view isKindOfClass:[UILabel class]]){
                        UILabel *label      = (UILabel *)view;
                        label.textAlignment = NSTextAlignmentCenter;
                        
                        label.text          = @"再次获取";
                    }
                }
                self.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2ds后获取", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                for (id view in [self subviews]) {
                    if([view isKindOfClass:[UILabel class]]){
                        UILabel *label      = (UILabel *)view;
                        label.text          = strTime;
                    }
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


@end
