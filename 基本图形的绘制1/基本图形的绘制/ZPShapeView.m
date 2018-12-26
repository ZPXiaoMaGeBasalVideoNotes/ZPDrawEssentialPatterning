//
//  ZPShapeView.m
//  基本图形的绘制
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPShapeView.h"

@implementation ZPShapeView

- (void)drawRect:(CGRect)rect
{
    [self drawTriangle];
    
//    [self drawRectangle];
    
//    [self drawRoundedRectWithBezierPath];
}

#pragma mark ————— 绘制三角形 —————
-(void)drawTriangle
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //绘制三角形：
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 80);
    
    //关闭路径（连接起点和最后一个点）：
    CGContextClosePath(context);
    
    //设置路径颜色：
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    
    //渲染图形上下文（空心的）：
    CGContextStrokePath(context);
    
    //渲染图形上下文（实心的）：
//    CGContextFillPath(context);
}

#pragma mark ————— 绘制矩形 —————
-(void)drawRectangle
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //绘制矩形：
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    
    //设置实心颜色：
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    
    //等同于上面的代码
//    [[UIColor blueColor] setFill];
    
    //渲染图形上下文（实心的）：
    CGContextFillPath(context);
}

#pragma mark ————— 用贝塞尔路径来绘制圆角矩形 —————
- (void)drawRoundedRectWithBezierPath
{
    //创建贝塞尔路径：
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) cornerRadius:20];
    
    //绘制路径
    [path stroke];
    
    /**
     必须是一个完整的封闭路径才能够填充了；
     如果不是封闭的路径，使用"fill"方法，默认会自动关闭路径，然后进行填充。
     */
    [path fill];
}

@end
