//
//  main.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import <Foundation/Foundation.h>
#import "LGPerson.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        // NSObject *objc1 = [NSObject alloc];
        LGPerson *objc2 = [LGPerson alloc];
        // LGPerson *objc3 = [LGPerson alloc];

        NSLog(@"Hello, World!  %@",objc2);
        
        
        class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)

    }
    return 0;
}
