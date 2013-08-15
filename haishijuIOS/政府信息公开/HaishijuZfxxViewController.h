//
//  HaishijuCxcbViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTableAlert.h"
#import "HaishijuZfxxListViewController.h"
@interface HaishijuZfxxViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *objectsArray;
    NSMutableArray *muluArray;
    NSMutableArray *idsArray;
    int selectBtnIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MLTableAlert *alert;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (strong,nonatomic) HaishijuZfxxListViewController *zfxxListViewController;



@end
