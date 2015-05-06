//
//  IAService.h
//  NSInstaApp
//
//  Created by Ariel Robles on 5/5/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PostsHandler)(NSArray *, NSError *);
typedef void (^GetHandler)(NSDictionary *, NSError *);


@interface IAService : NSObject
+ (IAService *)defaultProvider;
- (void) getPostService:(PostsHandler)postHandler title:(NSString*)title;
@end
