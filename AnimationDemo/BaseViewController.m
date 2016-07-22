//
//  BaseViewController.m
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewControllerTransition.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 动画代理
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop
             ||operation == UINavigationControllerOperationPush)
    {
        ViewControllerTransition * trans = [[ViewControllerTransition alloc] init];
        trans.operation = operation;
        return trans;
    }
    
    return nil;
}


@end
