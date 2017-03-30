//
//  VirSidePanelViewController.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/28.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirSidePanelViewController.h"

@interface VirSidePanelViewController (){
    CGRect _centerPanelResetingFrame;
    CGPoint _locationBeforePan;
}
@property(nonatomic,weak)UIViewController  * visiblePanel;

@property(nonatomic,strong)UIView * tapView;
// panel containers
@property (nonatomic, strong) UIView *leftPanelContainer;
@property (nonatomic, strong) UIView *rightPanelContainer;
@property (nonatomic, strong) UIView *centerPanelContainer;


@end

@implementation VirSidePanelViewController
@synthesize leftPanelcontainer;
@synthesize tapView = _tapView;
@synthesize state = _state;
@synthesize style = _style;
@synthesize leftPanel = _leftPanel;
@synthesize centerPanel = _centerPanel;
@synthesize rightPannel = _rightPannel;
@synthesize leftGapPercentage = _leftGapPercentage;
@synthesize leftFixedWidth = _leftFixedWidth;
@synthesize rightGapPercentage = _rightGapPercentage;
@synthesize minimuMovePercentage = _minimumMovePercentage;
@synthesize maxmunAnimationduration = _maximumAnimationDuration;
@synthesize bounceDuration = _bounceDuration;
@synthesize bouncePercentage = _bouncePercentage;
@synthesize panningLimitedToTopViewController = _panningLimitedToTopViewController;
@synthesize recognizesPanGesture = _recognizesPanGesture;
@synthesize canUnloadRightPanel = _canUnloadRightPanel;
@synthesize canUnloadLeftPanel = _canUnloadLeftPanel;
@synthesize shouldResizeLeftPanel = _shouldResizeLeftPanel;
@synthesize shouldResizeRightPanel = _shouldResizeRightPanel;
@synthesize allowLeftSwipe = _allowLeftSwipe;
@synthesize allowRightSwipe = _allowRightSwipe;
@synthesize bounceOnSidePercentOpen = _bounceOnSidePanelOpen;
@synthesize bounceOnsidePercentClose = _bounceOnSidePanelClose;
//@synthesize bounceOnCenterPanelChange = _bounceOnCenterPanelChange;
@synthesize visiblePanel = _visiblePanel;
@synthesize shouldDelegateAutoratateToVisiblePanel = _shouldDelegateAutorotateToVisiblePanel;
@synthesize allowLeftOverpan = _allowLeftOverpan;
@synthesize allowRightOverpan  = _allowRightOverpan;
@synthesize pushsidePanels = _pushesSidePanels;
@synthesize bounceOnCenterPanelChange = _bounceOnCenterPanelChange;


+(UIImage *)defaultImage{
    static UIImage *defaultImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20.0f, 13.0f), NO, 0.0f);
        [[UIColor blackColor]setFill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 20, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 5, 20, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 10, 20, 1)] fill];
        
        
        [[UIColor whiteColor]setFill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 1, 20, 2)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 60, 20, 2)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 11, 0, 2)] fill];
        
        
        defaultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    });
    
     return defaultImage;
}


#pragma mark - NSObject
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self _baseInit];
    }
    return self;
}


-(instancetype)init{
    if(self = [super init]){
    
        [self _baseInit];
    }
    return self;
}

-(void)_baseInit{
    
    self.style = VirSidePanelStyleSingleActive;
    self.leftGapPercentage = 0.8f;
    self.rightGapPercentage = 0.8f;
    self.minimuMovePercentage = 0.15f;
    self.maxmunAnimationduration = 0.2f;
    self.bounceDuration = 0.1f;
    self.bouncePercentage = 0.075f;
    self.panningLimitedToTopViewController = YES;
    self.recognizesPanGesture = YES;
    self.allowLeftOverpan = YES;
    self.allowRightOverpan = YES;
    self.bounceOnSidePercentOpen = YES;
    self.bounceOnsidePercentClose = NO;
    self.bounceOnCenterPanelChange = YES;
    self.shouldDelegateAutoratateToVisiblePanel = YES;
    self.allowRightSwipe = YES;
    self.allowLeftSwipe = YES;
}

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.centerPanelContainer = [[UIView alloc]initWithFrame:self.view.bounds];
    _centerPanelResetingFrame = self.centerPanelContainer.frame;
    _centerPenalHidden = NO ;
    self.leftPanelContainer = [[UIView alloc]initWithFrame:self.view.bounds];
    self.leftPanelContainer.hidden = YES;
    
    self.rightPanelContainer = [[UIView alloc]initWithFrame:self.view.bounds];
    self.rightPanelContainer.hidden = YES;
    [self _configContainers];
    
    
    [self.view addSubview:self.leftPanelContainer];
    [self.view addSubview:self.rightPanelContainer];
    [self.view addSubview:self.centerPanelContainer];
    
    self.state = VirSidePanelStateRightVisible;
    
    [self _swaCenter:nil previousState:VirSidePanelStateCenterVisible with:_centerPanel];
    [self.view bringSubviewToFront:self.centerPanelContainer];
}
-(void)_configContainers{
    
    self.leftPanelContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.rightPanelContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.centerPanelContainer.frame = self.view.bounds;
    self.centerPanelContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
}



-(void)_swaCenter:(UIViewController *)previous previousState:(VirSidePanelState)previousState with:(UIViewController *)next{
    if(previous != next){
        [previous willMoveToParentViewController:nil];
        [previous.view removeFromSuperview];
        [previous removeFromParentViewController];
    }
    
    if(next){
        [self _loadCenterPanelWithPreviousState:previousState];
    }
    
}

#pragma mark - loadingPanels
-(void)_loadCenterPanelWithPreviousState:(VirSidePanelState)previousState{
    [self _placeButtonForLeftPanel];
    
}

#pragma mark - places Panel Buttons

-(void)_placeButtonForLeftPanel{

    
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
