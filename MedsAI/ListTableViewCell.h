//
//  ListTableViewCell.h
//  MedsAI
//
//  Created by whoami on 3/17/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCStarRatingView.h"

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *producer;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) NSString *imageName;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;

@end
