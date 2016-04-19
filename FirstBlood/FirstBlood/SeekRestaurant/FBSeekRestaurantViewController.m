//
//  FBSeekRestaurantViewController.m
//  FirstBlood
//
//  Created by 林佳乔 on 16/4/18.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBSeekRestaurantViewController.h"
#import "FBBaseNavigationController.h"
@interface FBSeekRestaurantViewController ()
/** abc*/
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation FBSeekRestaurantViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNavBarWithAlpha:.8 barTintColor:[UIColor whiteColor] tintColor:[UIColor yellowColor]];

    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        [self setNavBarWithAlpha:arc4random()%1000/1000. barTintColor:FB_RANDOM_COLOR tintColor:FB_RANDOM_COLOR];
    });
    self.timer = timer;
    dispatch_resume(timer);
    
}



#pragma mark - <UITableViewDelegate>

#pragma mark - <UITableViewDataSource>

#pragma mark - Private methods


@end
