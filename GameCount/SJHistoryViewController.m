//
//  SJHistoryViewController.m
//  GameCount
//
//  Created by 陈少杰 on 15/2/12.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJHistoryViewController.h"
#import "SJHistoryView.h"
#import "SJGameMarkRecode.h"
#import "SJGameMark.h"
#import "SJHistoryCell.h"

@interface SJHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)NSMutableArray *gameMarks;
@property(nonatomic)SJHistoryView *mainView;
@end

@implementation SJHistoryViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        IOS7_LAYOUT();
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadGameMarks];
    
    [self.mainView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)loadGameMarks{
    [self.gameMarks removeAllObjects];
    NSArray *gameMarkDics=[SJGameMarkRecode getGameMarks];
    for (NSDictionary *dic in gameMarkDics) {
        SJGameMark *gameMark=[[SJGameMark alloc]initWithDictionary:dic];
        [self.gameMarks addObject:gameMark];
    }
    [self.mainView.detailTableView reloadData];
}

-(SJHistoryView *)mainView{
    if (!_mainView) {
        _mainView=[[SJHistoryView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _mainView.detailTableView.dataSource=self;
        _mainView.detailTableView.delegate=self;
    }
    return _mainView;
}

-(void)loadView{
    self.view=self.mainView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"his";
    SJHistoryCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[SJHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    SJGameMark *gameMark=[self.gameMarks safeObjectAtIndex:indexPath.row];
    [cell loadGameMark:gameMark];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.gameMarks count];
}



-(NSMutableArray *)gameMarks{
    if (!_gameMarks) {
        _gameMarks=[[NSMutableArray alloc]init];
    }
    return _gameMarks;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick beginLogPageView:@"历史页"];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [MobClick endLogPageView:@"历史页"];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
