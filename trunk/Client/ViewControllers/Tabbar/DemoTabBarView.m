//
//  DemoTabBarView.m
//  iTotemFramework
//
//  Created by Sword on 13-1-30.
//  Copyright (c) 2013年 iTotemStudio. All rights reserved.
//

#import "DemoTabBarView.h"

@interface DemoTabBarView()
{
    UIButton        *_selectedButton;    
}

@property (strong, nonatomic) IBOutlet UIButton *tab1Button;
@property (strong, nonatomic) IBOutlet UIButton *tab2Button;
@property (strong, nonatomic) IBOutlet UIButton *tab3Button;
@property (strong ,nonatomic) IBOutlet UIButton *tab4Button;
@property (strong, nonatomic) IBOutlet UIButton *tab5Button;

@end

@implementation DemoTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    _selectedButton = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - public methods
- (void) setSelectedIndex:(NSInteger)selectedIndex
{
    [self selectTabAtIndex:selectedIndex];
}

#pragma mark - private methods
- (void)selectTabAtIndex:(int)index
{
    //    _selectedButton.selected = FALSE;
    switch (index) {
        case 0:{
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateNormal];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateHighlighted];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateSelected];
            
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2.png"] forState:UIControlStateNormal];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateHighlighted];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateSelected];
            
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3.png"] forState:UIControlStateNormal];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateHighlighted];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateSelected];
            _selectedButton = _tab1Button;
            break;
        }
        case 1:{
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateNormal];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateHighlighted];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateSelected];
            
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1.png"] forState:UIControlStateNormal];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateHighlighted];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateSelected];
            
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3.png"] forState:UIControlStateNormal];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateHighlighted];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateSelected];
            _selectedButton = _tab2Button;
            break;
        }
        case 2:{
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1.png"] forState:UIControlStateNormal];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateHighlighted];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateSelected];
            
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2.png"] forState:UIControlStateNormal];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateHighlighted];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateSelected];            
            
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateNormal];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateHighlighted];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateSelected];
            _selectedButton = _tab3Button;
            break;
        }
            
        case 3:{
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateNormal];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateHighlighted];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateSelected];
            
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2.png"] forState:UIControlStateNormal];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateHighlighted];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateSelected];
            
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3.png"] forState:UIControlStateNormal];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateHighlighted];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateSelected];
            _selectedButton = _tab1Button;
            break;
        }
        case 4:{
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateNormal];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateHighlighted];
            [_tab1Button setBackgroundImage:[UIImage imageNamed:@"tab_1_selected.png"] forState:UIControlStateSelected];
            
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2.png"] forState:UIControlStateNormal];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateHighlighted];
            [_tab2Button setBackgroundImage:[UIImage imageNamed:@"tab_2_selected.png"] forState:UIControlStateSelected];
            
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3.png"] forState:UIControlStateNormal];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateHighlighted];
            [_tab3Button setBackgroundImage:[UIImage imageNamed:@"tab_3_selected.png"] forState:UIControlStateSelected];
            _selectedButton = _tab1Button;
            break;
        }
        default:
            break;
    }
}

- (IBAction)onTab1BtnClicked
{
    if ([self shouldSelectTab:0]) {
        [self selectTabAtIndex:0];
        [self notifyDelegate:0];
    }
}

- (IBAction)onTab2BtnClicked
{
    if ([self shouldSelectTab:1]) {
        [self selectTabAtIndex:1];
        [self notifyDelegate:1];
    }
}

- (IBAction)onTab3BtnClicked
{
    if ([self shouldSelectTab:2]) {
        [self selectTabAtIndex:2];
        [self notifyDelegate:2];
    }
}

- (IBAction)onTab4BtnClicked
{
    if ([self shouldSelectTab:3]) {
        [self selectTabAtIndex:3];
        [self notifyDelegate:3];
    }
}

- (IBAction)onTab5BtnClicked
{
    if ([self shouldSelectTab:4]) {
        [self selectTabAtIndex:4];
        [self notifyDelegate:4];
    }
}
@end
