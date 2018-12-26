//
//  ZPCircleView.m
//  基本图形的绘制
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPCircleView.h"

@implementation ZPCircleView

- (void)drawRect:(CGRect)rect
{
//    [self drawEllipse];
    
//    [self drawAnnulus];
    
//    [self drawCircleWithBezierPath];
    
//    [self drawArc];
    
//    [self drawArcWithBezierPath];
    
    [self drawQuarterCircle];
}

#pragma mark ————— 绘制椭圆形 —————
-(void)drawEllipse
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设定一个矩形框，在矩形框内画圆或者椭圆：
    CGContextAddEllipseInRect(context, CGRectMake(50, 10, 100, 50));
    
    //渲染图形上下文（实心的）：
    CGContextFillPath(context);
}

#pragma mark ————— 绘制圆环 —————
-(void)drawAnnulus
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设定一个矩形框，在矩形框内画圆或者椭圆：
    CGContextAddEllipseInRect(context, CGRectMake(50, 10, 100, 100));
    
    //设置圆环的宽度：
    CGContextSetLineWidth(context, 10);
    
    //渲染图形上下文（空心的）：
    CGContextStrokePath(context);
}

#pragma mark ————— 用贝塞尔路径绘制圆 —————
- (void)drawCircleWithBezierPath
{
    /**
     center参数：圆心的位置；
     radius参数：半径；
     startAngle参数：起始弧度；
     endAngle参数：结束弧度；
     clockwise参数：旋转方向，YES代表顺时针，NO代表逆时针。
     */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    //绘制路径：
    [path stroke];
}

#pragma mark ————— 绘制圆弧 —————
-(void)drawArc
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     绘制圆弧：
     x,y参数：圆弧的圆心；
     radius参数：圆弧的半径；
     startAngle参数：圆弧的起始角度（水平向右的方向为0度）；
     endAngle参数：圆弧的结束角度（不管是顺时针画圆还是逆时针画圆，都以顺时针方向为标准算圆弧的结束角度）；
     clockwise参数：画圆弧的方向（0：顺时针画，1：逆时针画）。
     */
    CGContextAddArc(context, 100, 100, 50, 0, M_PI_2, 0);
    
    //渲染图形上下文（空心的）：
    CGContextStrokePath(context);
}

#pragma mark ————— 用贝塞尔路径绘制圆弧 —————
- (void)drawArcWithBezierPath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    [path stroke];
}

#pragma mark ————— 绘制实心四分之一圆 —————
-(void)drawQuarterCircle
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //绘制四分之一圆：
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 100, 150);
    CGContextAddArc(context, 100, 100, 50, M_PI_2, M_PI, 0);
    
    CGContextClosePath(context);
    
    //设置图像的颜色：
    [[UIColor redColor] set];
    
    //渲染图形上下文（实心的）：
    CGContextFillPath(context);
}



@end
