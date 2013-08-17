//
//  HaishijuRequisitionFirstViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuRequisitionFirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    int userType;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@end
