//
//  HaishijuViewController.h
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import "HaishijuServerHelper.h"
#import "HaishijuCxcbViewController.h"
#import "HaishijuZfzcxViewController.h"
#import "HaishijuGzcbViewController.h"
#import "HaishijuXccbViewController.h"
#import "HaishijuCbshViewController.h"
#import "HaishijuISMViewController.h"
#import "HaishijuHccyViewController.h"
#import "HaishijuNSMViewController.h"
#import "HaishijuZdgzViewController.h"
#import "HaishijuNhcyViewController.h"
#import "HaishijuZfxxViewController.h"
#import "HaishijuAqcxczViewController.h"
#import "HaishijuJyjhcViewController.h"
#import "HaishijuHywpjgViewController.h"
#import "HaishijuCbajyViewController.h"
#import "BottomBarButton.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface HaishijuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate,UIActionSheetDelegate>
{
    NSMutableArray *modelArray;
    NSMutableArray *imagesArray;
    UILabel *_locationLabel;
    UIButton *_shareButton;
    BottomBarButton *_RSSButton;
    BottomBarButton *_offlineButton;
    BottomBarButton *_callButton;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *customNavBar;
@property (weak, nonatomic) IBOutlet UIView *customSearBar;

@property (strong,nonatomic)HaishijuCxcbViewController *cxcbViewController;
@property (strong,nonatomic)HaishijuZfzcxViewController *zfzcxViewController;
@property (strong,nonatomic)HaishijuGzcbViewController *gzcbViewController;
@property (strong,nonatomic)HaishijuXccbViewController *xccbViewController;
@property (strong,nonatomic)HaishijuCbshViewController *cbshViewController;
@property (strong,nonatomic)HaishijuISMViewController *iSMViewController;
@property (strong,nonatomic)HaishijuHccyViewController *hccyViewController;
@property (strong,nonatomic)HaishijuNSMViewController *nSMViewController;
@property (strong,nonatomic)HaishijuZdgzViewController *zdgzViewController;
@property (strong,nonatomic)HaishijuNhcyViewController *nhcyViewController;
@property (strong,nonatomic)HaishijuZfxxViewController *zfxxViewController;
@property (strong,nonatomic)HaishijuAqcxczViewController *aqcxczViewController;
@property (strong,nonatomic)HaishijuJyjhcViewController *jyjhcViewController;
@property (strong,nonatomic)HaishijuHywpjgViewController *hywpjgViewController;
@property (strong,nonatomic)HaishijuCbajyViewController *cbajyViewController;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *clGeocoder;
@end
