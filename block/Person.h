//
//  Person.h
//  block
//
//  Created by 海神 on 2017/7/21.
//  Copyright © 2017年 海神. All rights reserved.
//

#import <Foundation/Foundation.h>
//name:类型的别名
typedef void(^BlockName)();

@interface Person : NSObject

@property (nonatomic, strong) void (^operation)();

- (void)eat:(BlockName)block;


- (Person * (^)(NSString *))run;

@end
