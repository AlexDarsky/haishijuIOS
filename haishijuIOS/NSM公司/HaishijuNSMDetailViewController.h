//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuNSMDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *No;
@property (strong,nonatomic) NSString *GongSi;
@property (strong,nonatomic) NSString *GetDocDate;
@property (strong,nonatomic) NSString *NowDocDate;
@property (strong,nonatomic) NSString *LastYearDate;
@property (strong,nonatomic) NSString *chuanzhong;
@property (strong,nonatomic) NSString *kegunchuan;
@property (strong,nonatomic) NSString *gaosukechuan;
@property (strong,nonatomic) NSString *putongkechuan;
@property (strong,nonatomic) NSString *qitiyunshuchuan;
@property (strong,nonatomic) NSString *huaxuepingchuan;
@property (strong,nonatomic) NSString *youchuan;
@property (strong,nonatomic) NSString *youhuaxueping;
@property (strong,nonatomic) NSString *sanhuochuan;
@property (strong,nonatomic) NSString *qitahuochuan;
@property (strong,nonatomic) NSString *chuanboshuliang;
@property (strong,nonatomic) NSString *guojiNUM;
@property (strong,nonatomic) NSString *dangdiju;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
