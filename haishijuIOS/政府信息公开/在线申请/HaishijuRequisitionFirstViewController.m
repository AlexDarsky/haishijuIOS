//
//  HaishijuRequisitionFirstViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuRequisitionFirstViewController.h"

@interface HaishijuRequisitionFirstViewController ()

@end

@implementation HaishijuRequisitionFirstViewController
@synthesize customNavBar,tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int number;
    switch (userType) {
        case 0:
        {
            number=11;
        }
            break;
        case 1:
        {
            number=10;
        }
            break;
    }
    return number;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    switch (userType) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                case 5:
                {
                    
                }
                    break;
                case 6:
                {
                    
                }
                    break;
                case 7:
                {
                    
                }
                    break;
                case 8:
                {
                    
                }
                    break;
                case 9:
                {
                    
                }
                    break;
                case 10:
                {
                    
                }
                    break;
                    
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                case 5:
                {
                    
                }
                    break;
                case 6:
                {
                    
                }
                    break;
                case 7:
                {
                    
                }
                    break;
                case 8:
                {
                    
                }
                    break;
                case 9:
                {
                    
                }
                    break;
                case 10:
                {
                    
                }
                    break;
                    
            }
        }
            break;
    }
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
