//
//  NSArray+Expand.h
//

#import <Foundation/Foundation.h>

@interface NSArray (Expand)

/**
 *  @return 返回 包含 拥有指定 key value 的Object 的list 如果没有返回nil
 */
- (NSArray *)ex_containSpecifiedValueDictionary:(NSString *)value WithKey:(NSString *)key;

- (NSArray *)ex_containSpecifiedValueDictionary:(NSString *)value WithKey:(NSString *)key IsString:(BOOL)isString;

- (NSArray *)ex_filteredArrayWithFormat:(NSString *)format;

/**
 *  数组元素倒序
 *
 *  @return 倒序的新数组
 */
- (NSArray *)ex_getReverseArray;

@end
