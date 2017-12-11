//
//  SectionModel.m
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "SectionModel.h"
#import "CellModel.h"
@implementation SectionModel
+ (instancetype)sectionWithDict:(NSDictionary *)dict{
    SectionModel * sec = [[self alloc]init];
    
    [sec setValuesForKeysWithDictionary:dict];
    
    return sec;
}

- (void)setItems:(NSArray *)items{
    NSMutableArray * mArr = [NSMutableArray array];
    for (id dict in items) {
        CellModel * model = [CellModel cellWithDict:dict];
        [mArr addObject:model];
    }
    _items = mArr;
}


@end
