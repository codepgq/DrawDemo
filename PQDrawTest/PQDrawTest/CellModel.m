//
//  CellModel.m
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (instancetype)cellWithDict:(NSDictionary *)dict{
    CellModel * cell = [[self alloc]init];
    [cell setValuesForKeysWithDictionary:dict];
    return cell;
}

@end
