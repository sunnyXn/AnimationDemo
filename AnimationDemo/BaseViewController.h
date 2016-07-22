//
//  BaseViewController.h
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface BaseViewController : UIViewController
<UIViewControllerTransitioningDelegate
,UINavigationControllerDelegate>

@property (nonatomic , strong) UIView * viewBg;

@end
