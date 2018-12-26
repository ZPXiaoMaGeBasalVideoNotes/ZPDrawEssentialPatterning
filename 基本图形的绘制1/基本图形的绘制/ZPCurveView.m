//
//  ZPCurveView.m
//  基本图形的绘制
//
//  Created by 赵鹏 on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ZPCurveView.h"

@implementation ZPCurveView

- (void)drawRect:(CGRect)rect
{
    [self drawCurve];
}

#pragma mark ————— 绘制曲线 —————
- (void)drawCurve
{
    //获取图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     设置曲线的起点：
     "CGContextMoveToPoint"函数在底层已经封装好了一个路径，并且也已经把这个路径添加到了图形上下文中了。
     */
    CGContextMoveToPoint(context, 50, 50);
    
    /**
     设置曲线的终点：
     曲线有一个控制点，位于曲线的上方或下方，用来控制曲线弧度大小的；
     函数的第二个和第三个参数就是用来确定控制点的位置的。
     */
    CGContextAddQuadCurveToPoint(context, 150, 20, 250, 50);
    
    //渲染图形上下文
    CGContextStrokePath(context);
}

@end
