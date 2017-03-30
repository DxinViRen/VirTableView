

//
//  VirTableView.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirTableView.h"
#import "UITableView+VirStyle.h"
@implementation VirTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self = [super initWithFrame:frame style:style]){
    
        
    }
    return self;
}


/*设置tableView的状态值*/
-(void)setSecnumStyle:(VirTableViewStyle)secnumStyle{
    _secnumStyle = secnumStyle;
    if(_secnumStyle  == VirTableViewStyleMuiltSections){
        self.virStyle = @0;
    }else{
        self.virStyle = @1;
    }
}



@end
