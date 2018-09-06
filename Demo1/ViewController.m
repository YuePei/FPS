//
//  ViewController.m
//  Demo1
//
//  Created by Peyton on 2018/9/3.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[SecondVC new] animated:YES completion:nil];
}

@end
