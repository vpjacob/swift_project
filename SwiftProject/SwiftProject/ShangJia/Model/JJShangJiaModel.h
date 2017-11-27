//
//  JJShangJiaModel.h
//  SwiftProject
//
//  Created by 刘毅 on 2017/11/27.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#import "JJBaseModel.h"

@interface JJShangJiaModel : JJBaseModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger order_index;
@property (nonatomic, strong) NSString *id_home;
@property (nonatomic, strong) NSString *image_url;
@property (nonatomic, strong) NSString *skip_id;
@property (nonatomic, strong) NSString *create_time;
@end



@interface JJShangJiaTypeIconModel : JJBaseModel
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *parent_uuid;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *name;
@end



