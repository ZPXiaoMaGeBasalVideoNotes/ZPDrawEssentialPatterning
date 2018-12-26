//
//  ZPTextAndImageView.m
//  基本图形的绘制
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTextAndImageView.h"

@implementation ZPTextAndImageView

- (void)drawRect:(CGRect)rect
{
//    [self drawText];
    
    [self drawImageWithRect:rect];
}

#pragma mark ————— 画文字 —————
/**
 在View上面画文字的时候不需要获取图形上下文。
 */
-(void)drawText
{
    NSString *string = @"你好！早上好！你好！早上好！你好！早上好！你好！早上好！你好！早上好！你好！早上好！你好！早上好！你好！早上好！你好！早上好！";
    
    NSMutableDictionary *attributesDict = [NSMutableDictionary dictionary];
    
    /**
     设置文字富文本的相关属性：
     */
    
    //设置文字的颜色
    [attributesDict setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    
    //设置文字的大小
    [attributesDict setObject:[UIFont systemFontOfSize:18] forKey:NSFontAttributeName];
    
    //设置文字空心时线条的宽度
    [attributesDict setObject:[NSNumber numberWithInt:3] forKey:NSStrokeWidthAttributeName];
    
    /**
     设置文字空心时线条的颜色：
     当设置空心时文字线条的颜色的时候就会把上面撰写的设置文字的颜色那条语句给盖掉了。
     */
    [attributesDict setObject:[UIColor yellowColor] forKey:NSStrokeColorAttributeName];
    
    
    //创建并设置阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blueColor];  //设置阴影颜色
    shadow.shadowOffset = CGSizeMake(10, 10);  //设置阴影偏移量
    shadow.shadowBlurRadius = 3;  //设置阴影模糊度
    
    //设置文字的阴影
    [attributesDict setObject:shadow forKey:NSShadowAttributeName];
    
    /**
     把文字画到View上面：
     如果使用下面的"drawAtPoint:"方法的话，文字不会自动换行。
     */
//    [string drawAtPoint:CGPointZero withAttributes:attributesDict];
    
    /**
     把文字画到设定好的矩形框内：
     如果使用如下的"drawInRect:"方法的话，文字会自动换行。
     */
    [string drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:attributesDict];
}

#pragma mark ————— 画图片 —————
/**
 在View上面画图片的时候不需要获取图形上下文。
 */
-(void)drawImageWithRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"aaa"];
    
    /**
     使用如下方法绘制图片的话在这个View上只会显示图片其中的一部分，不能显示完整的图片；
     图片会有伸缩。
     */
//    [image drawAtPoint:CGPointZero];
    
    /**
     使用如下方法并且传入的参数是这个View的尺寸的话则图片会完整的铺满这个View；
     图片会有伸缩。
     */
//    [image drawInRect:rect];
    
    /**
     在设定的矩形框内绘制图片，并且图片完整的填充这个矩形框；
     图片会等比例的伸缩。
     */
//    [image drawInRect:CGRectMake(50, 50, 200, 200)];
    
    /**
     设定一个矩形范围，超过这个矩形范围的图片都被裁减掉；
     这条裁剪语句要写在绘制图片语句之前才管用，要是写在后面的话就不起作用。
     */
//    UIRectClip(CGRectMake(0, 0, 50, 50));
    
    /**
     在设定的矩形范围内（这里是这个View）内平铺图片；
     图片会等比例的伸缩。
     */
    UIImage *image1 = [UIImage imageNamed:@"bbb"];
    [image1 drawAsPatternInRect:rect];
    
    //在图片的某个位置上添加水印：
    NSString *watermark = @"某某所画";
    [watermark drawInRect:CGRectMake(0, 180, 100, 30) withAttributes:nil];
}

@end
