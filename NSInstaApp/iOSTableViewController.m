//
//  iOSTableViewController.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/9/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "iOSTableViewController.h"
#import "instaDataModel.h"
#import "InstagramCell.h"

@implementation iOSTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS";
    self.cellIdentifier = @"CustomInstaCellIOS";
    [self getInfo: self.title];
}

@end
