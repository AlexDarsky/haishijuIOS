//
//  HaishijuCxcbDetailViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-3.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HaishijuZfxxDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
//根据子页面需要展示的内容设置NSString属性

@property (weak, nonatomic) IBOutlet UIWebView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (readwrite) int ID;
-(void)loadInfoBySendRequest:(NSString*)chuanID;
+(HaishijuZfxxDetailViewController*)shareHaishijuZfxxDetailViewController;
@end
