//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuJyjhcDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//根据子页面需要展示的内容设置NSString属性
@property (strong,nonatomic) NSString *jigou;
@property (strong,nonatomic) NSString *xuke_num;
@property (strong,nonatomic) NSString *zhucedi;
@property (strong,nonatomic) NSString *date_last;
@property (strong,nonatomic) NSString *address;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
