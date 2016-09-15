//
//  AKOImageFilter.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/13/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "AKOImageFilter.h"


@import CoreImage;

@interface AKOImageFilter ()
@property (nonatomic, strong) ViewController * imageVC;
@end

@implementation AKOImageFilter

- (id)initWithImageViewController: (ViewController *)vc
{
    self = [super init];
    if (self) {
        _imageVC = vc;
    }
    return self;
}

-(void) updateViewControllerBeforeBackground{
    [self.imageVC.activityView startAnimating];
}

-(void) updateViewControllerAfterBackgroundWithImage:(UIImage *)image {
    self.imageVC.photoView.image = image;
    [self.imageVC.activityView stopAnimating];
}

-(void) main {
    // Actualizamos en main thread
    [self performSelectorOnMainThread:@selector(updateViewControllerBeforeBackground)
                           withObject:nil
                        waitUntilDone:NO];
    
    // crear un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // Creamos una CIIMage
    CIImage *image = [CIImage imageWithCGImage:self.imageVC.photoView.image.CGImage];
    
    // Creamos un filtro de color
    CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:image
                  forKey:kCIInputImageKey];
    
    // Creamos filtro de viñeta
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@30
                forKey:kCIInputIntensityKey];
    
    // Creamos una imagen de salida para el falseColor filter
    CIImage *output = falseColor.outputImage;
    
    // encadenar los filtros
    [vignette setValue:output forKey:kCIInputImageKey];
    
    // ahora se necesita una referencia a la salida del sugundo filtro
    output = vignette.outputImage;
    
    // Generamos la image de salida
    CGImageRef res = [context createCGImage:output
                                   fromRect:[output extent]];
    
    // Actualizamos en main thread
    [self performSelectorOnMainThread:@selector(updateViewControllerAfterBackgroundWithImage:)
                           withObject:[UIImage imageWithCGImage:res]
                        waitUntilDone:NO];
    
    // Liberar la CGImageRef
    CGImageRelease(res);
    
}
@end
