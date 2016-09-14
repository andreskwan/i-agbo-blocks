//
//  AKOImageFilter.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/13/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "AKOImageFilter.h"
#import "ViewController.h"

@interface AKOImageFilter ()
@property (nonatomic, strong) ViewController * mainVC;
@end

@implementation AKOImageFilter

- (id)initWithImageViewController: (ViewController *)vc
{
    self = [super init];
    if (self) {
        _mainVC = vc;
    }
    return self;
}
@end
