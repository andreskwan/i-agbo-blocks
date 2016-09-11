//
//  AKOImageDownloader.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/11/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "AKOImageDownloader.h"
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


@end

