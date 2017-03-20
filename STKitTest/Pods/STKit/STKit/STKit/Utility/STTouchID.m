//
//  STTouchID.m
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/28.
//  Copyright (c) 2015年 st. All rights reserved.
//

#import "STTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation STTouchID

/* 显示TouchID警示 */
+ (void)showTouchIDAuthenticationWithReason:(NSString *)reason
                                 completion:(void (^)(TouchIDResult result))completion
{
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error = nil;
    // 确定是否能评估一个特定的策略
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                            error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reason
                          reply:^(BOOL success, NSError *error) {
            if(success)
            {
                completion(TouchIDResultSuccess);
            }
            else
            {
                switch(error.code)
                {
                    case LAErrorAuthenticationFailed:
                        completion(TouchIDResultAuthenticationFailed);
                        break;
                    case LAErrorUserCancel:
                        completion(TouchIDResultUserCancel);
                        break;
                    case LAErrorUserFallback:
                        completion(TouchIDResultUserFallback);
                        break;
                    case LAErrorSystemCancel:
                        completion(TouchIDResultSystemCancel);
                        break;
                    default:
                        completion(TouchIDResultError);
                        break;
                }
            }
        }];
    }
    else
    {
        switch(error.code)
        {
            case LAErrorPasscodeNotSet:
                completion(TouchIDResultPasscodeNotSet);
                break;
            case LAErrorTouchIDNotAvailable:
                completion(TouchIDResultNotAvailable);
                break;
            case LAErrorTouchIDNotEnrolled:
                completion(TouchIDResultNotEnrolled);
                break;
            default:
                completion(TouchIDResultError);
                break;
        }
    }
}
@end
