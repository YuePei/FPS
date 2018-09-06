//
//  TargetProxy.m
//  Demo1
//
//  Created by Peyton on 2018/9/6.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "TargetProxy.h"

@interface TargetProxy()
//target, 这里必须要用weak, 因为某个对象会强引TimeProxy对象, TimeProxy对象不能再强引target, 否则会形成循环引用
@property (nonatomic, weak)id target;

@end
@implementation TargetProxy
+ (instancetype)proxyWithTarget:(id)target {
    TargetProxy *proxy = [[self class] alloc];
    proxy.target = target;
    return proxy;
}

//获取target类中的sel方法的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self.target respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.target];
    }else {
        [invocation doesNotRecognizeSelector:invocation.selector];
    }
}

@end
