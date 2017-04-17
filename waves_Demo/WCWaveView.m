//
//  WCWaveView.m
//  waves_Demo
//
//  Created by admin on 2017/4/17.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "WCWaveView.h"

@implementation WCWaveView
{
    CGFloat amplitude1;//振幅一
    CGFloat amplitude2;//振幅二
    CGFloat cycle_T;//周期
    CGFloat offset1_x;//第一个波浪的位移
    CGFloat offset2_x;//第二个波浪的位移
    CGFloat curremt_waveHeight;//当前波浪的高度
    CGFloat waveSpeed1;//第一个波浪的速度
    CGFloat waveSpeed2;//第二个波浪的速度
    CGFloat waveWidth;//波浪视图的宽度
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        [self setUp];
        
    }
    
    return self;
}


- (void)setUp{
    
    //设置一个波浪视图宽度
    waveWidth = self.frame.size.width;
    
    //设置周期
    cycle_T = 1/30.0;
    curremt_waveHeight = self.frame.size.height*0.5;
    
    
    //初始化第一个波纹图层
    _waveLayer1 = [CAShapeLayer layer];
    _waveLayer1.fillColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:_waveLayer1];
    
    waveSpeed1 = 0.3;
    amplitude1 = 20;
    offset1_x = 0;
    
    
    //初始化第一个波纹图层
    _waveLayer2 = [CAShapeLayer layer];
    _waveLayer2.fillColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:_waveLayer2];
    
    waveSpeed2 = 0.2;
    amplitude2 = 10;
    offset2_x = 1;
    
    
    _waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    _waveDisplaylink.frameInterval = 2;
    
    [_waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
   
}

-(void)getCurrentWave:(CADisplayLink *)displayLink{
    offset1_x += waveSpeed1;
    offset2_x += waveSpeed2;
    
    curremt_waveHeight -= 0.2;
    
    [self setCurrntWaveLayerPath];
}

-(void)setCurrntWaveLayerPath{
    
    //创建一个路径
    CGMutablePathRef path =CGPathCreateMutable();
    CGFloat y = curremt_waveHeight;

    CGPathMoveToPoint(path, nil, 0, y);
    for(NSInteger x = 0.0f; x<=waveWidth;x++){
        
        y = amplitude1 * sin(cycle_T * x + offset1_x) + curremt_waveHeight;
        
        CGPathAddLineToPoint(path, nil, x, y);
        
    }
    
    CGPathAddLineToPoint(path, nil, waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    _waveLayer1.path = path;
    
    
    //创建另一个路径
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, nil, 0, y);
    for(NSInteger x = 0.0f; x<=waveWidth;x++){
        
        y = amplitude2 * sin(cycle_T * x + offset2_x) + curremt_waveHeight;
        
            CGPathAddLineToPoint(path2, nil, x, y);
        
    }
    
    CGPathAddLineToPoint(path2, nil, waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path2, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path2);
    
    _waveLayer2.path = path2;
    
    CGPathRelease(path);
    CGPathRelease(path2);
    
    
    
}

-(void)dealloc{
    [_waveDisplaylink invalidate];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
