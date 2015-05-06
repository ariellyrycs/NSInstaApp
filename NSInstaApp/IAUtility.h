//
//  IAUtility.h
//  NSInstaApp
//
//  Created by Ariel Robles on 5/5/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (IA)
- (NSArray *)mapInfo:(NSObject * (^)(NSDictionary *))block;
@end

