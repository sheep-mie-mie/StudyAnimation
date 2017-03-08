# StudyAnimation
学习动画
===================================
* CABasicAnimation 基础动画 基本属性
===================================
* fromValue        动画运动的初始值 
* toValue          动画运动的结束值 (必须都为角度__注意bug)
* timingFunction   动画运行的速度属性 
* duration         动画持续时间
* repeatCount      动画持续次数  HUGE_VALF 一直循环
* transformAnima.removedOnCompletion = NO;
* transformAnima.fillMode = kCAFillModeForwards; 防止动画结束后回到初始位置


