//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuNhcyDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *jigou;
@property (strong,nonatomic) NSString *diqu;
@property (strong,nonatomic) NSString *jiashigang;
@property (strong,nonatomic) NSString *lunjigang;
@property (strong,nonatomic) NSString *anquan;
@property (strong,nonatomic) NSString *youchuan;
@property (strong,nonatomic) NSString *weixianhuowu;
@property (strong,nonatomic) NSString *kechuan;
@property (strong,nonatomic) NSString *leiheyouting;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
