//
//  CellModel.h
//  刘振tableviewdemo
//
//  Created by ios on 16/8/11.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * controller;

+ (instancetype)cellWithDict:(NSDictionary *)dict;

@end
