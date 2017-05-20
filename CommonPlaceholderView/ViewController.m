//
//  ViewController.m
//  CommonPlaceholderView
//
//  Created by 蔡强 on 2017/5/15.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "CQPlaceholderView.h"
#import "UIView+Toast.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CQPlaceholderViewDelegate>

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UI搭建
    [self setUpUI];
}

#pragma mark - UI搭建
/** UI搭建 */
- (void)setUpUI{
    //------- 一个假的导航栏 -------//
    UIView *naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    [self.view addSubview:naviView];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:naviView.bounds];
    [naviView addSubview:titleLabel];
    titleLabel.text = @"假定这是导航栏";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.layer.borderColor = [UIColor blackColor].CGColor;
    titleLabel.layer.borderWidth = 3;
    
    //------- tableView -------//
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(naviView.frame), self.view.frame.size.width, self.view.frame.size.height - 64 - 49)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //------- 一个假的tabBar -------//
    UIView *tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 49, self.view.frame.size.width, 49)];
    [self.view addSubview:tabBarView];
    tabBarView.backgroundColor = [UIColor grayColor];
    UILabel *tabLabel = [[UILabel alloc]initWithFrame:tabBarView.bounds];
    [tabBarView addSubview:tabLabel];
    tabLabel.text = @"比如这是tabbar";
    tabLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"只覆盖tableView";
        }
            break;
            
        case 1:
        {
            cell.textLabel.text = @"露出导航栏";
        }
            break;
            
        case 2:
        {
            cell.textLabel.text = @"露出tabbar";
        }
            break;
            
        case 3:
        {
            cell.textLabel.text = @"覆盖整个页面";
        }
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: // 只覆盖tableView的占位图
        {
            CQPlaceholderView *placeholderView = [[CQPlaceholderView alloc]initWithFrame:tableView.bounds type:CQPlaceholderViewTypeNoOrder delegate:self];
            [tableView addSubview:placeholderView];
        }
            break;
            
        case 1: // 露出导航栏的占位图
        {
            CQPlaceholderView *placeholderView = [[CQPlaceholderView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) type:CQPlaceholderViewTypeNoGoods delegate:self];
            [self.view addSubview:placeholderView];
        }
            break;
            
        case 2: // 露出tabbar的占位图
        {
            CQPlaceholderView *placeholderView = [[CQPlaceholderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) type:CQPlaceholderViewTypeBeautifulGirl delegate:self];
            [self.view addSubview:placeholderView];
        }
            break;
            
        case 3: // 覆盖整个页面的占位图
        {
            CQPlaceholderView *placeholderView = [[CQPlaceholderView alloc]initWithFrame:self.view.bounds type:CQPlaceholderViewTypeNoNetwork delegate:self];
            [self.view addSubview:placeholderView];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Delegate - 占位图
/** 占位图的重新加载按钮点击时回调 */
- (void)placeholderView:(CQPlaceholderView *)placeholderView reloadButtonDidClick:(UIButton *)sender{
    switch (placeholderView.type) {
        case CQPlaceholderViewTypeNoGoods:       // 没商品
        {
            [self.view makeToast:@"买个球啊"];
        }
            break;
            
        case CQPlaceholderViewTypeNoOrder:       // 没有订单
        {
            [self.view makeToast:@"拉到就拉到"];
        }
            break;
            
        case CQPlaceholderViewTypeNoNetwork:     // 没网
        {
            [self.view makeToast:@"没网适合打排位"];
        }
            break;
            
        case CQPlaceholderViewTypeBeautifulGirl: // 妹纸
        {
            [self.view makeToast:@"哦，那你很棒棒哦"];
        }
            break;
            
        default:
            break;
    }
}

@end
