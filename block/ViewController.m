//
//  ViewController.m
//  block
//
//  Created by 海神 on 2017/6/9.
//  Copyright © 2017年 海神. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIView+ZHChain.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [UICollectionView alloc] initWithFrame:<#(CGRect)#> collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>
    UILabel *ll = UILabel.label.ZH_text(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx").ZH_adjustsFontSizeToFitWidth(NO).ZH_textAlignment(NSTextAlignmentCenter).ZH_numberOfLines(0).ZH_textColor([UIColor redColor]).ZH_font(@25).ZH_addSubview(self.view).ZH_frame(CGRectMake(100, 100, 200, 200)).ZH_backgroundColor([UIColor blackColor]);

    NSLog(@"%@",NSStringFromCGSize([ll sizeThatFits:CGSizeMake(200, 100)]));
}

//blcok开发使用场景
//1.把block保存到对象中，恰当的时候去调用
//2.把block当做方法的参数使用
//3.把block当做方法的返回值，目的就是为了代替方法，封装内部的实现，把block当做方法的返回值
- (void)block{
    void(^block)() = ^() {
        NSLog(@"你好");
    };
    block();
    //    returnType        返回值类型
    //    blockName         block名称
    //    parameterTypes    block参数
    //    parameters        block参数
    // block作用：帮助保存一份代码，等到恰当的时候回才去调用
}

@end
