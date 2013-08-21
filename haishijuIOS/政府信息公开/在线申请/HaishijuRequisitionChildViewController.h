//
//  HaishijuRequisitionFirstViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuRequisitionChildViewController : UIViewController<UITextFieldDelegate>
{
    int userType;
}

@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITextView *detailDescription;
@property (weak, nonatomic) IBOutlet UITextView *detailUse;
@property (weak, nonatomic) IBOutlet UIButton *mailBtn;
@property (weak, nonatomic) IBOutlet UIButton *emailBtn;
@property (weak, nonatomic) IBOutlet UIButton *chuanZhenBtn;
@property (weak, nonatomic) IBOutlet UIButton *ziquBtn;
@property (weak, nonatomic) IBOutlet UITextField *beiZhuField;
@property (strong,nonatomic)NSString *firstInfo;

@property (strong,nonatomic) UITextField *applyDate;
@end
