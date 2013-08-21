//
//  HaishijuRequisitionFirstViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HaishijuRequisitionChildViewController.h"

@interface HaishijuRequisitionFirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    int userType;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;

@property (strong,nonatomic) UITextField *userName;
@property (strong,nonatomic) UITextField *userDanwei;
@property (strong,nonatomic) UITextField *credType;
@property (strong,nonatomic) UITextField *credNumber;
@property (strong,nonatomic) UITextField *userNumber;
@property (strong,nonatomic) UITextField *userChuanzhen;
@property (strong,nonatomic) UITextField *userEmail;
@property (strong,nonatomic) UITextField *zipCode;
@property (strong,nonatomic) UITextField *userAdress;

@property (strong,nonatomic) UITextField *orgName;
@property (strong,nonatomic) UITextField *orgCode;
@property (strong,nonatomic) UITextField *orgCorpo;
@property (strong,nonatomic) UITextField *orgConName;
@property (strong,nonatomic) UITextField *orgConNumber;
@property (strong,nonatomic) UITextField *orgConChuanzhen;
@property (strong,nonatomic) UITextField *orgAdress;
@property (strong,nonatomic) UITextField *orgEmail;
@property (strong,nonatomic) HaishijuRequisitionChildViewController *requisitionChildViewController;
@property (strong,nonatomic) UITextField *applyDate;
@end
