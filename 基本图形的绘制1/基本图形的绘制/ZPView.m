//
//  ZPView.m
//  基本图形的绘制
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 Quartz2D是一个二维绘图引擎，同时支持iOS和Mac系统；
 Quartz2D的API是纯C语言的；
 Quartz2D的API来源于Core Graphics框架，所以数据类型和函数基本都是以CG作为前缀的；
 
 图形上下文(Graphics Context)：可以把图形上下文看成是一个画板，以后所绘制的内容都将画在这个画板上；
 图形上下文的作用：
 1、保存绘图信息、绘图状态；
 2、决定绘制的输出目标（绘制到什么地方去）。
 
 相同的一套绘图序列，指定不同的图形上下文，就可将相同的图像绘制到不同的目标上；
 Quartz2D提供了以下几种类型的图形上下文：
 1、Bitmap Graphics Context（位图上下文）；
 2、PDF Graphics Context；
 3、Window Graphics Context；
 4、Layer Graphics Context；
 5、Printer Graphics Context；
 使用上述中的哪种图形上下文，图片就会绘制到哪种目标上面。
 
 在一个View上面画图的步骤：
 1、创建一个UIView类的子类；
 2、在新创建的类里面按照如下的步骤重写"drawRect:"方法：
 （1）取得跟当前的view相关联的系统已经创建好的图形上下文；
 （2）绘制相应的图形内容（描述路径）；
 （3）把路径添加到图形上下文中；
 （4）渲染图形上下文。
 */
#import "ZPView.h"

@implementation ZPView

/**
 在这个方法中绘制图形。因为只有这个方法才能获取到跟当前的view的layer相关联的图形上下文，其他方法则获取不到；
 方法中的rect参数为当前控件的bounds；
 
 这个方法在如下的情况下才会被调用了：
 1、当这个view第一次显示到屏幕上（被加到UIWindow上显示出来）的时候；
 2、当调用这个view的"setNeedsDisplay"方法的时候；
 3、当调用这个view的"setNeedsDisplayInRect:"方法的时候。
 */
- (void)drawRect:(CGRect)rect
{
//    [self drawStraightLine];
    
//    [self drawStraightLine1];
    
//    [self drawStraightWithBezierPath];
    
    [self setupWireProperty];
    
}

#pragma mark ————— 绘制直线 —————
//按照上述的“在一个View上面画图的步骤”来撰写这个方法。
- (void)drawStraightLine
{
    /**
     1、取得跟当前的view相关联的系统已经创建好的图形上下文：
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     2、绘制相应的图形内容（描述路径）：
     */
    
    //创建路径：
    CGMutablePathRef path = CGPathCreateMutable();
    
    //设置路径的起点：
    CGPathMoveToPoint(path, NULL, 50, 50);
    
    //设置路径的终点：
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    /**
     3、把路径添加到图形上下文中：
     */
    CGContextAddPath(context, path);
    
    /**
     4、渲染图形上下文：
     */
    CGContextStrokePath(context);
}

#pragma mark ————— 绘制直线的另一种方法 —————
- (void)drawStraightLine1
{
    //获取图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     "CGContextMoveToPoint"函数在底层已经封装好了一个路径，并且也已经把这个路径添加到了图形上下文中了；
     这一语句相当于"drawStraightLine"方法中的“创建路径”、“设置路径的起点”和“把路径添加到图形上下文中”三步。
     */
    CGContextMoveToPoint(context, 50, 50);
    
    //设置路径的终点
    CGContextAddLineToPoint(context, 200, 200);
    
    //渲染图形上下文
    CGContextStrokePath(context);
}

#pragma mark ————— 用贝塞尔路径来绘制直线 —————
- (void)drawStraightWithBezierPath
{
    //创建贝塞尔路径：
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起点：
    [path moveToPoint:CGPointMake(50, 50)];
    
    //设置终点：
    [path addLineToPoint:CGPointMake(200, 200)];
    
    //绘制路径
    [path stroke];
}

#pragma mark ————— 设置线的属性 —————
- (void)setupWireProperty
{
    //获取图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     设置线宽：
     一定要写在渲染代码之前，不然不管用。
     */
    CGContextSetLineWidth(context, 10);
    
    //设置线的头尾部的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //设置线的转折点的样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    //设置路径的起点
    CGContextMoveToPoint(context, 10, 10);
    
    //设置路径的终点
    CGContextAddLineToPoint(context, 100, 100);
    
    //设置路径的颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    //等同于上面的代码
//    [[UIColor redColor] set];
    
    //渲染路径
    CGContextStrokePath(context);
    
    //设置新路径的起点
    CGContextMoveToPoint(context, 180, 100);
    
    //设置新路径的中间点
    CGContextAddLineToPoint(context, 150, 40);
    
    //设置新路径的终点
    CGContextAddLineToPoint(context, 120, 60);
    
    //设置新路径的颜色
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    
    //渲染新路径
    CGContextStrokePath(context);
}

@end
