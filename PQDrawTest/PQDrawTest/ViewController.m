//
//  ViewController.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "ViewController.h"
#import "PQTBDataSource.h"
#import "PQTBDelegate.h"
#import "SectionModel.h"
#import "CellModel.h"
#import "DrawDownloadViewcontroller.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) PQTBDataSource * dataSource;
@property (nonatomic,strong) PQTBDelegate * delegate;
@property (nonatomic,strong) NSMutableArray * array;
@end

@implementation ViewController

static NSString * const Identifier = @"cell";

- (NSMutableArray *)array{
    if (!_array) {
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Draw" ofType:@"plist"]];
        _array = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_array addObject:[SectionModel sectionWithDict:obj]];
        }];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataSource = [PQTBDataSource dataSourceWith:self.array identifier:Identifier cellConfigBlock:^(UITableViewCell *  _Nullable cell, id  _Nullable item) {
        cell.textLabel.text = [item name];
    }];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    self.myTableView.dataSource = self.dataSource;
    
    self.delegate = [[PQTBDelegate alloc]initWithdelegate:self.array identifier:Identifier cellSelectedBlock:^(id  _Nullable cell, id  _Nullable item) {
        if ([[item controller] isEqualToString:@"DrawDownloadViewController"]) {
            DrawDownloadViewcontroller * download = [DrawDownloadViewcontroller loadForStoryboard];
            [self.navigationController pushViewController:download animated:YES];
        }
        else{
            Class cls = NSClassFromString([item controller]);
            
            [self.navigationController pushViewController:[[cls alloc] init] animated:YES];
        }
    }];
    self.myTableView.delegate = self.delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
