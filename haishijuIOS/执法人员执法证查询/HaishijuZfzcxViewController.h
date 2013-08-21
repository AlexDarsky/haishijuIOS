//
//  HaishijuCxcbViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTableAlert.h"
#import "HaishijuZfzcxDetailViewController.h"
@interface HaishijuZfzcxViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSMutableArray *idsArray;
    NSMutableArray *chuanmingsArray;
    NSMutableArray *chuanjigangsArray;
    NSMutableArray *sexsArray;
    NSMutableArray *zfz_numArray;
    NSMutableArray *zfz_dateArray;
    NSMutableArray *zfz_yxArray;
    NSArray *keyWordsArray;
    NSArray *keyWordsString;
    int totalPage;
    int currentPage;
    int total;
    int selectBtnIndex;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MLTableAlert *alert;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UIView *customSearchBar;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *buttonMore;
@property (strong,nonatomic) NSMutableString *searchFieldString;
@property (weak, nonatomic) IBOutlet UIButton *keySelectBtn;
@property (weak, nonatomic) IBOutlet UITextField *serachField;
@property (strong,nonatomic) HaishijuZfzcxDetailViewController *gzcbDetailViewController;

@end
