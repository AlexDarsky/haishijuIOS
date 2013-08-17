//
//  HaishijuCxcbViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTableAlert.h"
@interface HaishijuZfxxChildViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *idsArray;
    NSMutableArray *objectsArray;
    int selectBtnIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MLTableAlert *alert;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
-(void)loadListByParentID:(NSString*)parentID;
+(HaishijuZfxxChildViewController*)shareHaishijuZfxxChildViewController;


@end
