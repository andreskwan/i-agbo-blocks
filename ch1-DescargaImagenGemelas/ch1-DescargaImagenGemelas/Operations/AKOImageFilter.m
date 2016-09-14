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

-(void) updateViewControllerBeforeBackground{
    
}

-(void) updateViewControllerAfterBackgroundWithImage:(UIImage *)image {
    
}

-(void) main {
    
    // crear un contexto
    
    // Creamos una CIIMage
    
    // Creamos un filtro de UIColor
    
    // Creamos una imagen de salida
    
    // Generamos la image de salida
    
    // Actualizamos en primer plano
}
@end
