//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuISMDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *no;
@property (strong,nonatomic) NSString *GongSi;
@property (strong,nonatomic) NSString *DOCkc;
@property (strong,nonatomic) NSString *SMCkc;
@property (strong,nonatomic) NSString *DOCgs;
@property (strong,nonatomic) NSString *SMCgs;
@property (strong,nonatomic) NSString *DOCpt;
@property (strong,nonatomic) NSString *SMCpt;
@property (strong,nonatomic) NSString *DOCqt;
@property (strong,nonatomic) NSString *SMCqt;
@property (strong,nonatomic) NSString *DOChx;
@property (strong,nonatomic) NSString *SMChx;
@property (strong,nonatomic) NSString *DOCyc;
@property (strong,nonatomic) NSString *SMCyc;
@property (strong,nonatomic) NSString *DOCsh;
@property (strong,nonatomic) NSString *SMCsh;
@property (strong,nonatomic) NSString *DOCq;
@property (strong,nonatomic) NSString *SMCq;
@property (strong,nonatomic) NSString *DOC;
@property (strong,nonatomic) NSString *SMC;
@property (strong,nonatomic) NSString *Info;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
