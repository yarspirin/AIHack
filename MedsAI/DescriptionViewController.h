//
//  DescriptionViewController.h
//  MedsAI
//
//  Created by whoami on 3/18/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *producer;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *compound;
@property (nonatomic, strong) NSString *sideEffect;
@property (nonatomic, strong) NSString *contr;
@property (nonatomic, strong) NSString *rating;

@end
