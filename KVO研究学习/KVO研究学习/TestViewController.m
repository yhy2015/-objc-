//
//  TestViewController.m
//  KVO研究学习
//
//  Created by ww on 2020/10/27.
//  Copyright © 2020 ww. All rights reserved.
//

#import "TestViewController.h"
#import "Singlon.h"


@interface TestViewController ()
{
    NSString* _age;
}
@property(nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSMutableArray *namesArr;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.namesArr = [NSMutableArray arrayWithCapacity:1];
//   1 对象
//  [self addObserver:self forKeyPath:@"count" options:(NSKeyValueObservingOptionNew) context:NULL];
    
//   1.1 单例
//   [[Singlon instance] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
        
//  2  集合类型的kvo
//  [self addObserver:self forKeyPath:@"namesArr" options:(NSKeyValueObservingOptionNew) context:NULL];
    
//    3、成员变量
    [self addObserver:self forKeyPath:@"_age" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@", change);
    
    NSLog(@"%@ ---", NSKeyValueChangeKindKey);
    
//        {
//            indexes = "<_NSCachedIndexSet: 0x600002c1f080>[number of indexes: 1 (in 1 ranges), indexes: (7)]";
//            kind = 2;
//            new =     (
//                1
//            );
//        }
//        集合类型打印change变化信息kind = 2, 对于对象类型kind = 1

     /*  change 字典的值为：
            {
                indexes：对应的值为数组操作的详细信息，包括索引等
                kind：   对应的值为数组操作的方式：
                         1：代表设置操作 对象类型
                         2：代表插入操作 集合类型
                         3：代表删除操作
                         4：代表替换操作
                         typedef NS_ENUM(NSUInteger, NSKeyValueChange) {
                             NSKeyValueChangeSetting = 1,
                             NSKeyValueChangeInsertion = 2,
                             NSKeyValueChangeRemoval = 3,
                             NSKeyValueChangeReplacement = 4,
                         };
                new/old：如果是插入操作，则字典中只会有new字段，对应的值为插入的元素，前提条件是options中传入了（NSKeyValueObservingOptionNew）
                         如果是删除操作，则字典中只会有old字段，对应的值为删除的元素，前提条件是options中传入了（NSKeyValueObservingOptionOld）
                         如果是替换操作，则字典中new和old字段都可以存在，对应的值为替换后的元素和替换前的元素，前提条件是options中传入了（NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld）
                
            如: indexes = "<_NSCachedIndexSet: 0x600001d092e0>[number of indexes: 1 (in 1 ranges), indexes: (0)]";
                kind = 2;
                new =     (
                    1
                );
            }
         */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.count += 1;
//    [Singlon instance].name = [NSString stringWithFormat:@"%@%@",[Singlon instance].name, @"+"];
    
    //对于集合类型不能使用这种方式添加数据，检测不到数据变化
//    [self.namesArr addObject:@"1"];
//    [[self mutableArrayValueForKey:@"namesArr"] addObject:@"1"];
    
//    3/成员变量
//    _age += 1;
    [self setValue:@"2" forKey:@"_age"];
}

- (void)dealloc{
//     如果观察的是单例，返回未执行removeObserver操作，由于本对象释放，数据变化会导致野指针崩溃
//    [[Singlon instance] removeObserver:self forKeyPath:@"name" context:nil];
    [self removeObserver:self forKeyPath:@"namesArr"];
}

@end
