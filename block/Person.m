//
//  Person.m
//  block
//
//  Created by 海神 on 2017/7/21.
//  Copyright © 2017年 海神. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)eat:(void (^)())block
{
///**************************子类重写父类方法*******************************/
//- (UIScrollView *(^)(CGRect))ZH_frame;
//- (UIScrollView *(^)(CGPoint))ZH_center;
//- (UIScrollView *(^)(NSString *))ZH_backgroundColor;
//- (UIScrollView *(^)(UIScrollView*))ZH_addSubview;
//- (UIScrollView *(^)(CGFloat))ZH_alpha;
//- (UIScrollView *(^)(BOOL))ZH_clipsToBounds;
//- (UIScrollView *(^)(BOOL))ZH_hidden;
//- (UIScrollView *(^)(BOOL))ZH_userInteractionEnabled;
///**************************子类重写父类方法*******************************/
//- (UIScrollView *(^)(CGRect))ZH_frame{
//    return ^(CGRect rect) {
//        self.frame = rect;
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(CGPoint))ZH_center{
//    return ^(CGPoint point) {
//        self.center = point;
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(NSString *))ZH_backgroundColor{
//    return ^(NSString *string){
//        if ([string isKindOfClass:[NSString class]]) {
//            self.backgroundColor = [UIColor colorWithHexString:string];
//        }else if ([string isKindOfClass:[UIColor class]]) {
//            self.backgroundColor = (UIColor *)string;
//        }
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(UIScrollView *))ZH_addSubview{
//    return ^(UIScrollView *view) {
//        [view addSubview:self];
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(CGFloat))ZH_alpha{
//    return ^(CGFloat alpha) {
//        self.alpha = alpha;
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(BOOL))ZH_clipsToBounds{
//    return ^(BOOL clipstobounds){
//        self.clipsToBounds = YES;
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(BOOL))ZH_hidden{
//    return ^(BOOL hidden) {
//        self.hidden = hidden;
//        return self;
//    };
//}
//
//- (UIScrollView *(^)(BOOL))ZH_userInteractionEnabled{
//    return ^(BOOL userInteractionEnabled) {
//        self.userInteractionEnabled = userInteractionEnabled;
//        return self;
//    };
//}

    block();
}

- (Person* (^)(NSString *))run{
    return ^(NSString * i){
        NSLog(@"%@",i);
        return self;
    };
}


@end
