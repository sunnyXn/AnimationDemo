//
//  ViewControllerTransition.m
//  AnimationDemo
//
//  Created by Sunny on 16/7/21.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "ViewControllerTransition.h"


@interface ViewControllerTransition ()

@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, weak) UIViewController  *fromViewController;
@property (nonatomic, weak) UIViewController  *toViewController;
@property (nonatomic, weak) UIView            *containerView;

@end

@implementation ViewControllerTransition


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _transitionDuration = 1.5;
        _operation = UINavigationControllerOperationNone;
    }
    return self;
}

#pragma mark - 动画代理
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return _transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView      = [transitionContext containerView];
    self.transitionContext  = transitionContext;
    
    if (self.operation == UINavigationControllerOperationPush)
    {
        [self animateTransitionPush];
    }
    else if (self.operation == UINavigationControllerOperationPop)
    {
        [self animateTransitionEventPop];
    }
}

- (void)completeTransition {
    
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}


- (void)animateTransitionPush
{
    
    UIViewController * toVC = self.toViewController;
    UIViewController * fromVC = self.fromViewController;
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    
    UIImageView * viewBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"11.jpg"]];
    viewBg.frame = tempView.frame;
    
    [self.containerView addSubview:viewBg];
    [self.containerView addSubview:toVC.view];
    [self.containerView addSubview:tempView];
    
    toVC.view.alpha = 0.;
    CATransform3D transfrom = CATransform3DMakeScale(0.1, 1.0, 1.0);
    toVC.view.layer.transform = transfrom;
    
    tempView.alpha = 1.0;
    tempView.y = 0;
    
    CGFloat h = toVC.view.bounds.size.height;
    
    [UIView animateWithDuration:self.transitionDuration delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.5 options:0 animations:^{
        tempView.y -= h * 0.025;
//        tempView.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
        tempView.layer.opacity = 0.;
        
        toVC.view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
        toVC.view.alpha = 1.;
        
    } completion:^(BOOL finished) {
        [tempView removeFromSuperview];
        [self completeTransition];
    }];
}

- (void)animateTransitionEventPop
{
    UIViewController * toVC = self.toViewController;
    UIViewController * fromVC = self.fromViewController;
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    
    
    [self.containerView addSubview:toVC.view];
    [self.containerView addSubview:tempView];
    
    CGAffineTransform  transfrom = CGAffineTransformMakeScale(1.0, 1.0);
    tempView.transform = transfrom;
    tempView.alpha = 1.;
    
    toVC.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
    toVC.view.alpha = 0.1f;
    
    fromVC.view.alpha = 0.;
    
    [UIView animateWithDuration:self.transitionDuration delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.5 options:0 animations:^{
//        tempView.transform = CGAffineTransformMakeScale(0., 0.);
        CGFloat toAlpha = 0.85;
        tempView.layer.transform = CATransform3DMakeScale(toAlpha, toAlpha, toAlpha);
        tempView.layer.opacity = 0.;
//        tempView.frame = CGRectMake(tempView.centerX, tempView.centerY, 0, 0);
//        tempView.alpha = 0.;
        
        toVC.view.alpha = 1.f;
        toVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        [tempView removeFromSuperview];
        [self completeTransition];
    }];
}

@end
