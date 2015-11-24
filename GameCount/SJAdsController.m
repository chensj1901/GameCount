//
//  SJAdsController.m
//  bounceBall
//
//  Created by 陈少杰 on 15/6/29.
//
//

#import "SJAdsController.h"
#import "config.h"
#import <AdMoGoView.h>
#import <MobClick.h>
#import "AdMoGoInterstitialManager.h"
#import "AdsMOGOContent.h"
#import "SJSettingRecode.h"

static SJAdsController *_adsController;

@interface SJAdsController ()<AdMoGoDelegate,AdMoGoWebBrowserControllerUserDelegate,AdMoGoViewAnimationDelegate,AdMoGoInterstitialDelegate>
@property(nonatomic)AdMoGoInterstitial *interstitialIns;
@end

@implementation SJAdsController
@synthesize adMoGoView=_adMoGoView;
@synthesize adMoGoFullView=_adMoGoFullView;

+(SJAdsController *)shareController{
    if(!_adsController){
        _adsController=[[SJAdsController alloc]init];
        
        AdMoGoInterstitial *interstitialIns = [[AdMoGoInterstitialManager shareInstance] adMogoInterstitialByAppKey:ADS_MOGO_APPKEY];
        interstitialIns.delegate = self;
        interstitialIns.adWebBrowswerDelegate = self;
        [interstitialIns refreshAd];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:_adsController
                                                 selector:@selector(statusDidChange:) name:@"AdMoGoInterstitialStatusChangeNotification"
                                                   object:nil];
        
        _adsController.interstitialIns=interstitialIns;
    }
    return _adsController;
}

+(void)showAdsBanner{
    SJAdsController *ads=[self shareController];
    [ads showAdsBanner];
}

+(void)removeAdsBanner{
    [[self shareController]removeAdsBanner];
}

+(void)showAdsFullScreen{
    SJAdsController *ads=[self shareController];
    [ads showAdsFullScreen];
    
}

+(void)removeAdsFullScreen{
    SJAdsController *ads=[self shareController];
    [ads removeAdsFullScreen];
}
- (void)statusDidChange:(NSNotification *)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    
    
    NSLog(@"%@",[self titleByStatusCode:[[userInfo objectForKey:@"status"] intValue]]);
    
}

- (NSString *)titleByStatusCode:(int)scode{
    
    NSString *title = @"未知";
    switch (scode) {
        case 0:
            title = @"轮换中";
            break;
        case 1:
            title = @"等展示";
            break;
        case 2:
            title = @"展示中";
            break;
        case 3:
            title = @"等重启";
            break;
        case 4:
            title = @"已过期";
            break;
        case 5:
            title = @"已销毁";
            break;
        default:
            break;
    }
    
    return title;
    
}

-(AdMoGoView *)adMoGoView{
    if (!_adMoGoView) {
        _adMoGoView=[[AdMoGoView alloc]initWithAppKey:ADS_MOGO_APPKEY adType:AdViewTypeNormalBanner adMoGoViewDelegate:self adViewPointType:AdMoGoViewPointTypeDown_middle];
        _adMoGoView.adWebBrowswerDelegate=self;
        _adMoGoView.adAnimationDelegate=self;
    }
    return _adMoGoView;
}

-(AdMoGoView *)adMoGoFullView{
    if (!_adMoGoFullView) {
        _adMoGoFullView=[[AdMoGoView alloc]initWithAppKey:ADS_MOGO_APPKEY adType:AdViewTypeFullScreen adMoGoViewDelegate:self];
        _adMoGoFullView.adWebBrowswerDelegate=self;
        _adMoGoFullView.adAnimationDelegate=self;
        
    }
    return _adMoGoFullView;
}


-(void)showAdsFullScreen{
    [self.interstitialIns interstitialShow:YES];
    [self.interstitialIns refreshAd];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.interstitialIns interstitialShow:YES];
//    });
    //    UIWindow *mainWindow=[[[UIApplication sharedApplication]windows]objectAtIndex:0];
    //    [mainWindow addSubview:self.adMoGoFullView];
}

-(void)removeAdsFullScreen{
    [self.adMoGoFullView removeFromSuperview];
    self.adMoGoFullView=nil;
}


-(void)showAdsBanner{
    UIWindow *mainWindow=[[[UIApplication sharedApplication]windows]objectAtIndex:0];
    for (UIView *v in [mainWindow subviews]) {
        if ([v isKindOfClass:[AdMoGoView class]]) {
            [v removeFromSuperview];
        }
    }
    
    [mainWindow addSubview:self.adMoGoView];
    

}

-(void)removeAdsBanner{
    [self.adMoGoView removeFromSuperview];
    self.adMoGoView=nil;
}

#pragma mark -
#pragma mark AdMoGoDelegate delegate

- (UIViewController *)viewControllerForPresentingModalView{
    UIWindow *mainWindow=[[[UIApplication sharedApplication]windows]objectAtIndex:0];
    id vc=mainWindow.rootViewController;
    return vc;
}


- (void)adsMoGoInterstitialAdDidDismiss{
    [self.interstitialIns interstitialCancel];
}

- (UIViewController *)viewControllerForPresentingInterstitialModalView{
    return [self viewControllerForPresentingModalView];
}

- (BOOL)adsMogoInterstitialAdDidExpireAd{
    return NO;
}

//-adsin

- (void)adMoGoFullScreenAdReceivedRequest{
    NSLog(@"全屏广告 接收成功");
}
- (void)adMoGoFullScreenAdFailedWithError:(NSError *) error{
    NSLog(@"全屏广告 接收失败");
}
- (void)adMoGoWillPresentFullScreenAdModal{
    NSLog(@"全屏广告展示");
}
- (void)adMoGoDidDismissFullScreenAdModal{
    NSLog(@"全屏广告消失");
}


- (void)adMoGoDidStartAd:(AdMoGoView *)adMoGoView{
    NSLog(@"广告开始请求回调");}


- (void)adMoGoDidReceiveAd:(AdMoGoView *)adMoGoView{
    [MobClick event:@"01-01"];
    
    NSLog(@"%@",NSStringFromCGRect(adMoGoView.frame));
    CGRect frame=adMoGoView.frame;
    frame.origin.y=[UIScreen mainScreen].bounds.size.height-50;
    frame.origin.x=([UIScreen mainScreen].bounds.size.width-frame.size.width)/2;
    adMoGoView.frame=frame;
    NSLog(@"广告接收成功回调");
    
    
}

-(void)adMogoDidReceiveFullScreenAd:(NSNotification*)notification{
    //    [MobClick event:@"01-01"];
    //
    //    UIWindow *mainWindow=[[[UIApplication sharedApplication]windows]objectAtIndex:0];
    //    [mainWindow addSubview:notification.object];
    //
    
}

- (void)adMoGoDidFailToReceiveAd:(AdMoGoView *)adMoGoView didFailWithError:(NSError *)error{
    NSLog(@"广告接收失败回调");
    
}

- (void)adMoGoClickAd:(AdMoGoView *)adMoGoView{
    [MobClick event:@"01-02"];
    NSLog(@"点击广告回调");
}

- (void)adMoGoDeleteAd:(AdMoGoView *)adMoGoView{
    NSLog(@"广告关闭回调");
}

-(void)adMoGoWillPresentFullScreenModal{
    [SJAdsController shareController].adMoGoView.hidden=YES;
}

-(void)adMoGoDidDismissFullScreenModal{
    [SJAdsController shareController].adMoGoView.hidden=NO;
}

#pragma mark -
#pragma mark AdMoGoWebBrowserControllerUserDelegate delegate


- (void)webBrowserWillAppear{
    NSLog(@"浏览器将要展示");
    [SJAdsController removeAdsBanner];
}

- (void)webBrowserDidAppear{
    NSLog(@"浏览器已经展示");
}

- (void)webBrowserWillClosed{
    [SJAdsController showAdsBanner];
    NSLog(@"浏览器将要关闭");
}

- (void)webBrowserDidClosed{
    NSLog(@"浏览器已经关闭");
}

-(void)AfterAdAnimationBegin{
    
}

-(void)AfterAdAnimationFinish{
    
}

-(BOOL)shouldAlertQAView:(UIAlertView *)alertView{
    return NO;
}

- (void)webBrowserShare:(NSString *)url{
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end



