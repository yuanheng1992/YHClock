//
//  ViewController.m
//  YHClock
//
//  Created by 06care on 2018/7/25.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "ViewController.h"
#import "YHClock.h"

@interface ViewController () <YHClockDelegate>

@property (nonatomic, strong) YHClock *clock;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat clockWidth = 120;
    self.clock.frame = CGRectMake((screenWidth - clockWidth)/2.0, 100, clockWidth, clockWidth);
    [self.view addSubview:self.clock];
    
    self.label.frame = CGRectMake(20, 240, screenWidth - 40, 40);
    [self.view addSubview:self.label];
}

#pragma mark -- YHClockDelegate

- (void)clock:(YHClock *)clock hours:(NSInteger)hours minutes:(NSInteger)minutes
{
    NSString *time = [NSString stringWithFormat:@"%ld : %02ld", hours, minutes];
    self.label.text = time;
}

#pragma mark -- Getter

- (YHClock *)clock {
    if (!_clock) {
        _clock = [[YHClock alloc] init];
        _clock.delegate = self;
    }
    return _clock;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:18.0];
    }
    return _label;
}

@end
