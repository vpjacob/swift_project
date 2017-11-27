//
//  JJShangJiaModel.m
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJShangJiaModel.h"

@implementation JJShangJiaModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    NSMutableDictionary *muDic = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary mtl_identityPropertyMapWithModel:self.class]];
    muDic[@"id_home"] = @"id";
    return muDic;
}
- (NSString *)image_url{
    return [NSString stringWithFormat:@"http://www.ppke.cn%@",_image_url];
}
@end




@implementation JJShangJiaTypeIconModel

- (NSString *)image{
    return [NSString stringWithFormat:@"http://www.ppke.cn%@",_image];
}

@end
