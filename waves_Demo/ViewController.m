//
//  ViewController.m
//  waves_Demo
//
//  Created by admin on 2017/4/17.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "ViewController.h"
#import "WCWaveView.h"

@interface ViewController ()


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    WCWaveView *waveView = [[WCWaveView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    waveView.layer.cornerRadius = 50;
    [self.view addSubview:waveView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
