//
//  VirTableViewDataSource.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirTableViewDataSource.h"
#import "UITableView+VirStyle.h"
#import "VirTableViewCellItem.h"
#import "VirTableViewCell.h"
@interface VirTableViewDataSource ()<UITableViewDataSource>
@property(nonatomic,strong)NSArray * dataSource;
@property(nonatomic,copy)NSString * identifier;
@property(nonatomic,copy)virCellBlock  handle;

@end
@implementation VirTableViewDataSource

-(instancetype)_initWithDataSource:(NSArray *)dataSource cellIdentifier:(NSString *)identifier cellHandle:(virCellBlock)handle{
    if(self = [super init]){
    
        self.dataSource  = dataSource;
        self.identifier  = identifier;
        self.handle = [handle copy];
    }
    return self;
}

-(VirTableViewCellItem *)_itemIndex:(NSIndexPath *)indexPath{
    
    //返回的是最外层的对象
    return  self.dataSource[(NSUInteger)indexPath.row];
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.dataSource.count>section){
        
        
    if([@0  isEqual:tableView.virStyle]){
            VirTableViewCellItem * source = [self.dataSource objectAtIndex:(NSUInteger)section];
            return source.childItems.count;
    }else{
        return self.dataSource.count;
    }
    }else  return 0;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if([@0  isEqual:tableView.virStyle]){
       
        return  self.dataSource.count;
    }else{
        return 1;
    }
}

-(VirTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VirTableViewCell * cell =(VirTableViewCell *) [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if(cell == nil){
        cell = [[VirTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.identifier];
    }
    VirTableViewCellItem * item = [self _itemIndex:indexPath];
    self.handle(cell,item,indexPath);
    return cell;
}


@end
