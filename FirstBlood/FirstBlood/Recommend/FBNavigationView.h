//
//  FBNavigationView.h
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/19.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBNavigationView : UIView

/** 标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/** Left Item*/
@property (nonatomic, strong) UIButton *leftButton;
/** Right Item*/
@property (nonatomic, strong) UIButton *rightButton;

@end
