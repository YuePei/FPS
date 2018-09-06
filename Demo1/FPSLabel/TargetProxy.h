//
//  TargetProxy.h
//  Demo1
//
//  Created by Peyton on 2018/9/6.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;

@end
