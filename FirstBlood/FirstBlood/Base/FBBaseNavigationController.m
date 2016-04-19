//
//  FBBaseNavigationController.m
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/18.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBBaseNavigationController.h"

@interface FBBaseNavigationController ()
/** 指向_UINavigationBarBackground*/
@property (nonatomic, strong) UIView *NavBarBackView;
@end

@implementation FBBaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
}

/**
 *  设置NavigationBar透明度和颜色
 */
- (void)setNavBar
{
    for (UIView *view in self.navigationBar.subviews)
    {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            self.NavBarBackView = view;
            break;
        }
    }
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
}

- (void)setBarAlpha:(CGFloat)alpha barTintColor:(UIColor *)BarTintColor tintColor:(UIColor *)tintColor
{
    self.NavBarBackView.alpha = alpha;
    self.navigationBar.barTintColor = BarTintColor;
    self.navigationBar.tintColor = tintColor;
}



@end
