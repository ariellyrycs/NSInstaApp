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
#import "InstaPost.h"
#import "IAService.h"


static NSString* cellIdentifier = @"Cell";
static NSString* customCell = @"InstagramCell";

@interface PhonesTableViewController()
@property NSArray * posts;
@end


@implementation PhonesTableViewController

- (void)getInfo {
    PostsHandler postHandler = ^(NSArray *post, NSError *error) {
        if(error) {
            NSLog(@"It couldn't retrive information %@ %@", error, error.localizedDescription);
        } else {
            NSLog(@"Post Retrived successfully");
            self.posts = post;
            [self.tableView reloadData];
        }
        
    };
    [IAService.defaultProvider getPostService:postHandler title:self.title];
    
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
    return 310.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramCell* cell = (InstagramCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    InstaPost *post = self.posts[indexPath.row];
    [cell.photo sd_setImageWithURL:[NSURL URLWithString:post.thumbnail] placeholderImage:nil options:SDWebImageContinueInBackground];
    cell.comment.text = post.comment;
    cell.owner.text = post.owner;
    return cell;
}
@end
