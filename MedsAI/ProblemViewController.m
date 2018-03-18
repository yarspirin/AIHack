//
//  ProblemViewController.m
//  MedsAI
//
//  Created by whoami on 3/18/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import "ProblemViewController.h"
#import <SVProgressHUD.h>

@interface ProblemViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ProblemViewController

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonTapped:(id)sender {
    [SVProgressHUD show];
    [SVProgressHUD dismissWithDelay:0.3 completion:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)configureButton {
    self.button.layer.cornerRadius = 5.0;
    self.button.layer.borderWidth = 2.0;
    self.button.layer.borderColor = [UIColor colorWithRed:86.0/255.0 green:142.0/255.0 blue:247.0/255.0 alpha:1.0].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
