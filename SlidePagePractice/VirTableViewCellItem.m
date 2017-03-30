//
//  VirTableViewCellItem.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirTableViewCellItem.h"

@implementation VirTableViewCellItem
@synthesize childItems;
-(instancetype)init{
    if(self = [super init]){
    
        self.childItems = [[NSMutableArray alloc]init];
    }
    return self;
}
@end
