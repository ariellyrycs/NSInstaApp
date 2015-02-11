//
//  instagramItemCell.h
//  NSInstaApp
//
//  Created by Ariel Robles on 2/10/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface instagramItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *owner;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *comment;

@end
