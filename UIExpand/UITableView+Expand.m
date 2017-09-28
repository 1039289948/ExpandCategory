//
//  UITableView+Expand.m
//

#import "UITableView+Expand.h"

@implementation UITableView (Expand)

- (void)clearRestCell{
    self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

@end
