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



@implementation PhonesTableViewController
- (void)getInfo:(NSString *)hashtag reload:(UITableView*) table{
    instaDataModel * instaData = [[instaDataModel alloc] init];
    [instaData getInstaInfo:hashtag  withSuccessBlock:^(id responseObject){
        [self setFormat:responseObject];
        [table reloadData];
    } andFailureBlock:^(NSError * error){
        NSLog(@"%@", error);
    }];
    self.dataInst = [[NSMutableArray alloc] initWithCapacity:20];}

-(void) setFormat:(NSDictionary *)instagramData {
    NSArray* tweets = [instagramData valueForKey:@"data"];
    int i;
    for(i = 0; i < 20; i++) {
        NSMutableDictionary* tmp = [[NSMutableDictionary alloc] init];
        [tmp setObject: [[tweets[i] objectForKey:@"user"] objectForKey:@"full_name"]  forKey: @"owner"];
        [tmp setObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[tweets[i] objectForKey:@"images"]  objectForKey:@"standard_resolution"] objectForKey:@"url"]]]] forKey:@"thumbnail"];
        if([NSNull null] != [tweets[i] objectForKey:@"caption"]) {
            [tmp setObject:[[tweets[i] objectForKey:@"caption"] objectForKey:@"text"] forKey:@"comment"];
        }
        [self.dataInst addObject: tmp];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    InstagramCell* cell = (InstagramCell *)[tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if(!cell) {
        cell = [[InstagramCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    cell.photo.image = [self.dataInst[indexPath.row] objectForKey: @"thumbnail"];
    cell.comment.text = [self.dataInst[indexPath.row] objectForKey: @"comment"];
    cell.owner.text = [self.dataInst[indexPath.row] objectForKey: @"owner"];
    return cell;
}
@end
