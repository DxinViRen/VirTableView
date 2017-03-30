//
//  VirTableViewDelegate.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/30.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirTableViewDelegate.h"

@interface VirTableViewDelegate ()

@property(nonatomic,copy)cellHeightBlock handle;

@end
@implementation VirTableViewDelegate

-(instancetype)initWithCallBackHandle:(cellHeightBlock)handle{
    if(self = [super init]){
    
    }
    self.handle = [handle copy];
    return self;
}


#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(self.handle){
        return  self.handle(indexPath);
    }else{
        return 0;
    }
}
@end
