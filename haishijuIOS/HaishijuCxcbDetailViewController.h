//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuCxcbDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *chuanMing;
@property (strong,nonatomic) NSString *chuanJiGang;
@property (strong,nonatomic) NSString *gongSi;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
