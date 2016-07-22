//
//  PushViewController.m
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()



@property (nonatomic , strong) UIView * contentView;

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self.view addSubview:self.contentView];
    
    NSLog(@"backColor:%@  content:%@",self.view.backgroundColor, self.contentView.backgroundColor);
//    self.view.layer.shouldRasterize = YES;
//    self.view.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    self.view.backgroundColor = [UIColor grayColor];
//    [UIView animateWithDuration:1.f animations:^{
//        self.view.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.615];
//    }];
}

- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.frame = self.view.frame;
        _contentView.backgroundColor = [UIColor clearColor];
        
        
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(20, 20, 30, 30);
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backBtn setTitle:@"<" forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:backBtn];
        
        UILabel * labTitle = [[UILabel alloc] init];
        labTitle.frame = CGRectMake(0, 25, 100, 30);
        labTitle.text = @"登录";
        labTitle.textAlignment = NSTextAlignmentCenter;
        labTitle.textColor = [UIColor whiteColor];
        labTitle.centerX = self.view.centerX;
        [_contentView addSubview:labTitle];
        
        
        for (int i = 0 ; i < 2; i ++)
        {
            UITextField * tf = [[UITextField alloc] init];
            tf.frame = CGRectMake(0, 80 + (i * 60), 200, 50);
            tf.centerX = self.view.centerX;
            tf.placeholder = @"ajwhdakjwdhakjwhd";
            tf.borderStyle = UITextBorderStyleRoundedRect;
            [_contentView addSubview:tf];
        }
        
        
        for ( int i = 0  ; i < 4 ; i ++)
        {
            UILabel *  lab = [[UILabel alloc] init];
            lab.frame = CGRectMake(0, 200 + (i * 40), 200, 30);
            lab.text = [NSString stringWithFormat:@"这是第几个%d",i];
            if (i == 1)
            {
                lab.backgroundColor = [UIColor clearColor];
                lab.layer.masksToBounds = YES;
                lab.layer.borderColor = [UIColor whiteColor].CGColor;
                lab.layer.borderWidth = 1.f;
            }
            lab.textAlignment = NSTextAlignmentCenter;
            lab.centerX = self.view.centerX;
            [_contentView addSubview:lab];
        }
//        
    }
    return _contentView;
}

- (void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
