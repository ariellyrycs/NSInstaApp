//
//  PhonesTableViewController.m
//  NSInstaApp
//
//  Created by Ariel Robles on 2/11/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "PhonesTableViewController.h"
#import "InstagramCell.h"
#import "instaDataModel.h"

static NSString* cellIdentifier = @"Cell";

@implementation PhonesTableViewController

- (void)getInfo:(NSString *)hashtag reload:(UITableView*) table{
    instaDataModel * instaData = [[instaDataModel alloc] init];
    [instaData getInstaInfo:hashtag  withSuccessBlock:^(id responseObject){
        self.dataInst = [instaData setFormat: responseObject];
        [table reloadData];
    } andFailureBlock:^(NSError * error){
        NSLog(@"%@", error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInfo: self.title reload: self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"InstagramCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
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
//    cell.photo.image = [self.dataInst[indexPath.row] objectForKey: @"thumbnail"];
    cell.comment.text = [self.dataInst[indexPath.row] objectForKey: @"comment"];
    cell.owner.text = [self.dataInst[indexPath.row] objectForKey: @"owner"];
    return cell;
}
@end
