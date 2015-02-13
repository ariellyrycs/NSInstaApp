//
//  PhonesTableViewController.h
//  NSInstaApp
//
//  Created by Ariel Robles on 2/11/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhonesTableViewController : UITableViewController
@property NSMutableArray* dataInst;
- (void)getInfo;
@end
