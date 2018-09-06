//
//  FPSLabel.m
//  FirstProject
//
//  Created by Peyton on 2018/8/31.
//  Copyright © 2018年 BJ. All rights reserved.
//

#import "FPSLabel.h"
#import "TargetProxy.h"

@interface FPSLabel ()
//link
@property (nonatomic, strong)CADisplayLink *link;

//时间戳
@property (nonatomic, assign)NSTimeInterval lastTime;
//count
@property (nonatomic, assign)int count;
//FPS
@property (nonatomic, assign)float fpsNumber;

@end
@implementation FPSLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        _link = [CADisplayLink displayLinkWithTarget:[TargetProxy proxyWithTarget:self] selector:@selector(linkMethod:)];
        [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.lastTime = 0;
        self.count = 0;
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:15];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setFrame:self.bounds];
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5];
        shapeLayer.path = bezierPath.CGPath;
        self.layer.mask = shapeLayer;
        
    }
    return self;
}

- (void)linkMethod:(CADisplayLink *)link {
    if(self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    self.count ++;
    NSTimeInterval oneSecond = link.timestamp - self.lastTime;
    if(oneSecond < 1) {
        return;
    }else {
        self.fpsNumber = self.count / oneSecond;
        NSLog(@"%.2lf",self.fpsNumber);
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.2f FPS", self.fpsNumber]];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 5)];
        [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Menlo" size:14] range:NSMakeRange(0, 5)];
        self.attributedText = string;
        self.count = 0;
        self.lastTime = link.timestamp;
    }
    
}

- (void)dealloc {
    [self.link invalidate];
}

@end
