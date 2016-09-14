//
//  AKOImageFilter.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/13/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "AKOImageFilter.h"
#import "ViewController.h"

@import CoreImage;

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

-(void) updateViewControllerBeforeBackground{
    
}

-(void) updateViewControllerAfterBackgroundWithImage:(UIImage *)image {
    
}

-(void) main {
    // Actualizamos en main thread
    [self performSelectorOnMainThread:@selector(updateViewControllerBeforeBackground)
                           withObject:nil
                        waitUntilDone:NO];
    
    // crear un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // Creamos una CIIMage
    CIImage *image = [CIImage imageWithCGImage:self.mainVC.photoView.image.CGImage];
    
    // Creamos un filtro de color
    CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:image
                  forKey:kCIInputImageKey];
    
    // Creamos una imagen de salida
    CIImage *output = falseColor.outputImage;
    
    // Generamos la image de salida
    CGImageRef res = [context createCGImage:output
                                   fromRect:[output extent]];
    
    // Actualizamos en main thread
    [self performSelectorOnMainThread:@selector(updateViewControllerAfterBackgroundWithImage:)
                           withObject:image
                        waitUntilDone:NO];
    
    // Liberar la CGImageRef
    CGImageRelease(res);
    
}
@end
