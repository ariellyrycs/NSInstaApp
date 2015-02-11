//
//  AndroidTableViewController.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/9/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "AndroidTableViewController.h"
#import "instaDataModel.h"
#import "InstagramCell.h"

@implementation AndroidTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Android";
    self.cellIdentifier = @"CustomInstaCellAndroid";
    [self getInfo: self.title reload:self.tableView];
}


@end
