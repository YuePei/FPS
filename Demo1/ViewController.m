//
//  ViewController.m
//  Demo1
//
//  Created by Peyton on 2018/9/3.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"
#import "Person.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self performSelector:@selector(testMethod:)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[SecondVC new] animated:YES completion:nil];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;//返回YES，进入下一步转发
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;//返回nil，进入下一步转发
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"testMethod:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];//签名，进入forwardInvocation
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    
    Person *p = [Person new];
    if([p respondsToSelector:sel]) {
        NSLog(@"%s",anInvocation.selector);
        NSString *str = @"Lucy";
        [anInvocation setArgument:&str atIndex:2];
        [anInvocation invokeWithTarget:p];
    }
    else {
        [self doesNotRecognizeSelector:sel];
    }
    
}


@end
