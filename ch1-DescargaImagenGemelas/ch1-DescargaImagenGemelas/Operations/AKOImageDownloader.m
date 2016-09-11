//
//  AKOImageDownloader.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/11/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "AKOImageDownloader.h"
static NSString * kMarianaDavalosUrl = @"https://pixabay.com/static/uploads/photo/2016/08/19/18/50/fruit-1605921_960_720.jpg";

@interface AKOImageDownloader ()
@property (strong, nonatomic) ViewController *imageVC;
@end

@implementation AKOImageDownloader

-(id) initWithImageViewController:(ViewController *) vc {
    if (self = [super init]) {
        self.imageVC = vc;
    }
    return self;
}

-(void) main {
    //what goes inside the dispatch_async
    NSURL *url = [NSURL URLWithString:kMarianaDavalosUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //actualizar interface del VC
    //pero esto debe ejecutarse en primer plano
    //main va en segundo plano
    self.imageVC.photoView.image = image;
    
}

-(void) updateViewControllerWithImage: (UIImage *) image {
    self.imageVC.photoView.image = image;
    [self.imageVC.activityView stopAnimating];
}
@end

