//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuXccbDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *ChuanMing;
@property (strong,nonatomic) NSString *ChuanJiGang;
@property (strong,nonatomic) NSString *Owner;
@property (strong,nonatomic) NSString *Info;
@property (strong,nonatomic) NSString *Type;
@property (strong,nonatomic) NSString *GenZhongYuanyin;
@property (strong,nonatomic) NSString *YiJu;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
