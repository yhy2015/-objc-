//
//  Singlon.m
//  KVO研究学习
//
//  Created by ww on 2020/10/27.
//  Copyright © 2020 ww. All rights reserved.
//

#import "Singlon.h"

@interface Singlon ()

@end

@implementation Singlon

+ (instancetype)instance{
    static Singlon *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        防止alloc] init] 和new引起的错误,因为alloc] init] 和 new 实际是一样的工作原理.都是执行了下面方法
        _sharedSingleton = [[super allocWithZone:NULL] init];
    });
    return _sharedSingleton;
}

// 防止外部调用alloc 或者 new
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [Singlon instance];
}

@end
