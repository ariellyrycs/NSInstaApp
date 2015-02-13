//
//  instaDataModel.m
//  
//
//  Created by Ariel Robles on 2/10/15.
//
//

#import "instaDataModel.h"
#import "AFNetworking.h"
#import "InstaPost.h"
#import "instaDataModel.h"

static NSString * instUrl = @"https://api.instagram.com/v1/tags/%@/media/recent?client_id=005c9a0586834b7bb7335f5955ab951a";
@implementation instaDataModel
- (void)getInstaInfo:(NSString *)phoneType withSuccessBlock:(void(^)(id))success andFailureBlock:(void(^)(NSError *))failure
{
    NSString *url = [NSString stringWithFormat:instUrl, phoneType];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([self formating: responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

-(NSMutableArray *) formating:(id)instagramData {
    NSMutableArray* tweets = [NSMutableArray new];
    for (id post in instagramData[@"data"]) {
        InstaPost *nPost = [InstaPost new];
        nPost.owner = post[@"user"][@"full_name"];
        nPost.thumbnail = post[@"images"][@"standard_resolution"][@"url"];
        if([NSNull null] != post[@"caption"]) {
            nPost.comment = post[@"caption"][@"text"];
        }
        [tweets addObject: nPost];
    }
    return tweets;
}
@end
