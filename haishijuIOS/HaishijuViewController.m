//
//  HaishijuViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuViewController.h"
#import "HaishijuServerHelper.h"
#import "HaishijuCxcbViewController.h"
@interface HaishijuViewController ()

@end

@implementation HaishijuViewController
@synthesize tableView,customNavBar,customSearBar;
@synthesize zfxxViewController,cxcbViewController,gzcbViewController,zfzcxViewController,xccbViewController,cbshViewController,iSMViewController,hccyViewController,nSMViewController,zdgzViewController,nhcyViewController,aqcxczViewController,jyjhcViewController,hywpjgViewController,cbajyViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    modelArray=[[NSMutableArray alloc] initWithObjects:@"政府信息公开",@"安全诚信船舶名单",@"重点跟踪船舶名单",@"协查船舶名单",@"船舶审核管理",@"实施ISM公司",@"海船船员培训机构查询",@"实施NSM公司",@"重点跟踪公司",@"内河船员培训机构查询",@"“安全诚信船长”名单",@"甲、乙级海船船员服务机构查询",@"海员外派机构查询", @"执法人员执法证查询",@"船舶安检员信息查询", nil];
    imagesArray=[[NSMutableArray alloc] initWithObjects:@"zfxx",@"aqcxcb",@"zdgzcbmd",@"xccbmd",@"cbsh",@"ssISMgs",@"hccy",@"ssNSMgs",@"zdzz",@"nhcy",@"aqcxcz",@"jyjcy",@"hywp",@"zfry",@"cyckscj",nil];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainBG"]];
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.customSearBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchBar"]];
    if ([[UIScreen mainScreen] bounds].size.height>480.00)
    {
        self.zfxxViewController=[[HaishijuZfxxViewController alloc] initWithNibName:@"HaishijuZfxxViewController_4" bundle:nil];
        self.cxcbViewController=[[HaishijuCxcbViewController alloc] initWithNibName:@"HaishijuCxcbViewController_4" bundle:nil];
        self.gzcbViewController=[[HaishijuGzcbViewController alloc] initWithNibName:@"HaishijuGzcbViewController_4" bundle:nil];
        self.xccbViewController=[[HaishijuXccbViewController alloc] initWithNibName:@"HaishijuXccbViewController_4" bundle:nil];
        self.cbshViewController=[[HaishijuCbshViewController alloc] initWithNibName:@"HaishijuCbshViewController_4" bundle:nil];
        self.iSMViewController=[[HaishijuISMViewController alloc] initWithNibName:@"HaishijuISMViewController_4" bundle:nil];
        self.hccyViewController=[[HaishijuHccyViewController alloc] initWithNibName:@"HaishijuHccyViewController_4" bundle:nil];
        self.nSMViewController=[[HaishijuNSMViewController alloc] initWithNibName:@"HaishijuNSMViewController_4" bundle:nil];
        self.zdgzViewController=[[HaishijuZdgzViewController alloc] initWithNibName:@"HaishijuZdgzViewController_4" bundle:nil];
        self.nhcyViewController=[[HaishijuNhcyViewController alloc] initWithNibName:@"HaishijuNhcyViewController_4" bundle:nil];
        self.zfzcxViewController=[[HaishijuZfzcxViewController alloc] initWithNibName:@"HaishijuZfzcxViewController_4" bundle:nil];
        self.aqcxczViewController=[[HaishijuAqcxczViewController alloc] initWithNibName:@"HaishijuAqcxczViewController_4" bundle:nil];
        self.jyjhcViewController=[[HaishijuJyjhcViewController alloc] initWithNibName:@"HaishijuJyjhcViewController_4" bundle:nil];
        self.hywpjgViewController=[[HaishijuHywpjgViewController alloc] initWithNibName:@"HaishijuHywpjgViewController_4" bundle:nil];
        self.cbajyViewController=[[HaishijuCbajyViewController alloc] initWithNibName:@"HaishijuCbajyViewController_4" bundle:nil];

    }
    else
    {
        self.zfxxViewController=[[HaishijuZfxxViewController alloc] initWithNibName:@"HaishijuZfxxViewController" bundle:nil];
        self.cxcbViewController=[[HaishijuCxcbViewController alloc] initWithNibName:@"HaishijuCxcbViewController" bundle:nil];
        self.gzcbViewController=[[HaishijuGzcbViewController alloc] initWithNibName:@"HaishijuGzcbViewController" bundle:nil];
        self.xccbViewController=[[HaishijuXccbViewController alloc] initWithNibName:@"HaishijuXccbViewController" bundle:nil];
        self.cbshViewController=[[HaishijuCbshViewController alloc] initWithNibName:@"HaishijuCbshViewController" bundle:nil];
        self.iSMViewController=[[HaishijuISMViewController alloc] initWithNibName:@"HaishijuISMViewController" bundle:nil];
        self.hccyViewController=[[HaishijuHccyViewController alloc] initWithNibName:@"HaishijuHccyViewController" bundle:nil];
         self.nSMViewController=[[HaishijuNSMViewController alloc] initWithNibName:@"HaishijuNSMViewController" bundle:nil];
        self.zdgzViewController=[[HaishijuZdgzViewController alloc] initWithNibName:@"HaishijuZdgzViewController" bundle:nil];
        self.nhcyViewController=[[HaishijuNhcyViewController alloc] initWithNibName:@"HaishijuNhcyViewController" bundle:nil];
                self.zfzcxViewController=[[HaishijuZfzcxViewController alloc] initWithNibName:@"HaishijuZfzcxViewController" bundle:nil];
        self.aqcxczViewController=[[HaishijuAqcxczViewController alloc] initWithNibName:@"HaishijuAqcxczViewController" bundle:nil];
        self.jyjhcViewController=[[HaishijuJyjhcViewController alloc] initWithNibName:@"HaishijuJyjhcViewController" bundle:nil];
        self.hywpjgViewController=[[HaishijuHywpjgViewController alloc] initWithNibName:@"HaishijuHywpjgViewController" bundle:nil];
        self.cbajyViewController=[[HaishijuCbajyViewController alloc] initWithNibName:@"HaishijuCbajyViewController" bundle:nil];
        
    }
    self.navigationController.navigationBarHidden=YES;
    if (!_locationLabel)
    {
        _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, self.customNavBar.frame.size.height/2-20/2+3, 60, 20)];
        _locationLabel.backgroundColor = [UIColor clearColor];
        _locationLabel.textColor = [UIColor colorWithRed:78.0/255.0 green:225.0/255.0 blue:253.0/255.0 alpha:1.0];
        _locationLabel.font  = [UIFont systemFontOfSize:14];
        _locationLabel.adjustsFontSizeToFitWidth = YES;
        _locationLabel.text = @"未启用定位";
        [self.customNavBar addSubview:_locationLabel];
    }
    
    _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareButton.frame = CGRectMake(250, 14, 25, 24);
    [_shareButton setBackgroundImage:[UIImage imageNamed:@"main_share"] forState:UIControlStateNormal];
    [self.customNavBar addSubview:_shareButton];
    
    _RSSButton = [[BottomBarButton alloc] initWithFrame:CGRectMake(10, self.customSearBar.frame.size.height/2-35/2, 100, 35)];
    [_RSSButton setImage:[UIImage imageNamed:@"RSS_icon"] forState:UIControlStateNormal];
    [_RSSButton setTitle:@"个性化订阅" forState:UIControlStateNormal];
    [_RSSButton addTarget:self action:@selector(didRSSButtonTouch) forControlEvents:UIControlEventTouchDown];
    [self.customSearBar addSubview:_RSSButton];
    
    _offlineButton = [[BottomBarButton alloc] initWithFrame:CGRectMake(110, self.customSearBar.frame.size.height/2-35/2, 100, 35)];
    [_offlineButton setImage:[UIImage imageNamed:@"offline_download_icon"] forState:UIControlStateNormal];
    [_offlineButton setTitle:@"离线缓存" forState:UIControlStateNormal];
    [_offlineButton addTarget:self action:@selector(didOfflineButtonTouch) forControlEvents:UIControlEventTouchDown];
    [self.customSearBar addSubview:_offlineButton];
    
    _callButton = [[BottomBarButton alloc] initWithFrame:CGRectMake(210, self.customSearBar.frame.size.height/2-35/2, 100, 35)];
    [_callButton setImage:[UIImage imageNamed:@"phone_call_icon"] forState:UIControlStateNormal];
    [_callButton setTitle:@"投诉举报" forState:UIControlStateNormal];
    [_callButton addTarget:self action:@selector(didCallButtonTouch) forControlEvents:UIControlEventTouchDown];
    [self.customSearBar addSubview:_callButton];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = nil;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     UIFont *font = [UIFont fontWithName:@"Arial" size:12];
//    if (indexPath.row!=4)
//    {
        int row=indexPath.row*3;
        UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame=CGRectMake(40, 20, 61, 57);
        button1.tag=row;
        [button1 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
  
       //[button1 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row] ] forState:UIControlStateNormal];
    UIImageView * circleImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[imagesArray objectAtIndex:row]]];
    circleImage1.frame = CGRectMake(0,0, 56, 56);
    circleImage1.layer.masksToBounds = YES;
    circleImage1.layer.cornerRadius = 28;
    [cell addSubview:button1];
    [button1 addSubview:circleImage1];
        UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(40, 80, 60, 40)];
        label1.backgroundColor=[UIColor clearColor];
        [label1 setFont:font];
        [label1 setNumberOfLines:0];
        label1.text=[modelArray objectAtIndex:row];
        [cell addSubview:label1];
        
        UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame=CGRectMake(130, 20, 61, 57);
        button2.tag=row+1;
        [button2 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];

//        [button2 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+1] ] forState:UIControlStateNormal];
    UIImageView * circleImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+1]]];
    circleImage2.frame = CGRectMake(0,0, 56, 56);
    circleImage2.layer.masksToBounds = YES;
    circleImage2.layer.cornerRadius = 28;
        [cell addSubview:button2];
    [button2 addSubview:circleImage2];
        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(130, 80, 60, 40)];
        label2.backgroundColor=[UIColor clearColor];
        [label2 setFont:font];
        label2.text=[modelArray objectAtIndex:row+1];
        [label2 setNumberOfLines:0];
        [cell addSubview:label2];
        
        UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
        button3.frame=CGRectMake(220, 20, 61, 57);
        button3.tag=row+2;
        [button3 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];

      //  [button3 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+2] ] forState:UIControlStateNormal];
    UIImageView * circleImage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+2]]];
    circleImage3.frame = CGRectMake(0,0, 56, 56);
    circleImage3.layer.masksToBounds = YES;
    circleImage3.layer.cornerRadius = 28;
        [cell addSubview:button3];
    [button3 addSubview:circleImage3];
        UILabel *label3=[[UILabel alloc] initWithFrame:CGRectMake(220, 80, 60, 40)];
        label3.backgroundColor=[UIColor clearColor];
        [label3 setFont:font];
        label3.text=[modelArray objectAtIndex:row+2];
        [label3 setNumberOfLines:0];
        [cell addSubview:label3];
        
//    }else
//    {
//        int row=indexPath.row*3;
//        UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
//        button1.frame=CGRectMake(40, 20, 61, 57);
//        button1.tag=row;
//        [button1 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
//        [button1 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row] ] forState:UIControlStateNormal];
//        [cell addSubview:button1];
//        UILabel *label1=[[UILabel alloc] initWithFrame:CGRectMake(40, 80, 60, 40)];
//        label1.backgroundColor=[UIColor clearColor];
//        [label1 setFont:font];
//        [label1 setNumberOfLines:0];
//        label1.text=[modelArray objectAtIndex:row];
//        [cell addSubview:label1];
//        
//        UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
//        button2.frame=CGRectMake(130, 20, 61, 57);
//        button2.tag=row+1;
//        [button2 addTarget:self action:@selector(pushToChildViewController:) forControlEvents:UIControlEventTouchUpInside];
//        [button2 setBackgroundImage:[UIImage imageNamed:[imagesArray objectAtIndex:row+1] ] forState:UIControlStateNormal];
//        [cell addSubview:button2];
//        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(130, 80, 60, 40)];
//        label2.backgroundColor=[UIColor clearColor];
//        [label2 setFont:font];
//        label2.text=[modelArray objectAtIndex:row+1];
//        [label2 setNumberOfLines:0];
//        [cell addSubview:label2];
//    }
    
    return cell;
    
    
}
-(void)pushToChildViewController:(id)sender
{
    NSLog(@"%d",[sender tag]);
    if ([self connectedToNetwork]) {
        switch ([sender tag]) {
            case 0:
            {
                [self.navigationController pushViewController:self.zfxxViewController animated:YES];
            }
                break;
            case 1:
            {
                [self.navigationController pushViewController:self.cxcbViewController animated:YES];
            }
                break;
            case 2:
            {
                [self.navigationController pushViewController:self.gzcbViewController animated:YES];
            }
                break;
            case 3:
            {
                [self.navigationController pushViewController:self.xccbViewController animated:YES];
            }
                break;
            case 4:
            {
                [self.navigationController pushViewController:self.cbshViewController animated:YES];
            }
                break;
            case 5:
            {
                [self.navigationController pushViewController:self.iSMViewController animated:YES];
                
            }
                break;
            case 6:
            {
                [self.navigationController pushViewController:self.hccyViewController animated:YES];
                
            }
                break;
            case 7:
            {
                [self.navigationController pushViewController:self.nSMViewController animated:YES];
            }
                break;
            case 8:
            {
                [self.navigationController pushViewController:self.zdgzViewController animated:YES];
            }
                break;
            case 9:
            {
                [self.navigationController pushViewController:self.nhcyViewController animated:YES ];
            }
                break;
            case 10:
            {
                [self.navigationController pushViewController:self.aqcxczViewController animated:YES ];
            }
                break;
            case 11:
            {
                [self.navigationController pushViewController:self.jyjhcViewController animated:YES ];
            }
                break;
            case 12:
            {
                [self.navigationController pushViewController:self.hywpjgViewController animated:YES ];
            }
                break;
            case 13:
            {
                [self.navigationController pushViewController:self.zfzcxViewController animated:YES ];
                
            }
                break;
            case 14:
            {
                [self.navigationController pushViewController:self.cbajyViewController animated:YES ];
            }
                break;
        }
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"网络连接失败" message:@"检测不到可用网络，请您确认网络设置是否正常" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
        [alert show];
    }

}

#pragma mark - LocationFunction Method

- (void)locationAddressWithCLLocation:(CLLocation*)locationGps
{
    if (self.clGeocoder == nil)
        self.clGeocoder = [[CLGeocoder alloc] init];
    
    [self.clGeocoder reverseGeocodeLocation:locationGps
                          completionHandler:^(NSArray* placemarks, NSError* error)
     {
         MKPlacemark* placemark = [placemarks objectAtIndex:0];
         NSLog(@"%@",placemark.locality);
         _locationLabel.text = placemark.locality;
     }];
}

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",locations);
    
    [manager stopUpdatingLocation];

    [self locationAddressWithCLLocation:locations[0]];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
   
}

//TODO:个性化订阅
- (void)didRSSButtonTouch
{
    
}

//TOTO:离线数据
- (void)didOfflineButtonTouch
{
    
}

//TODO:举报投诉
- (void)didCallButtonTouch
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"举报投诉"
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"020-34298158",@"800-830-2286", nil];
    actionSheet.tag = 911;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != actionSheet.cancelButtonIndex)
    {
        if (buttonIndex == 0)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://020-34298158"]];
        }
        if (buttonIndex == 1)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://800-830-2286"]];
        }
    }
}

- (BOOL) connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
	
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
	
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
	
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
	
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
	BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	
    
	NSURL *testURL = [NSURL URLWithString:@"http://www.baidu.com/"];
	NSURLRequest *testRequest = [NSURLRequest requestWithURL:testURL  cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
	NSURLConnection *testConnection = [[NSURLConnection alloc] initWithRequest:testRequest delegate:self];
    return ((isReachable && !needsConnection) || nonWiFi) ? (testConnection ? YES : NO) : NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
