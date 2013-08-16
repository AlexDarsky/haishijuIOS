//
//  HaishijuCxcbViewController.m
//  haishijuIOS
//
//  Created by Darsky on 13-8-1.
//  Copyright (c) 2013年 Darsky. All rights reserved.
//

#import "HaishijuZdgzViewController.h"
#import "HaishijuServerHelper.h"
#import <QuartzCore/QuartzCore.h>
@interface HaishijuZdgzViewController ()

@end

@implementation HaishijuZdgzViewController
@synthesize tableView,customNavBar,serachField,customSearchBar,button1,button2,button3,button4,button5,buttonMore,keySelectBtn,alert,searchFieldString,gzcbDetailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    idsArray=[[NSMutableArray alloc] initWithCapacity:0];
    chuanmingsArray=[[NSMutableArray alloc] initWithCapacity:0];
    chuanjigangsArray=[[NSMutableArray alloc] initWithCapacity:0];
    total=0;
    totalPage=0;
    currentPage=0;
    keyWordsArray=[[NSArray alloc] initWithObjects:nil];
    keyWordsString=[[NSArray alloc] initWithObjects:nil];
    self.navigationController.navigationBarHidden=YES;
    self.customNavBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeNavBar"]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"listViewBG"]];
    self.searchFieldString=nil;
    self.gzcbDetailViewController=[[HaishijuZdgzDetailViewController alloc] init];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
    NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&Page=%d",1];
    NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    if ([idsArray count]>0) {
        return;
    }else
    {
        NSLog(@"load dataList");
        NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
        NSLog(@"%d",[dataList count]);
        for (NSDictionary *dic in dataList)
        {
            [idsArray addObject:[dic objectForKey:@"ID"]];
            [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
            [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
        }
        NSArray *pageInfoArray=[[NSArray alloc] initWithArray:[initDic objectForKey:@"page"]];
        NSDictionary *pageInfo=[[NSDictionary alloc] initWithDictionary:[pageInfoArray objectAtIndex:0]];
        totalPage=[[NSString  stringWithFormat:@"%@",[pageInfo objectForKey:@"总页数"]] intValue];
        currentPage=[[NSString  stringWithFormat:@"%@",[pageInfo objectForKey:@"当前页"]] intValue];;
        [self setButtonsByTotalPage:totalPage];
        button1.selected=YES;
        selectBtnIndex=1;
    }
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [idsArray count]+1;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *cellIdentifier = @"MyCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    UIFont *font = [UIFont fontWithName:@"Arial" size:15];
    if (indexPath.row==0)
    {
        
        UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(40, 10, 200, 40)];
        chuanmingLabel.text=@"公司名";
        UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10, 80, 40)];
        chuanjigangLabel.text=@"isDOC";;
        chuanjigangLabel.font=chuanmingLabel.font=font;
        chuanmingLabel.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
        chuanmingLabel.textColor=chuanjigangLabel.textColor=[UIColor blackColor];
        [cell addSubview:chuanmingLabel];
        [cell addSubview:chuanjigangLabel];

    }else
    {
        
        UIButton *nextBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.frame=CGRectMake(10, 21, 17, 16);
        [nextBtn setBackgroundImage:[UIImage imageNamed:@"nextItem"] forState:UIControlStateNormal];
        [nextBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
        [nextBtn setTag:indexPath.row-1];
        UILabel *chuanmingLabel=[[UILabel alloc] initWithFrame:CGRectMake(40, 10, 200, 40)];
        chuanmingLabel.text=[chuanmingsArray objectAtIndex:indexPath.row-1];
        UILabel *chuanjigangLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10, 80, 40)];
        chuanjigangLabel.text=[chuanjigangsArray objectAtIndex:indexPath.row-1];
        chuanjigangLabel.font=chuanmingLabel.font=font;
        chuanmingLabel.backgroundColor=chuanjigangLabel.backgroundColor=[UIColor clearColor];
        chuanmingLabel.textColor=chuanjigangLabel.textColor=[UIColor blueColor];
        [cell addSubview:nextBtn];
        [cell addSubview:chuanmingLabel];
        [cell addSubview:chuanjigangLabel];

    }
        return cell;
}
-(IBAction)tapBotAction:(id)sender
{
    NSLog(@"%d",[sender tag]);
    switch ([sender tag]) {
        case 1:
        {
            if (button1.selected==NO){
            selectBtnIndex=1;
            button1.selected=YES;
            button2.selected=button3.selected=button4.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
            NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage];
            NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];

            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
                        }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                        }
            [self.tableView reloadData];
            }
        }
            break;
        case 2:
        {
            if (button2.selected==NO) {
                selectBtnIndex=2;
            button2.selected=YES;
            button1.selected=button3.selected=button4.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+1];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
            }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                          }
            [self.tableView reloadData];
        }
        }
            break;
        case 3:
        {
            if (button3.selected==NO) {
                selectBtnIndex=3;
            button3.selected=YES;
            button2.selected=button1.selected=button4.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+2];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
                           }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                           }
            [self.tableView reloadData];
            }

        }
            break;
        case 4:
        {if (button4.selected==NO) {
            selectBtnIndex=5;
            button4.selected=YES;
            button2.selected=button3.selected=button1.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
            NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+3];
            NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
                           }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                           }
            [self.tableView reloadData];
        }

        }
            break;
        case 5:
        {
            if (button5.selected==NO)
            {
                if (totalPage%4!=0)
                {
                    currentPage=totalPage-totalPage%4+1;
                    [self setButtonsByTotalPage:totalPage];
                }else
                {
                    currentPage=totalPage-3;
                    [self setButtonsByTotalPage:totalPage];
                }
                switch (totalPage%4) {
                    case 1:
                        selectBtnIndex=1;
                        button1.selected=YES;
                        button2.selected=button3.selected=button4.selected=button5.selected=NO;
                        break;
                    case 2:
                        selectBtnIndex=2;
                        button2.selected=YES;
                        button5.selected=button3.selected=button4.selected=button1.selected=NO;
                        break;
                    case 3:
                        selectBtnIndex=3;
                        button3.selected=YES;
                        button2.selected=button5.selected=button4.selected=button1.selected=NO;
                        break;
                    case 0:
                        selectBtnIndex=4;
                        button4.selected=YES;
                        button2.selected=button3.selected=button5.selected=button1.selected=NO;
                        break;
                }
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,totalPage];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
                          }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                          }
            [self.tableView reloadData];
            }

        }
            break;
    }
}
-(void)changeToPage:(int)buttonIndex
{
    NSLog(@"%d",buttonIndex);
    switch (buttonIndex) {
        case 1:
        {
            if (button1.selected==NO){
                selectBtnIndex=1;
                button1.selected=YES;
                button2.selected=button3.selected=button4.selected=button5.selected=NO;
                HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
                if ([idsArray count]>0) {
                    [idsArray removeAllObjects];
                    [chuanmingsArray removeAllObjects];
                    [chuanjigangsArray removeAllObjects];
                                 }
                NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
                NSLog(@"%d",[dataList count]);
                for (NSDictionary *dic in dataList)
                {
                    [idsArray addObject:[dic objectForKey:@"ID"]];
                    [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                    [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                               }
                [self.tableView reloadData];
            }
        }
            break;
        case 2:
        {
            if (button2.selected==NO) {
                selectBtnIndex=2;
                button2.selected=YES;
                button1.selected=button3.selected=button4.selected=button5.selected=NO;
                HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+1];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
                if ([idsArray count]>0) {
                    [idsArray removeAllObjects];
                    [chuanmingsArray removeAllObjects];
                    [chuanjigangsArray removeAllObjects];
                                  }
                NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
                NSLog(@"%d",[dataList count]);
                for (NSDictionary *dic in dataList)
                {
                    [idsArray addObject:[dic objectForKey:@"ID"]];
                    [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                    [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                                  }
                [self.tableView reloadData];
            }
        }
            break;
        case 3:
        {
            if (button3.selected==NO) {
                selectBtnIndex=3;
                button3.selected=YES;
                button2.selected=button1.selected=button4.selected=button5.selected=NO;
                HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+2];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
                if ([idsArray count]>0) {
                    [idsArray removeAllObjects];
                    [chuanmingsArray removeAllObjects];
                    [chuanjigangsArray removeAllObjects];
                  //  [gongsisArray removeAllObjects];
                }
                NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
                NSLog(@"%d",[dataList count]);
                for (NSDictionary *dic in dataList)
                {
                    [idsArray addObject:[dic objectForKey:@"ID"]];
                    [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                    [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                  //  [gongsisArray addObject:[dic objectForKey:@"GongSi"]];
                }
                [self.tableView reloadData];
            }
            
        }
            break;
        case 4:
        {if (button4.selected==NO) {
            selectBtnIndex=4;
            button4.selected=YES;
            button2.selected=button3.selected=button1.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
            NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage+3];
            NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
                           }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                         }
            [self.tableView reloadData];
        }
            
        }
            break;
        case 5:
        {
            if (button5.selected==NO) {
                selectBtnIndex=5;
                button5.selected=YES;
                button2.selected=button3.selected=button4.selected=button1.selected=NO;
                HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,totalPage];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
                if ([idsArray count]>0) {
                    [idsArray removeAllObjects];
                    [chuanmingsArray removeAllObjects];
                    [chuanjigangsArray removeAllObjects];
                                    }
                NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
                NSLog(@"%d",[dataList count]);
                for (NSDictionary *dic in dataList)
                {
                    [idsArray addObject:[dic objectForKey:@"ID"]];
                    [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                    [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                                   }
                [self.tableView reloadData];
            }
            
        }
            break;
    }
}
- (IBAction)nextPage:(id)sender
{
    if (selectBtnIndex+1<5) {
        if (currentPage+selectBtnIndex<=totalPage) {
            [self changeToPage:selectBtnIndex+1];
            
        }
    }else
    {
        if (currentPage+1==totalPage)
        {
            selectBtnIndex=5;
            [self changeToPage:selectBtnIndex];
            
        }else
        {
            if (currentPage+4>=totalPage)
            {
                
            }else
            {
                currentPage=currentPage+4;
                NSLog(@"pageWillTuren and currentPage is %d",currentPage);
                selectBtnIndex=1;
                [self setButtonsByTotalPage:totalPage];
                button1.selected=YES;
                button2.selected=button3.selected=button4.selected=button5.selected=NO;
                HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
                NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&Page=%d",currentPage];
                NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
                

                if ([idsArray count]>0) {
                    [idsArray removeAllObjects];
                    [chuanmingsArray removeAllObjects];
                    [chuanjigangsArray removeAllObjects];
                 //   [gongsisArray removeAllObjects];
                }
                NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
                NSLog(@"%d",[dataList count]);
                for (NSDictionary *dic in dataList)
                {
                    [idsArray addObject:[dic objectForKey:@"ID"]];
                    [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                    [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
                   // [gongsisArray addObject:[dic objectForKey:@"GongSi"]];
                }
                [self.tableView reloadData];
            }

        }
    }
}
- (IBAction)prevPage:(id)sender
{
    NSLog(@"%d",selectBtnIndex);
    if (selectBtnIndex>1) {
        [self changeToPage:selectBtnIndex-1];
    }else
    {
        if (currentPage-1<=0)
        {
            
        }else
        {
            currentPage=currentPage-4;
            selectBtnIndex=4;
            [self setButtonsByTotalPage:totalPage];
            button4.selected=YES;
            button2.selected=button3.selected=button1.selected=button5.selected=NO;
            HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
            NSString *urlString =[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&Page=%d",currentPage];
            NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
            if ([idsArray count]>0) {
                [idsArray removeAllObjects];
                [chuanmingsArray removeAllObjects];
                [chuanjigangsArray removeAllObjects];
            //    [gongsisArray removeAllObjects];
            }
            NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
            NSLog(@"%d",[dataList count]);
            for (NSDictionary *dic in dataList)
            {
                [idsArray addObject:[dic objectForKey:@"ID"]];
                [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
                [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
              //  [gongsisArray addObject:[dic objectForKey:@"GongSi"]];
            }
            [self.tableView reloadData];
            
        }

    }
}
- (IBAction)exitKeyBoard:(id)sender
{
    [sender resignFirstResponder];
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)backToHomeAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)showKeyWordsSelect:(id)sender {
    self.alert = [MLTableAlert tableAlertWithTitle:@"Choose an option..." cancelButtonTitle:@"Cancel" numberOfRows:^NSInteger (NSInteger section)
                  {
                      return [keyWordsArray count];
                }
                                          andCells:^UITableViewCell* (MLTableAlert *anAlert, NSIndexPath *indexPath)
                  {
                      static NSString *CellIdentifier = @"CellIdentifier";
                      UITableViewCell *cell = [anAlert.table dequeueReusableCellWithIdentifier:CellIdentifier];
                      if (cell == nil)
                          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                      
                      cell.textLabel.text = [keyWordsArray objectAtIndex:indexPath.row];
                      return cell;
                  }];
	
	// Setting custom alert height
	self.alert.height = 350;
	
	// configure actions to perform
	[self.alert configureSelectionBlock:^(NSIndexPath *selectedIndex){
		[self.keySelectBtn setTitle:[keyWordsArray objectAtIndex:selectedIndex.row] forState:UIControlStateNormal];
         self.searchFieldString=[NSMutableString stringWithFormat:@"%@",[keyWordsString objectAtIndex:selectedIndex.row]];
	} andCompletionBlock:^{
	}];
	
	// show the alert
	[self.alert show];
}
- (IBAction)searchAction:(id)sender
{
    HaishijuServerHelper *serverHelper=[HaishijuServerHelper shareHaishijuServerHelper];
    NSString *urlString=nil;
    currentPage=1;
        if ([keySelectBtn.titleLabel.text isEqualToString:@""]||keySelectBtn.titleLabel.text==nil) {
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"错误" message:@"请输入搜索内容" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alertView show];
        return;
    }else
        urlString=[NSString stringWithFormat:@"http://www.gdmsa.gov.cn/android/getDataList.asp?type=zdgs&searchField=%@&keyword=%@&Page=%d",self.searchFieldString,self.serachField.text,currentPage];
    NSDictionary *initDic=[[NSDictionary alloc] initWithDictionary:[serverHelper sendRequestByUrl:urlString]];
    NSArray *dataList=[[NSArray alloc] initWithArray:[initDic objectForKey:@"datalist"]];
    NSLog(@"%d",[dataList count]);

    if ([[NSDictionary dictionaryWithDictionary:[dataList objectAtIndex:0]] objectForKey:@"error"]!=nil)
    {
        UIAlertView *alerts=[[UIAlertView alloc] initWithTitle:@"搜索结果" message:@"找不到您索要搜索的信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alerts show];
    }else
    {
        if ([idsArray count]>0) {
            [idsArray removeAllObjects];
            [chuanmingsArray removeAllObjects];
            [chuanjigangsArray removeAllObjects];
            //   [gongsisArray removeAllObjects];
        }
               for (NSDictionary *dic in dataList)
        {
            [idsArray addObject:[dic objectForKey:@"ID"]];
            [chuanmingsArray addObject:[dic objectForKey:@"Gname"]];
            [chuanjigangsArray addObject:[dic objectForKey:@"IsDOC"]];
            // [gongsisArray addObject:[dic objectForKey:@"GongSi"]];
        }
        NSArray *pageInfoArray=[[NSArray alloc] initWithArray:[initDic objectForKey:@"page"]];
        NSDictionary *pageInfo=[[NSDictionary alloc] initWithDictionary:[pageInfoArray objectAtIndex:0]];
        totalPage=[[NSString  stringWithFormat:@"%@",[pageInfo objectForKey:@"总页数"]] intValue];
        currentPage=[[NSString  stringWithFormat:@"%@",[pageInfo objectForKey:@"当前页"]] intValue];;
        total=[[NSString  stringWithFormat:@"%@",[pageInfo objectForKey:@"总记录"]] intValue];
        [self setButtonsByTotalPage:totalPage];
        button1.selected=YES;
        selectBtnIndex=1;
        
        button1.selected=YES;
        button2.selected=button3.selected=button4.selected=button5.selected=NO;
        [self.tableView reloadData];
    }
    
}
-(void)setButtonsByTotalPage:(int)number
{
    switch (number) {
        case 0:
        {
            button1.hidden=button2.hidden=button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
        }
            break;
        case 1:
        {
            button1.hidden=button2.hidden=button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
        }
            break;
        case 2:
        {
            [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
            button1.hidden=button2.hidden=NO;
            button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
        }
            break;
        case 3:
        {
            [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
            button1.hidden=button2.hidden=button3.hidden=NO;
            button4.hidden=button5.hidden=buttonMore.hidden==YES;
        }
            break;
        case 4:
        {
            [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
            [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
            [button3 setTitle:[NSString stringWithFormat:@"%d",currentPage+2] forState:UIControlStateNormal];
            [button4 setTitle:[NSString stringWithFormat:@"%d",currentPage+3] forState:UIControlStateNormal];
            [button5 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
            button1.hidden=button2.hidden=button3.hidden=button4.hidden=NO;
            button5.hidden=buttonMore.hidden=YES;
        }
            break;
        case 5:
        {
            if (5-currentPage==0) {
                NSLog(@"I work");
                [button1 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                button1.hidden=NO;
                button2.hidden=button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
                
                
            }else
            {
                [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
                [button3 setTitle:[NSString stringWithFormat:@"%d",currentPage+2] forState:UIControlStateNormal];
                [button4 setTitle:[NSString stringWithFormat:@"%d",currentPage+3] forState:UIControlStateNormal];
                [button5 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                button1.hidden=button2.hidden=button3.hidden=button4.hidden=button5.hidden=NO;
                buttonMore.hidden=YES;
                
            }

        }
            break;
        default:
        {
            if (totalPage-currentPage>=5) {
                NSLog(@" now is %d",totalPage-currentPage);
                [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
                [button3 setTitle:[NSString stringWithFormat:@"%d",currentPage+2] forState:UIControlStateNormal];
                [button4 setTitle:[NSString stringWithFormat:@"%d",currentPage+3] forState:UIControlStateNormal];
                [button5 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                button1.hidden=button2.hidden=button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=NO;
                
                
            }else
            {
                NSLog(@"oh,is %d",totalPage-currentPage);
                switch (totalPage-currentPage) {
                    case 1:
                    {
                        [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                        button1.hidden=button2.hidden=NO;
                        button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
                        
                    }
                        break;
                    case 2:
                    {
                        [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
                        [button3 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                        button1.hidden=button2.hidden=button3.hidden=NO;
                        button4.hidden=button5.hidden=buttonMore.hidden=YES;
                        
                    }
                        break;
                    case 3:
                    {
                        [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
                        [button3 setTitle:[NSString stringWithFormat:@"%d",currentPage+2] forState:UIControlStateNormal];
                        [button4 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                        button1.hidden=button2.hidden=button3.hidden=button4.hidden=NO;
                        button5.hidden=buttonMore.hidden=YES;
                        
                    }
                        break;
                    case 4:
                    {
                        [button1 setTitle:[NSString stringWithFormat:@"%d",currentPage] forState:UIControlStateNormal];
                        [button2 setTitle:[NSString stringWithFormat:@"%d",currentPage+1] forState:UIControlStateNormal];
                        [button3 setTitle:[NSString stringWithFormat:@"%d",currentPage+2] forState:UIControlStateNormal];
                        [button4 setTitle:[NSString stringWithFormat:@"%d",currentPage+3] forState:UIControlStateNormal];
                        [button5 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                        button1.hidden=button2.hidden=button3.hidden=button4.hidden=button5.hidden=NO;
                        buttonMore.hidden=YES;
                        
                    }
                        break;
                    default:
                    {
                        [button1 setTitle:[NSString stringWithFormat:@"%d",totalPage] forState:UIControlStateNormal];
                        
                        button1.hidden=NO;
                        button2.hidden=button3.hidden=button4.hidden=button5.hidden=buttonMore.hidden=YES;
                    }
                        break;
                }
                
            }
            
        }
            break;
    }
    
}
-(void)pushAction:(id)sender
{
    NSLog(@"%@",[idsArray objectAtIndex:[sender tag]]);
    [self.navigationController pushViewController:gzcbDetailViewController animated:YES];
    [gzcbDetailViewController loadInfoBySendRequest:[idsArray objectAtIndex:[sender tag]]];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
