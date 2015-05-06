//
//  IAService.m
//  NSInstaApp
//
//  Created by Ariel Robles on 5/5/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "IAService.h"
#import "IAUtility.h"
#import "InstaPost.h"
#import  <AFNetworking/AFNetworking.h>

static NSString *const baseUrl  = @"https://api.instagram.com";
static NSString *const kDataKey = @"data";

@interface  IAService()
@property AFHTTPRequestOperationManager *restManager;
@end

@implementation IAService

+ (IAService *)defaultProvider {
    static IAService *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = IAService.new;
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.restManager = [AFHTTPRequestOperationManager.alloc initWithBaseURL:[NSURL URLWithString: baseUrl]];
    }
    return self;
}

- (void) getPostService:(PostsHandler) postHandler title:(NSString*) title  {
    NSString * instUrl = @"https://api.instagram.com/v1/tags/%@/media/recent?client_id=005c9a0586834b7bb7335f5955ab951a";
    NSString * api = [NSString stringWithFormat: instUrl, title];
    NSDictionary *params = @{};
    GetHandler getBlock = ^(NSDictionary * data, NSError * error) {
        if(error) {
            NSLog(@"Unable to access to %@", baseUrl);
            postHandler(nil, error);
            return;
        }
        NSArray *dataObject  = [data[kDataKey] mapInfo:^NSObject *(NSDictionary *post) {
            return [InstaPost.alloc initWithInfo:post];
        }];
        postHandler(dataObject, nil);
    };
    [self requestInfoWithAPI:api parameters:params handler:getBlock];
}


- (void)requestInfoWithAPI:(NSString *)api parameters:(NSDictionary *)params handler:(GetHandler)getBlock {
    [self.restManager GET:api parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        getBlock(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        getBlock(nil, error);
    }];
}


@end
