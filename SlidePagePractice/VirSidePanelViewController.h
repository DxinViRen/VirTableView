//
//  VirSidePanelViewController.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/28.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,VirSidePanelStyle){
    
    VirSidePanelStyleSingleActive = 0,
    VirSidePanelStyleMultipleActive
};

typedef NS_ENUM(NSInteger,VirSidePanelState) {
    VirSidePanelStateCenterVisible = 0,
    VirSidePanelStateLeftVisible,
    VirSidePanelStateRightVisible
};
@interface VirSidePanelViewController : UIViewController
/*set the pannel*/
@property(nonatomic,strong)UIViewController * leftPanel; //optiona
@property(nonatomic,strong)UIViewController *centerPanel;//request
@property(nonatomic,strong)UIViewController *rightPannel;//optional
/*show the panel*/
-(void)showTheLeftPanelWithAnimated:(BOOL)animated;
-(void)showTheCenterPanelWithAnimated:(BOOL)animated;
-(void)showTheRightPanelWithAnimated:(BOOL)animated;
/**/

-(void)toggleTheLeftPanel:(id)sender;
-(void)toggleTheRightPannel:(id)sender;

/*当显示两侧的控制器的时候是否设置中间的显示器隐藏，是否带有动画*/
-(void)setCenterPanelHidden:(BOOL)centerPanelHidder animated:(BOOL)animated duration:(NSTimeInterval)dration;

#pragma mark - LOOk  or feel 
/*style*/
@property(nonatomic,assign)VirSidePanelStyle style; // 默认是 virSidepanelStyleSingleActive
@property(nonatomic,assign)BOOL pushsidePanels;
/*左边视图占据整个屏幕的百分比*/
@property(nonatomic,assign)CGFloat leftGapPercentage;
@property(nonatomic,assign)CGFloat leftFixedWidth;
/*左边视图的宽度*/
@property(nonatomic,assign)CGFloat leftVisibleWidth;




@property(nonatomic,assign)CGFloat rightGapPercentage;
@property(nonatomic,assign)CGFloat rightFixedWidth;
/*右边视图的宽度*/
@property(nonatomic,assign)CGFloat rightVisibleWidth;

-(void)styleContainer:(UIView *)container animate:(BOOL)animated  duration:(NSTimeInterval)duration;

-(void)stylePanel:(UIView *)panel;

#pragma mark - animation
@property(nonatomic,assign)CGFloat minimuMovePercentage;
@property(nonatomic,assign)CGFloat maxmunAnimationduration;
@property(nonatomic,assign)CGFloat bounceDuration;
@property(nonatomic,assign)CGFloat  bouncePercentage;
@property(nonatomic,assign)BOOL bounceOnSidePercentOpen;
@property(nonatomic,assign)BOOL  bounceOnsidePercentClose;
@property(nonatomic,assign)BOOL bounceOnCenterPanelChange;
@property (nonatomic) BOOL panningLimitedToTopViewController; // default is YES
@property(nonatomic,assign)BOOL recognizesPanGesture;


#pragma   mark - menu button

+(UIImage *)defaultImage;

-(UIBarButtonItem *)leftButtonForCentetPanel;


@property(nonatomic,assign)VirSidePanelState state;

@property(nonatomic,assign)BOOL centerPenalHidden;

@property(nonatomic,weak,readonly)UIViewController * visiblePenal;

@property(nonatomic,assign)BOOL shouldDelegateAutoratateToVisiblePanel;
@property(nonatomic,assign)BOOL canUnloadRightPanel;
@property(nonatomic,assign)BOOL canUnloadLeftPanel;
@property(nonatomic,assign)BOOL shouldResizeRightPanel;
@property(nonatomic,assign)BOOL shouldResizeLeftPanel;

@property (nonatomic, assign) BOOL allowRightOverpan; // defaults to YES
@property (nonatomic, assign) BOOL allowLeftOverpan;  // defaults to YES


@property(nonatomic,assign)BOOL allowRightSwipe;
@property(nonatomic,assign)BOOL allowLeftSwipe;



@property(nonatomic,strong,readonly)UIView  * leftPanelcontainer;
@property(nonatomic,strong,readonly)UIView * rightPanelContainer;
@property(nonatomic,strong,readonly)UIView *centerPanelContainer;






@end
