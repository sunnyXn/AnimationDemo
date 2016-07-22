//
//  ViewController.m
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) UIImageView * imageView;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = self.view.frame;
    self.imageView.image = [UIImage imageNamed:@"11.jpg"];
    [self.view addSubview:self.imageView];
    
    
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 50, screenW, 50);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"($￥!) StoreHoust";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击就送123456？" forState:UIControlStateNormal];
    btn.frame = CGRectMake((screenW - 200)/2.0, screenH - 100, 200, 50);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(PushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)PushAction:(id)sender
{
    PushViewController * pc = [PushViewController new];
    
    [self.navigationController pushViewController:pc animated:YES];
}


@end
