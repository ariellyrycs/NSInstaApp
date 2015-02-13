//
//  PhonesTableViewController.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/11/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//
#import <SDWebImage/UIImageView+WebCache.h>
#import "PhonesTableViewController.h"
#import "InstagramCell.h"
#import "instaDataModel.h"
#import "InstaPost.h"


static NSString* cellIdentifier = @"Cell";
static NSString* customCell = @"InstagramCell";

@implementation PhonesTableViewController

- (void)getInfo {
    instaDataModel * instaData = [[instaDataModel alloc] init];
    [instaData getInstaInfo:self.title  withSuccessBlock:^(NSMutableArray* responseObject){
        self.dataInst = responseObject;
        [self.tableView reloadData];
    } andFailureBlock:^(NSError * error){
        NSLog(@"It couldn't connect with instagram, please check your connection");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:customCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdentifier];
    [self getInfo];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 243.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dataInst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramCell* cell = (InstagramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    InstaPost *post = self.dataInst[indexPath.row];
    [cell.photo sd_setImageWithURL:[NSURL URLWithString:post.thumbnail]];
    cell.comment.text = post.comment;
    cell.owner.text = post.owner;
    return cell;
}
@end
