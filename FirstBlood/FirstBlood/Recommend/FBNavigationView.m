//
//  FBNavigationView.m
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/19.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBNavigationView.h"

@implementation FBNavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setText:@"初味"];
        [self addSubview:self.titleLabel];
        [self.titleLabel setCenter:self.center];
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.leftButton.titleLabel setText:@"北京"];
        [self addSubview:self.leftButton];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightButton.titleLabel setText:@"铃铛"];
        [self addSubview:self.rightButton];
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    
    
    
}

@end
