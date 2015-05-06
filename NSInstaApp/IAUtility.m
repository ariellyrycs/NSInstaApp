//
//  IAUtility.m
//  NSInstaApp
//
//  Created by Ariel Robles on 5/5/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "IAUtility.h"

@implementation NSArray (IA)
- (NSArray *)mapInfo:(NSObject * (^)(NSDictionary *)) block{
    NSMutableArray * result = NSMutableArray.new;
    for(NSDictionary *obj in self) {
        [result addObject:block(obj)];
    }
    return result;
}
@end