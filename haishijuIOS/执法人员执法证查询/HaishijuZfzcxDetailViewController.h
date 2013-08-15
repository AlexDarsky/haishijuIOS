//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuZfzcxDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *username;
@property (strong,nonatomic) NSString *sex;
@property (strong,nonatomic) NSString *department;
@property (strong,nonatomic) NSString *zfz_num;
@property (strong,nonatomic) NSString *zfz_date;
@property (strong,nonatomic) NSString *zfz_yx;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
-(void)setInfoByUsername:(NSString*)chuanID :(NSString*)chuanusername :(NSString*)chuansex:(NSString*)chuandepartment :(NSString*)chuanzfz_num :(NSString*)chuanzfz_date :(NSString*)chuanzfz_yx;
@end
