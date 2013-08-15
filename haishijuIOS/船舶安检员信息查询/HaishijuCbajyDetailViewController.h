//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuCbajyDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//根据子页面需要展示的内容设置NSString属性
@property (strong,nonatomic) NSString *zheng_type;
@property (strong,nonatomic) NSString *num;
@property (strong,nonatomic) NSString *username;
@property (strong,nonatomic) NSString *fazheng;
@property (strong,nonatomic) NSString *chusheng;
@property (strong,nonatomic) NSString *department;
@property (strong,nonatomic) NSString *bumen;
@property (strong,nonatomic) NSString *zhiwu;

@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
