//
//  ViewController.m
//  学习动画
//
//  Created by ifly on 2017/3/6.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "ViewController.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

@interface ViewController ()

/**
 圆形Layer
 */
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //动画
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 200, 200)];
    imageView.image = [UIImage imageNamed:@"Image"];
    [self.view addSubview:imageView];
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    transformAnima.fromValue = @(0);
    transformAnima.toValue = @(M_PI * 2);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 20.0f;
    animaGroup.repeatCount = HUGE_VALF;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[transformAnima];
    [imageView.layer addAnimation:animaGroup forKey:@"Animation"];
    
    
    //动画二 转动的风扇
    UIView *shanView = [[UIView alloc] initWithFrame:CGRectMake(220, 40, 200, 200)];
    //shanView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:shanView];
    //棍
    UIView *gunView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 120)];
    gunView.backgroundColor = [UIColor blackColor];
    [shanView addSubview:gunView];
    gunView.center = CGPointMake(shanView.bounds.size.width/2, shanView.bounds.size.height - shanView.bounds.size.height / 4 + 8);
    
    //扇叶一
    UIView *shanOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 160)];
    shanOne.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2);
    [shanView addSubview:shanOne];
    UIImageView *imageOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 20, 80)];
    [shanOne addSubview:imageOne];
    imageOne.image = [UIImage imageNamed:@"WindSpeed"];
    imageOne.contentMode = UIViewContentModeScaleAspectFit;
    [shanOne addSubview:imageOne];
    //imageOne.transform = CGAffineTransformRotate(imageOne.transform, M_PI/180.f*120);
    
    //扇叶二
    UIView *shanTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 160)];
    shanTwo.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2);
    [shanView addSubview:shanTwo];
    UIImageView *imageTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 20, 80)];
    [shanTwo addSubview:imageTwo];
    imageTwo.image = [UIImage imageNamed:@"WindSpeed"];
    imageTwo.contentMode = UIViewContentModeScaleAspectFit;
    [shanTwo addSubview:imageTwo];
    shanTwo.transform = CGAffineTransformRotate(shanTwo.transform, M_PI/180.f*120);
    
    //扇叶三
    UIView *shanThree = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 160)];
    shanThree.center = CGPointMake(shanView.bounds.size.width / 2, shanView.bounds.size.height / 2);
    [shanView addSubview:shanThree];
    UIImageView *imageThree = [[UIImageView alloc] initWithFrame:CGRectMake(0, 12, 20, 80)];
    [shanThree addSubview:imageThree];
    imageThree.image = [UIImage imageNamed:@"WindSpeed"];
    imageThree.contentMode = UIViewContentModeScaleAspectFit;
    [shanThree addSubview:imageThree];
    shanThree.transform = CGAffineTransformRotate(shanThree.transform, M_PI/180.f*240);
    
    
    //动画
    CABasicAnimation *posttionAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnima.fromValue = @(0);
    posttionAnima.toValue   = @(M_PI / 3 * 2);
    posttionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnima.duration = 3.0f;
    posttionAnima.repeatCount = HUGE_VALF;
    posttionAnima.fillMode = kCAFillModeForwards;
    posttionAnima.removedOnCompletion = NO;
    [shanOne.layer addAnimation:posttionAnima forKey:@"shanOne"];
    
    CABasicAnimation *posttionAnimaTwo = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnimaTwo.fromValue = @(M_PI / 3 * 2);
    posttionAnimaTwo.toValue   = @(M_PI / 3 * 4);
    posttionAnimaTwo.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnimaTwo.duration = 3.0f;
    posttionAnimaTwo.repeatCount = HUGE_VALF;
    posttionAnimaTwo.fillMode = kCAFillModeForwards;
    posttionAnimaTwo.removedOnCompletion = NO;
    [shanTwo.layer addAnimation:posttionAnimaTwo forKey:@"shanTwo"];

    CABasicAnimation *posttionAnimaThree = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    posttionAnimaThree.fromValue = @(M_PI / 3 * 4);
    posttionAnimaThree.toValue   = @(M_PI / 3 * 6);
    posttionAnimaThree.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    posttionAnimaThree.duration = 3.0f;
    posttionAnimaThree.repeatCount = HUGE_VALF;
    posttionAnimaThree.fillMode = kCAFillModeForwards;
    posttionAnimaThree.removedOnCompletion = NO;
    [shanThree.layer addAnimation:posttionAnimaThree forKey:@"posttionAnimaThree"];
    
    
    //湿度 贝塞尔曲线 240
    UIView *circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 250, 200, 200)];
    circleView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:circleView];
    
    CGFloat lineWidth = 1.f;
    CGSize size = circleView.bounds.size;
    CGFloat radius = size.width / 2.f - lineWidth / 2.f;
    //选装方向
    BOOL clockWise = YES;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    startAngle = -RADIAN(180 - startAngle);
    endAngle = RADIAN(180 + startAngle);
    //创建贝塞尔曲线
    UIBezierPath *circlePath \
    = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height / 2.f, size.width / 2.f)
                                     radius:radius
                                 startAngle:startAngle
                                   endAngle:endAngle
                                  clockwise:clockWise];
    //获取path
    self.circleLayer.path = circlePath.CGPath;
    //设置颜色
    self.circleLayer.strokeColor = [UIColor blackColor].CGColor;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.strokeEnd = 0.f;
    
    //关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"strokeEnd";
    keyAnimation.duration = 5.f;
    
    //计算设置关键帧
    //设置帧数
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:30];
    //计算并存储
    CGFloat t = 0.0;
    CGFloat dt = 1.0 / 29;
    CGFloat fromValue = 30.f;
    for (size_t frame = 0; frame<fromValue; ++frame, t += dt) {
        //此处更加不同的函数计算出不同的值达到不同的效果
        
        CGFloat number = [self cubicEaseInOut:t];
        
        CGFloat value = fromValue + number * (0.75 - self.circleLayer.strokeEnd);
        
        [values addObject:@(value)];
    }
    keyAnimation.values = values;
    
    self.circleLayer.strokeEnd = 0.75;
    [self.circleLayer addAnimation:keyAnimation forKey:nil];

    [circleView.layer addSublayer:self.circleLayer];
    
    //画矩形
    UIColor *color = [UIColor redColor];
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    [path moveToPoint:CGPointMake(200.0, 50.0)];//起点
    
    // Draw the lines
    [path addLineToPoint:CGPointMake(300.0, 100.0)];
    [path addLineToPoint:CGPointMake(260, 200)];
    [path addLineToPoint:CGPointMake(100.0, 200)];
    [path addLineToPoint:CGPointMake(100, 70.0)];
    [path closePath];//第五条线通过调用closePath方法得到的
    
    //    [path stroke];//Draws line 根据坐标点连线
    [path fill];//颜色填充
    
    
    
    //创建折线
    //创建一个路劲对象
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //起点
    [linePath moveToPoint:CGPointMake(440, 20)];
    //其他点
    [linePath addLineToPoint:CGPointMake(540, 160)];
    [linePath addLineToPoint:CGPointMake(500, 100)];
    //设置路劲画布
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = CGRectMake(0, 430, 300, 300);
    //lineLayer.position =
    lineLayer.lineWidth = 2.0f;
    lineLayer.strokeColor =[UIColor orangeColor].CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = nil;
    
    [self.view.layer addSublayer:lineLayer];
}

- (CGFloat)cubicEaseInOut:(CGFloat)number {
    
    if (number < 0.5) {
        return 4 * number * number * number;
    } else {
        CGFloat f = ((2 * number) - 2);
        return 0.5 * f * f * f;
    }
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
