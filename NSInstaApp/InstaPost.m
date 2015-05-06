//
//  InstaPost.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/12/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "InstaPost.h"

static NSString *const kUserKey = @"user";
static NSString *const kFullNameKey = @"full_name";
static NSString *const kImageKey = @"images";
static NSString *const kLowResolution = @"low_resolution";
static NSString *const kURLKey = @"url";
static NSString *const kCaptionKey = @"caption";
static NSString *const kTextKey = @"text";

@implementation InstaPost
- (instancetype) initWithInfo:(NSDictionary *) info {
    self = super.init;
    if(self) {
        self.owner = info[kUserKey][kFullNameKey];
        self.thumbnail = info[kImageKey][kLowResolution][kURLKey];
        if([NSNull null] != info[kCaptionKey]) {
            self.comment = info[kCaptionKey][kTextKey];
        }
    }
    return self;
}
@end
