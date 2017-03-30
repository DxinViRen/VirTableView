//
//  UITableView+VirStyle.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "UITableView+VirStyle.h"
#import <objc/runtime.h>

#define virStyleKey  "virStyleKey"
@implementation UITableView (VirStyle)


-(void)setVirStyle:(NSNumber *)virStyle{
   
     objc_setAssociatedObject(self, virStyleKey, virStyle, OBJC_ASSOCIATION_COPY_NONATOMIC);
     
    
}

-(NSNumber *)getVirStyle{
 
    return objc_getAssociatedObject(self, virStyleKey);
}

@end
