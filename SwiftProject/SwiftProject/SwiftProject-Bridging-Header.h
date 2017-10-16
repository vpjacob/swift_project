//
//  SwiftProject-Bridging-Header.h
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/16.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

#ifndef SwiftProject_Bridging_Header_h
#define SwiftProject_Bridging_Header_h

#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif


#endif /* SwiftProject_Bridging_Header_h */
