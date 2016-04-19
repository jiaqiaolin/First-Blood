//
//  HttpsServer.m
//  Lesson-UI-21-网络请求
//
//  Created by 林佳乔 on 16/2/29.
//  Copyright © 2016年 林佳乔. All rights reserved.
//

#import "FBHttpsServer.h"

FBHttpsServer *_httpsServer = nil;

@implementation FBHttpsServer

static dispatch_once_t onceToken;
+ (FBHttpsServer *)shareHttps
{
    dispatch_once(&onceToken, ^{
        _httpsServer = [[self alloc] init];
    });
    return _httpsServer;
}

- (void)connectHttpsWithUrl:(NSString *)urlString model:(httpsModel)model method:(httpsMethod)method postBody:(NSString *)body resultBlock:(httpsBlock)block
{
    NSURLSession *session = nil;
    //判断配置类型
    if (model == httpsModelFast)
    {
       session =  [self creatFastModelSessionWithNothing];
    }
    else
    {
        session = [NSURLSession sharedSession];
    }
    
    NSString *encodeStr = [urlString stringByRemovingPercentEncoding];
    NSURL *url = [NSURL URLWithString:encodeStr];
    
    //判断请求类型
    NSURLSessionTask *task = nil;
    if (method == post)
    {
        NSMutableURLRequest *mutableUrlRequest = [NSMutableURLRequest requestWithURL:url];
        [mutableUrlRequest setHTTPMethod:@"POST"];
        [mutableUrlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        task = [session dataTaskWithRequest:mutableUrlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data)
            {
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (result)
                {
                    NSLog(@"JSON数据不为空");
                    block(result,response,error);
                }
                else
                {
                    NSLog(@"JSON result 为空,返回data");
                    block(data,response,error);
                }
                //                NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
            else
            {
                NSLog(@"请求失败");
                block(nil,response,error);
            }
        }];
    }
    else
    {
        task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data)
            {
//                NSLog(@"data = %@",data);
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (result)
                {
                    NSLog(@"get JSON数据不为空");
                    block(result,response,error);
                }
                else
                {
                    NSLog(@"get JSON result 为空,返回data");
                    block(data,response,error);
                }
//                NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"data result = %@",data);
            }
            else
            {
                NSLog(@"请求失败");
                block(nil,response,error);
            }
        }];
    }
    [task resume];
}
//可自己添加参数
- (NSURLSession *)creatFastModelSessionWithNothing
{
    //创建一个session配置对象(可不写,会有默认值)
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    //设置请求超时时间,默认60秒
    [sessionConfig setTimeoutIntervalForRequest:10];
    //设置服务器返回数据超时时间
    [sessionConfig setTimeoutIntervalForResource:10];
    //设置缓存策略
    //如果本地有缓存,就使用缓存数据,如果没有,进行网络请求
    [sessionConfig setRequestCachePolicy:NSURLRequestUseProtocolCachePolicy];
    //是否允许蜂窝网络请求
    [sessionConfig setAllowsCellularAccess:YES];
    //是否在合适的时机进行网络请求(有WI-FI&&电量充足时,一般使用在后台网络请求使用,比如地图定位)
    [sessionConfig setDiscretionary:YES];
    //利用session配置创建一个对象
   NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    return session;
}

@end
