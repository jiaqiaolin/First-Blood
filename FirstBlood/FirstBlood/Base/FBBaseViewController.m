//
//  FBBaseViewController.m
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/18.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBBaseViewController.h"
#import "FBBaseNavigationController.h"

@interface FBBaseViewController ()

@end

@implementation FBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setNavBarWithAlpha:(CGFloat)alpha barTintColor:(UIColor *)barTintColor tintColor:(UIColor *)tintColor
{
    FBBaseNavigationController *FBBNC = (FBBaseNavigationController *)self.navigationController;
    [FBBNC setBarAlpha:alpha barTintColor:barTintColor tintColor:tintColor];
}
@end
