//
//  AdMoGoAdapterAdwo.h
//  TestMOGOSDKAPP
//
//  Created by MOGO on 12-10-26.
//  Copyright (c) 2012年 Mogo. All rights reserved.
//


#import "AdMoGoAdNetworkAdapter.h"
#import "AdwoAdSDK.h"

ADWO_SDK_WITHOUT_PASSKIT_FRAMEWORK(...)

@interface AdMoGoAdapterAdwo :AdMoGoAdNetworkAdapter<AWAdViewDelegate>{
    
    BOOL isSuccess;
    BOOL isStop;
    CGRect frame;
    UIView *adView;
    NSTimer *timer;
    BOOL isStopTimer;
    BOOL isLoaded;
}
+ (AdMoGoAdNetworkType)networkType;
@end
