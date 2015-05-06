//
//  InstaPost.h
//  NSInstaApp
//
//  Created by Ariel Robles on 2/12/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstaPost : NSObject

@property(nonatomic, strong) NSString *owner;
@property(nonatomic, strong) NSString *thumbnail;
@property(nonatomic, strong) NSString *comment;



- (instancetype) initWithInfo:(NSDictionary *) post;

@end
