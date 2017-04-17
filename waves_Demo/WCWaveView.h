//
//  WCWaveView.h
//  waves_Demo
//
//  Created by admin on 2017/4/17.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCWaveView : UIView
/**
 一个定时器，用于不断刷新UI
 */
@property (nonatomic, strong) CADisplayLink *waveDisplaylink;

/**
 一个基于path的形状图层，必须给定path
 */
@property (nonatomic, strong) CAShapeLayer *waveLayer1;

@property (nonatomic, strong) CAShapeLayer *waveLayer2;

@end
