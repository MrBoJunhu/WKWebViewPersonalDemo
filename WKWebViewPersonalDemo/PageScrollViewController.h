//
//  PageScrollViewController.h
//  WKWebViewPersonalDemo
//
//  Created by bill on 16/9/26.
//  Copyright © 2016年 bill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollViewController : UIViewController
/**
 *  滚动按钮的标题
 */
@property (nonatomic, strong) NSArray *titleArray;
/**
 *  按钮文字默认颜色
 */
@property (nonatomic, strong) UIColor *buttonOriganlColor;
/**
 *  按钮选中时的样色
 */
@property (nonatomic, strong) UIColor *buttonSelectedColor;
/**
 *  按钮组底部滚动视图
 */
@property (nonatomic, strong) UIScrollView *buttonBackView;
/**
 *  水平滚动条的颜色
 */
@property (nonatomic, strong) UILabel *scrollLB;
/**
 *  按钮的宽度
 */
@property (nonatomic, assign) CGFloat buttonWidth;
/**
 *  按钮的高度
 */
@property (nonatomic, assign) CGFloat buttonHeight;
/**
 *  按钮间的水平间距
 */
@property (nonatomic, assign) CGFloat buttonSpace_X;
/**
 *  按钮上下的间距
 */
@property (nonatomic, assign) CGFloat buttonSpace_Y;
/**
 *  按钮默认字体大小
 */
@property (nonatomic, assign) CGFloat buttonOriginalFontSize;
/**
 *  按钮选中时的字体大小
 */
@property (nonatomic, assign) CGFloat buttonSelectedFontSize;
/**
 *  自定义滚动条的宽度
 */
@property (nonatomic, assign) CGFloat scrollLBWidth;
/**
 *  自定义滚动条的高度
 */
@property (nonatomic, assign) CGFloat scrollLBHeight;
/**
 *  滚动条的颜色 默认与按钮选中时候的颜色一致
 */
@property (nonatomic, strong) UIColor *scrollLBOriginalColor;
/**
 *  展示数据的底层滚动视图
 */
@property (nonatomic, strong) UIScrollView *bottomScrollView;


- (void)clickButtonAction:(UIButton *)sender;

- (void)configuraiton;

@end
