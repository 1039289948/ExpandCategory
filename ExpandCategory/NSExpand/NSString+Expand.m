//
//  NSString+Expand.m
//

#import "NSString+Expand.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Expand)

- (NSString *)ex_removeSpecifiedString:(NSString *)string{
    
    NSArray *array = [self componentsSeparatedByString:string];
    
    return [array componentsJoinedByString:@""];
}

- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndWidth:(CGFloat)width;{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                            context:nil].size;
    return retSize;
}

- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndHight:(CGFloat)hight {
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, hight)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}

+ (NSString *)ex_stringWithId:(id)value{
    NSString *strValue = @"";
    
    if(value == nil || value == [NSNull null]){
        
    }else{
        if ([value isKindOfClass:[NSNumber class]])
            strValue = [NSString stringWithFormat:@"%@", value];
        else
            strValue = value;
        
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    }
    
    return strValue;
}



+ (NSInteger)ex_integerWithId:(id)value{
    NSInteger intValue = 0;
    
    if(value == nil || value == [NSNull null]){
        
    }else
        intValue = [value integerValue];
    
    return intValue;
}

+ (long long)ex_longLongWithId:(id)value{
    long long intValue = 0;
    
    if(value == nil || value == [NSNull null]){
        
    }else
        intValue = [value longLongValue];
    
    return intValue;
}

+ (CGFloat)ex_floatWithId:(id)value{
    
    CGFloat fValue = 0;
    if(value == nil || value == [NSNull null]){
        
    }else {
        fValue = [value floatValue];
    }
    return fValue;
}
+(BOOL)ex_judgeTheillegalCharacter:(NSString *)content model:(NSString *)model{
    if ([content isEqualToString:@""]) {
        return false;
    }
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", model];
    BOOL ret = [emailTest evaluateWithObject:content];
    
    if (ret == false) {
        return true;
    }
    return false;
}

/** 时间戳转->字符串 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp{
    
    NSDate *date            = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *timeStr = [format stringFromDate:date];
    
    return timeStr;
}

/** 时间戳转->字符串 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp DateFormat:(NSString *)dateFormat{
    
    NSDate *date            = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    [format setDateFormat:dateFormat];
    NSString *timeStr = [format stringFromDate:date];
    
    return timeStr;
}

/** 字符串转->时间戳 指定格式 */
+ (double)ex_getTimeStampWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    
    NSDate *date = [format dateFromString:str];
    
    return [date timeIntervalSince1970] * 1000;
}

+ (NSDate *)ex_getTimeStampDateWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    
    return [format dateFromString:str];
}

+ (BOOL)ex_isNSNumber:(NSString *)string{

    if ([string isEqualToString:@""]) return true;
    
    NSString *str =@"^[0-9]*$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    BOOL ret = [emailTest evaluateWithObject:string];
    return ret;

}

+ (BOOL)ex_isPureInt:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)ex_isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)ex_isMobileString {
    
    if (self.length != 11)
        return false;
    
    if (![NSString ex_isPureInt:self])
        return false;
    
    return true;
}

- (BOOL)ex_isLegalString{
    NSString *str = [NSString ex_stringWithId:self];
    if ([str isEqualToString:@""]){
        return false;
    }
    return true;
}

- (NSString *)ex_md5Security {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)ex_mobileSecurity{
    if (self.length != 11) {
        if (self.length != 0) 
            NSLog(@"手机号处理错误：%@", self);
        
        return self;
    }
    
    NSMutableString *mutStr = [self mutableCopy];
    
    [mutStr replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    return mutStr;
}

- (NSString *)ex_subStringToIndex:(NSInteger)index {
    if (self.length <= index)
        return self;
    
    return [self substringToIndex:index];
}

- (NSMutableAttributedString *)ex_getAttStringWithAttributeInfo:(NSDictionary *)info InRange:(NSRange)range{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [info enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [attStr addAttribute:key value:obj range:range];
    }];
    
    return attStr;
}


+ (NSString *)ex_replaceSpanceObjce:(id)obj{

    NSString *str = nil;
    str = [obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return str;
}


@end
