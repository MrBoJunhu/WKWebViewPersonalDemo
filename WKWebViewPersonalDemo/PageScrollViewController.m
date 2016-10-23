//
//  PageScrollViewController.m
//  WKWebViewPersonalDemo
//
//  Created by bill on 16/9/26.
//  Copyright © 2016年 bill. All rights reserved.
//

#import "PageScrollViewController.h"

@interface PageScrollViewController ()<UIScrollViewDelegate>


@property (nonatomic, assign) BOOL isFirst;

@end



@implementation PageScrollViewController


- (NSArray *)titleArray {
    
    if (!_titleArray) {
        
        self.titleArray = [NSArray array];
        
    }
    
    return _titleArray;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];

    [self configuraiton];
    
    [self createUI];
    
}

- (void)configuraiton {
    
    _buttonOriganlColor = [UIColor blueColor];
    
    _buttonSelectedColor = [UIColor redColor];
    
    _buttonWidth = 100;
    
    _buttonHeight = 40;
    
    _buttonSpace_X = 5;
    
    _scrollLBWidth = _buttonWidth;
    
    _scrollLBOriginalColor = _buttonSelectedColor;
    
    _scrollLBHeight = 2;
    
    _titleArray = @[@"按钮1", @"按钮2", @"按钮3", @"按钮4", @"按钮5", @"按钮6", @"按钮7", @"按钮8", @"按钮9", @"按钮10", @"按钮11"];
    
    _buttonOriginalFontSize = 15;
    
    _buttonSelectedFontSize = 18;
    
}


- (void)createUI{
    
    [self createButtonBackView];
    
}

- (void)createButtonBackView {
    
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    
    _buttonBackView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, screen_W, _buttonHeight + 2 * _buttonSpace_Y)];
    
    _buttonBackView.backgroundColor = [UIColor lightGrayColor];
    
    _buttonBackView.contentSize = CGSizeMake((_buttonWidth + 2 * _buttonSpace_X) * _titleArray.count, _buttonBackView.frame.size.height);
    
    _buttonBackView.showsVerticalScrollIndicator = NO;
    
    _buttonBackView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_buttonBackView];
    
    [self creatButtonUI];
    
    [self createBottomScrollView];

}

- (void)createScrollLB {
    
    _scrollLB = [[UILabel alloc] initWithFrame:CGRectMake(0, _buttonBackView.frame.size.height - _scrollLBHeight, _scrollLBWidth, _scrollLBHeight)];
    
    _scrollLB.backgroundColor = _buttonSelectedColor;
    
    [_buttonBackView addSubview:_scrollLB];
    
}

- (void)creatButtonUI {
   
    for (int i = 0; i < _titleArray.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake((_buttonSpace_X + _buttonWidth) * i, _buttonSpace_Y,_buttonWidth, _buttonHeight);
        
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:_buttonOriginalFontSize];
        
        [btn setTitleColor:_buttonOriganlColor forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = 100 + i;
        
        if (i == 0) {
            
            [btn setTitleColor:_buttonSelectedColor forState:UIControlStateNormal];
           
            btn.titleLabel.font = [UIFont systemFontOfSize:_buttonSelectedFontSize];

            
        }
        
        [self.buttonBackView addSubview:btn];
    }
    [self createScrollLB];

    
}

- (void)clickButtonAction:(UIButton *)sender {
    
    for (id btn in _buttonBackView.subviews) {
        
        if ([btn isKindOfClass:[UIButton class]]) {
        
            UIButton *tempBtn = (UIButton *)btn;
            
            if (tempBtn.tag == sender.tag) {
                
                [btn setTitleColor:_buttonSelectedColor forState:UIControlStateNormal];
                
                tempBtn.titleLabel.font = [UIFont systemFontOfSize:_buttonSelectedFontSize];
                
            }else{
                
                [btn setTitleColor:_buttonOriganlColor forState:UIControlStateNormal];
                
                tempBtn.titleLabel.font = [UIFont systemFontOfSize:_buttonOriginalFontSize];

                
            }
            
        }
        
    }
    
    CGPoint buttonP = sender.center;
    
    CGFloat point_x = buttonP.x;
    
    CGFloat point_y = _scrollLB.center.y;
    
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    
    [UIView animateWithDuration:0.2 animations:^{
       
        _scrollLB.center = CGPointMake(point_x, point_y);
        
        [_bottomScrollView setContentOffset:CGPointMake(screen_W * (sender.tag - 100), 0) animated:YES];
        
    }];
    
    if (sender.tag > 101) {
        
        [_buttonBackView setContentOffset:CGPointMake((_buttonWidth + 2 * _buttonSpace_X) * (sender.tag - 102), 0) animated:YES];
        
    }else{

        [_buttonBackView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
}

#pragma mark - bottom scrollview
- (void)createBottomScrollView {
    
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    
    _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonBackView.frame), screen_W, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(_buttonBackView.frame))];
    
    _buttonBackView.backgroundColor = [UIColor lightGrayColor];
    
    _bottomScrollView.contentSize = CGSizeMake(screen_W * _titleArray.count, _bottomScrollView.frame.size.height);
    
    _bottomScrollView.pagingEnabled = YES;
    
    _bottomScrollView.delegate = self;
    
    [self.view addSubview:_bottomScrollView];
    
    [self createTableView];
    
}

- (void)createTableView {
    
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    
    for (int i = 0 ; i  < _titleArray.count; i ++) {
        
        UITableView *tbv = [[UITableView alloc] initWithFrame:CGRectMake(screen_W * i, 0, screen_W, self.view.frame.size.height) style:UITableViewStylePlain];
        
//        tbv.delegate = self;
        
//        tbv.dataSource = self;
        
        tbv.tag = 200 + i;
        
        if (i % 2 == 0) {
            tbv.backgroundColor = [UIColor whiteColor];
        }else{
            tbv.backgroundColor = [UIColor cyanColor];
        }
        
        [_bottomScrollView addSubview:tbv];
    }
    
}


#pragma mark - UIScrollviewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   
    CGFloat screen_W = [UIScreen mainScreen].bounds.size.width;
    
    if (scrollView == _bottomScrollView) {
        
        
        CGPoint offset = _bottomScrollView.contentOffset;
        
        NSInteger tag = offset.x / screen_W;
        
        NSLog(@"%ld", (long)tag);
        
        UIButton *tempButton = [self.view viewWithTag:100 + tag ];
        
        [self clickButtonAction:tempButton];
        
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
