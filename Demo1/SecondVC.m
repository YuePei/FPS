//
//  SecondVC.m
//  Demo1
//
//  Created by Peyton on 2018/9/6.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "SecondVC.h"
#import "FPSLabel.h"

@interface SecondVC ()
//fpsLabel
@property (nonatomic, strong)FPSLabel *fpsLabel;

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fpsLabel];
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark lazy
- (FPSLabel *)fpsLabel {
    if (!_fpsLabel) {
        _fpsLabel = [[FPSLabel alloc]initWithFrame:CGRectMake(20, 100, 100, 30)];
        [self.view addSubview:_fpsLabel];
    }
    return _fpsLabel;
}
@end
