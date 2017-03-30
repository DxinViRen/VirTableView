//
//  VirViewController.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirViewController.h"
#import "VirTableView.h"
#import "VirTableViewCellItem.h"
#import "VirTableViewDataSource.h"
#import "VirTableViewCell.h"
#define kscreenW    [[UIScreen mainScreen]bounds].size.width
#define kscreenH     [[UIScreen mainScreen]bounds].size.height
@interface VirViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
       NSMutableArray * _dataSourceArray;

}


@property(nonatomic,retain)VirTableView * tableView;

@property(nonatomic,retain)VirTableViewDataSource *dataSource;
@end

@implementation VirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepare];
}

/*初始化*/
-(void)prepare{
    
    //初始化数据源
    _dataSourceArray = [[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        VirTableViewCellItem * item = [[VirTableViewCellItem alloc]init];
        [_dataSourceArray addObject:item];
    }
    
    self.tableView = [[VirTableView alloc]initWithFrame:CGRectMake(0, 0,kscreenW,kscreenH) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.secnumStyle = VirTableViewStyleSingleSection;
    self.dataSource = [[VirTableViewDataSource alloc]_initWithDataSource:_dataSourceArray cellIdentifier:@"idefier" cellHandle:^(VirTableViewCell *cell, VirTableViewCellItem *cellItem, NSIndexPath *indexPath) {
        //这里设置Cell的数据
        [cell placeCellDataWithItem:cellItem];
    }];
    
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
}



#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  44.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
