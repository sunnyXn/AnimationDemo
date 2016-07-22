//
//  ViewControllerTransition.h
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"


@interface ViewControllerTransition : NSObject
<UIViewControllerAnimatedTransitioning>


@property (nonatomic , assign) NSTimeInterval  transitionDuration;
@property (nonatomic , assign) UINavigationControllerOperation operation;


@end
