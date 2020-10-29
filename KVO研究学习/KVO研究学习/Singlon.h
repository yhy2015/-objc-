//
//  Singlon.h
//  KVO研究学习
//
//  Created by ww on 2020/10/27.
//  Copyright © 2020 ww. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singlon : NSObject
+ (instancetype)instance;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@property (nonatomic,strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
