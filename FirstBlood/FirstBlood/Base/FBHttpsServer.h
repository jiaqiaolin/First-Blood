//
//  FBHttpsServer.h
//  Lesson-UI-21-网络请求
//
//  Created by 林佳乔 on 16/2/29.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 封装HTTPS请求单例类

typedef void(^httpsBlock)(id result, NSURLResponse *response, NSError *error);
typedef NS_ENUM(NSInteger, httpsMethod)
{
    get,
    post
};
typedef NS_ENUM(NSInteger, httpsModel)
{
    httpsModelDefault,
    httpsModelFast
};

@interface FBHttpsServer : NSObject

+ (FBHttpsServer *)shareHttps;
- (void)connectHttpsWithUrl:(NSString *)urlString model:(httpsModel)model method:(httpsMethod)method postBody:(NSString *)body resultBlock:(httpsBlock)block;

@end
