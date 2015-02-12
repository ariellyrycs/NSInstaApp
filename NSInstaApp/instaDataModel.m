//
//  instaDataModel.m
//  
//
//  Created by Ariel Robles on 2/10/15.
//
//

#import "instaDataModel.h"
#import "AFNetworking.h"

static NSString * instUrl = @"https://api.instagram.com/v1/tags/%@/media/recent?client_id=005c9a0586834b7bb7335f5955ab951a";
@implementation instaDataModel
- (void)getInstaInfo:(NSString *)phoneType withSuccessBlock:(void(^)(id))success andFailureBlock:(void(^)(NSError *))failure
{
    NSString *url = [NSString stringWithFormat:instUrl, phoneType];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self setFormat:responseObject];
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

-(NSMutableArray *) setFormat:(NSDictionary *)instagramData {
    NSMutableArray* tweets = [NSMutableArray new];
    for (id post in instagramData[@"data"]) {
        NSMutableDictionary* instaInfo = [NSMutableDictionary new];
        instaInfo[@"owner"] = post[@"user"][@"full_name"];
        instaInfo[@"url"] = post[@"images"][@"standard_resolution"];
        if([NSNull null] != post[@"caption"]) {
            instaInfo[@"comment"] = post[@"caption"][@"text"];
        }
        [tweets addObject: instaInfo];
    }
    /*
    [tmp setObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[ objectForKey:@"url"]]]] forKey:@"thumbnail"];*/
    return tweets;
}
@end
