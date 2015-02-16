//
//  InstagramCell.h
//  NSInstaApp
//
//  Created by Ariel Robles on 2/11/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *owner;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *comment;

@end
