//
//  ShortTableViewCell.h
//  MedsAI
//
//  Created by whoami on 3/18/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *producer;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@end
