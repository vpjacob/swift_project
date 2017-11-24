//
//  JJHomeModel.m
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/23.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJHomeModel.h"
@class JJDatasetModel;
@class JJHomeRowModel;
@implementation JJHomeModel
//formDataset

+ (NSValueTransformer *)formDatasetJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:JJDatasetModel.class];
}


@end


@implementation JJDatasetModel

@end


@implementation JJHomeRowModel

- (NSString *)img_url{
    return [NSString stringWithFormat:@"http://www.ppke.cn/%@",_img_url];
}

@end
