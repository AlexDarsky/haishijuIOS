//
//  HaishijuRequisitionFirstViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-17.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuRequisitionChildViewController.h"
#import "HaishijuServerHelper.h"

@interface HaishijuRequisitionChildViewController ()

@end

@implementation HaishijuRequisitionChildViewController
@synthesize customNavBar;
@synthesize detailDescription,detailUse,mailBtn,emailBtn,chuanZhenBtn,ziquBtn,beiZhuField,firstInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([[UIScreen mainScreen] bounds].size.height>480.00)
        {
            self=[super initWithNibName:@"HaishijuRequisitionChildViewController_4" bundle:nil];
        }
        else
        {
            self=[super initWithNibName:@"HaishijuRequisitionChildViewController" bundle:nil];
        }

            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
    userType=0;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textFiledReturnEditing:)];
    [self.view addGestureRecognizer:tap];
    self.mailBtn.selected=self.emailBtn.selected=self.chuanZhenBtn.selected=self.ziquBtn.selected=NO;

}
- (IBAction)Submit:(id)sender
{
    if ([self.detailDescription.text isEqualToString:@""]||[self.detailUse.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"错误" message:@"请填写完您的信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alert show];
    }else
    {
        self.firstInfo=[self.firstInfo stringByAppendingFormat:@"&Field19=%@&Field20=%@",self.detailDescription.text,self.detailUse.text];
        /*
        if (self.mailBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"邮寄；"];
        }
        if (self.emailBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"电子邮件；"];
        }
        if (self.chuanZhenBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"传真；"];
        }
        if (self.ziquBtn.selected==YES) {
            self.firstInfo=[self.firstInfo stringByAppendingFormat:@"自行领取."];
        }*/
        self.firstInfo=[self.firstInfo stringByAppendingFormat:@"&Field21=%@&Apply=true",self.beiZhuField.text];
        NSLog(@"%@",self.firstInfo);
        NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/apply.asp?%@",self.firstInfo];
        HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
        NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
        if (initDic!=nil) {
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSDictionary *returnMSG=[NSDictionary dictionaryWithDictionary:[dataList objectAtIndex:0]];
            NSString *resultString=[NSString stringWithFormat:@"%@",[returnMSG objectForKey:@"msg"]];
            UIAlertView *resultAlert=[[UIAlertView alloc] initWithTitle:@"申请结果" message:resultString delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [resultAlert show];
        }else
        {
            UIAlertView *resultAlert=[[UIAlertView alloc] initWithTitle:@"申请结果" message:@"数据错误" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [resultAlert show];

        }
            

    }
}
- (IBAction)backAction:(id)sender {
    int index=[[self.navigationController viewControllers]indexOfObject:self];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-1]animated:YES];
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)textFiledReturnEditing:(id)sender {
    [self.detailDescription resignFirstResponder];
     [self.detailUse resignFirstResponder];
}
-(IBAction)exitKeyBoard:(id)sender
{
    [sender resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectedButton:(id)sender
{
    UIButton *button=(UIButton*)sender;
    if (button.selected==YES) {
       button.selected=NO;
        NSLog(@"BO");
    }else
    {
        button.selected=YES;
        NSLog(@"YES");
    }
   
}
-(NSString*)getEncodedString:(NSString*)urlString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)urlString,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}
- (void)viewDidUnload {
    [self setDetailDescription:nil];
    [self setDetailUse:nil];
    [self setMailBtn:nil];
    [self setEmailBtn:nil];
    [self setChuanZhenBtn:nil];
    [self setZiquBtn:nil];
    [self setBeiZhuField:nil];
    [super viewDidUnload];
}
@end
