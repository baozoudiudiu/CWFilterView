//
//  CWFilterView.h
//  OpenGLFilterDemo
//
//  Created by 陈旺 on 2020/8/14.
//  Copyright © 2020 chenwang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWFilterView : UIView
@property (nonatomic, strong, readonly) UIImage   *originImage;
/// 展示图片
- (void)showImage:(UIImage *)image;
/// 上下分屏特效
- (void)splitScreenTopAndBottom:(BOOL)open;
/// 上中下分屏
- (void)splitScreenTMB:(BOOL)open;
/// 4分屏
- (void)splitScreen4:(BOOL)open;
/// 6分屏幕
- (void)splitScreen6:(BOOL)open;
/// 9分屏
- (void)splitScreen9:(BOOL)open;
/// 灰度
- (void)gray:(BOOL)open;
/// 颠倒
- (void)reversal:(BOOL)open;
/// 马赛克
- (void)mosaic:(BOOL)open;
/// 六边形马赛克
- (void)hexagonMosaic:(BOOL)open;
/// 三角形马赛克
- (void)triangularMosaic:(BOOL)open;
/// 缩放效果
- (void)scale:(BOOL)open;
/// 灵魂出窍
- (void)soulOut:(BOOL)open;
/// 抖动效果
- (void)shake:(BOOL)open;
/// 闪白
- (void)white:(BOOL)open;
/// 毛刺
- (void)glitch:(BOOL)open;
/// 幻觉效果
- (void)vertigo:(BOOL)open;
@end

NS_ASSUME_NONNULL_END
