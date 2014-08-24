//
//  HaishijuZzjgViewController.m
//  广东海事局
//
//  Created by Darsky on 13-10-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZzjgViewController.h"

@interface HaishijuZzjgViewController ()

@end

@implementation HaishijuZzjgViewController
static HaishijuZzjgViewController *shareHaishijuZzjgViewController = nil;
+(HaishijuZzjgViewController*)shareHaishijuZzjgViewController
{
    
    if (shareHaishijuZzjgViewController == nil) {
        shareHaishijuZzjgViewController = [[super allocWithZone:NULL] init];
    }
    return shareHaishijuZzjgViewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[UIScreen mainScreen] bounds].size.height>480.00)
    {
        self=[super initWithNibName:@"HaishijuZzjgViewController_4" bundle:nil];
    }
    else
    {
        self=[super initWithNibName:@"HaishijuZzjgViewController" bundle:nil];
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backAction:(id)sender {
    int index=[[self.navigationController viewControllers]indexOfObject:self];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-1]animated:YES];
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
