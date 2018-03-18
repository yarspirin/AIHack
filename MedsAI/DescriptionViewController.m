//
//  DescriptionViewController.m
//  MedsAI
//
//  Created by whoami on 3/18/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import "DescriptionViewController.h"
#import "ShortTableViewCell.h"
#import "InstructionTableViewCell.h"
#import "BuyTableViewCell.h"
#import "MedTableViewCell.h"
#import "ProblemTableViewCell.h"

#import <SafariServices/SafariServices.h>
#import <NYAlertViewController.h>

@interface DescriptionViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DescriptionViewController

- (IBAction)riglaButton:(id)sender {
    NSString *webAddress = @"http://www.rigla.ru";
    NSURL *url = [[NSURL alloc] initWithString:webAddress];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:safariVC animated:YES completion:nil];
}

- (IBAction)farmButton:(id)sender {
    NSString *webAddress = @"http://farmlend.ru";
    NSURL *url = [[NSURL alloc] initWithString:webAddress];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:safariVC animated:YES completion:nil];
}

- (IBAction)zdravButton:(id)sender {
    NSString *webAddress = @"https://zdravcity.ru";
    NSURL *url = [[NSURL alloc] initWithString:webAddress];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    [self presentViewController:safariVC animated:YES completion:nil];
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        // Instruction
        NYAlertViewController *alertVC = [[NYAlertViewController alloc] init];
        
        alertVC.title = @"Инструкция";
        alertVC.titleFont = [UIFont fontWithName:@"AvenirNext-Regular" size:25.0];
        alertVC.titleColor = [UIColor blackColor];
        
        alertVC.messageFont = [UIFont fontWithName:@"AvenirNext-Regular" size:17.0];
        alertVC.message = [NSString stringWithFormat:@"\nСостав:\n %@\n\n Побочные эффекты:\n %@\n\n Противопоказания:\n %@", self.compound, self.sideEffect, self.contr];
        
        alertVC.cancelButtonColor = [UIColor colorWithRed:86.0 / 255.0 green:142.0 / 255.0 blue:247.0 / 255.0 alpha:1];
        
        NYAlertAction *okAction = [NYAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(NYAlertAction *action) {
                                                             [self dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        
        [alertVC addAction:okAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    } else {
        // Problem
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 98;
    } else if (indexPath.row == 1) {
        return 61;
    } else if (indexPath.row == 2) {
        return 209;
    } else if (indexPath.row == 3) {
        return 174;
    } else {
        return 79;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *shortCellIdentifier = @"short";
    static NSString *instructionCellIdentifier = @"instruction";
    static NSString *buyCellIdentifier = @"buy";
    static NSString *medCellIdentifier = @"med";
    static NSString *problemCellIdentifier = @"problem";
    
    if (indexPath.row == 0) {
        ShortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shortCellIdentifier forIndexPath:indexPath];
        cell.producer.text = self.producer;
        cell.name.text = self.name;
        cell.rating.text = self.rating;
        
        return cell;
    } else if (indexPath.row == 1) {
        InstructionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:instructionCellIdentifier forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.row == 2) {
        BuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:buyCellIdentifier forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.row == 3) {
        MedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:medCellIdentifier forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.row == 4) {
        ProblemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:problemCellIdentifier forIndexPath:indexPath];
        
        return cell;
    }
    
    return NULL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navBar.topItem.title = self.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
