//
//  MenuTableViewCell.h
//  MedsAI
//
//  Created by whoami on 3/17/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *alternativeImageName;

@end
