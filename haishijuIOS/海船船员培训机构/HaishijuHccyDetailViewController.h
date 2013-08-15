//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuHccyDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *jigou;
@property (strong,nonatomic) NSString *B01;
@property (strong,nonatomic) NSString *B02;
@property (strong,nonatomic) NSString *B03;
@property (strong,nonatomic) NSString *B04;
@property (strong,nonatomic) NSString *B05;
@property (strong,nonatomic) NSString *B06;
@property (strong,nonatomic) NSString *B07;
@property (strong,nonatomic) NSString *B08;
@property (strong,nonatomic) NSString *B09;
@property (strong,nonatomic) NSString *A01;
@property (strong,nonatomic) NSString *A02;
@property (strong,nonatomic) NSString *A03;
@property (strong,nonatomic) NSString *A04;
@property (strong,nonatomic) NSString *A05;
@property (strong,nonatomic) NSString *A06;
@property (strong,nonatomic) NSString *A07;
@property (strong,nonatomic) NSString *A08;
@property (strong,nonatomic) NSString *A09;
@property (strong,nonatomic) NSString *A10;
@property (strong,nonatomic) NSString *A11;
@property (strong,nonatomic) NSString *C07;
@property (strong,nonatomic) NSString *shuishou;
@property (strong,nonatomic) NSString *jigong;
@property (strong,nonatomic) NSString *sanfu;
@property (strong,nonatomic) NSString *sanguang;
@property (strong,nonatomic) NSString *youting;
@property (strong,nonatomic) NSString *chuanzhang;
@property (strong,nonatomic) NSString *dafu;
@property (strong,nonatomic) NSString *lunjizhang;
@property (strong,nonatomic) NSString *daguanglun;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
@end
