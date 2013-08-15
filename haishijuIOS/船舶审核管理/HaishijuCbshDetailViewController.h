//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuCbshDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *chuanMing;
@property (strong,nonatomic) NSString *SMCNO;
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *SMCYouXiaoDate;
@property (strong,nonatomic) NSString *SMCQianFaDate;
@property (strong,nonatomic) NSString *DOCNO;
@property (strong,nonatomic) NSString *daiGuan;
@property (strong,nonatomic) NSString *GongSi;
@property (strong,nonatomic) NSString *DOCYouXiaoDate;
@property (strong,nonatomic) NSString *DOCQianFaDate;
@property (strong,nonatomic) NSString *Info;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
