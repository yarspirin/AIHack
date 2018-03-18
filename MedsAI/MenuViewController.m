//
//  MenuViewController.m
//  MedsAI
//
//  Created by whoami on 3/17/18.
//  Copyright © 2018 Mountain Viewer. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"Cell";
    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.cellLabel.text = @"Поиск";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"search";
        cell.alternativeImageName = @"search_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 1) {
        cell.cellLabel.text = @"Аптеки";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"pharmacy";
        cell.alternativeImageName = @"pharmacy_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 2) {
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
        cell.cellLabel.text = @"История";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"history";
        cell.alternativeImageName = @"history_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 3) {
        cell.cellLabel.text = @"Настройки";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"settings";
        cell.alternativeImageName = @"settings_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 4) {
        cell.cellLabel.text = @"Профиль";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"profile";
        cell.alternativeImageName = @"profile_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    } else if (indexPath.row == 5) {
        cell.cellLabel.text = @"Написать нам";
        cell.cellLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        cell.cellLabel.textColor = [UIColor blackColor];
        cell.imageName = @"mail";
        cell.alternativeImageName = @"mail_white";
        cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.cellLabel.textColor = [UIColor whiteColor];
    cell.cellImageView.image = [UIImage imageNamed:cell.alternativeImageName];
    cell.contentView.backgroundColor = [UIColor colorWithRed:86.0/255.0 green:142.0/255.0 blue:247.0/255.0 alpha:1.0];
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"search" sender:self];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"pharmacy" sender:self];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"history" sender:self];
    } else if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"settings" sender:self];
    } else if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"profile" sender:self];
    } else if (indexPath.row == 5) {
        [self composeMail];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.cellLabel.textColor = [UIColor blackColor];
    cell.cellImageView.image = [UIImage imageNamed:cell.imageName];
    cell.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)composeMail {
    NSString *emailTitle = @"Обращение в службу поддержки";
    
    NSArray *toRecipents = [NSArray arrayWithObject:@"mountainviewer@yahoo.com"];
    
    MFMailComposeViewController *mailComposeVC = [[MFMailComposeViewController alloc] init];
    
    if ([MFMailComposeViewController canSendMail]) {
        mailComposeVC.mailComposeDelegate = self;
        [mailComposeVC setSubject:emailTitle];
        [mailComposeVC setToRecipients:toRecipents];
        
        [self presentViewController:mailComposeVC animated:YES completion:nil];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
