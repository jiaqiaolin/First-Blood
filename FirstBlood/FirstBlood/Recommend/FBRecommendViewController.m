//
//  FBRecommendViewController.m
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/18.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBRecommendViewController.h"
#import "FBBaseNavigationController.h"

@interface FBRecommendViewController ()

/** 指向_UINavigationBarBackground*/
@property (nonatomic, strong) UIView *NavBarBackView;

@end

@implementation FBRecommendViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBarAndBackground];
//    [self setNavBar];
    
    [self setNavBarWithAlpha:.5 barTintColor:[UIColor whiteColor] tintColor:[UIColor yellowColor]];
    NSLog(@"V1");
    
    NSLog(@"LJJ");
}

#pragma mark - private methods
/**
 *  设置TabBarController外观和背景色
 */
- (void)setTabBarAndBackground
{
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.tabBarController.tabBar setBarTintColor:[UIColor whiteColor]];
    [self.tabBarController.tabBar setAlpha:.7];
}
/**
 *  设定NavigationBar
 */
- (void)setNavBar
{
    FBBaseNavigationController *FBBNC = (FBBaseNavigationController *)self.navigationController;
    [FBBNC setBarAlpha:.1 barTintColor:[UIColor blueColor] tintColor:nil];
}


@end
