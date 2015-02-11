//
//  WindowsPhoneTableViewController.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/9/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "WindowsPhoneTableViewController.h"
#import "instaDataModel.h"
#import "InstagramCell.h"


@implementation WindowsPhoneTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WindowsPhone";
    self.cellIdentifier = @"CustomInstaCellWindowsPhone";
    [self getInfo: self.title];
}
@end
