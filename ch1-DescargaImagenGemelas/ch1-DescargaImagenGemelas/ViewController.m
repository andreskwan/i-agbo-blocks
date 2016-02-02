//
//  ViewController.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 2/1/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "ViewController.h"
#define DAVALOS_URL @"http://cdn.playbuzz.com/cdn/47169acc-3907-48cb-88fb-c13f98a556ad/52405eb3-f4d7-4ce1-93d0-d0c807bd9764.jpg"
static NSString * kMarianaDavalosUrl = @"http://landofthefreeish.com/wp-content/uploads/2011/03/mariana-davalos-maxim-07.jpg";

@interface ViewController ()

@end

@implementation ViewController
- (UIImage *)getDavalosImage {
    // permitir que se modifique dentro del bloque y quede disponible fuera de el
    __block NSData *imageData = nil;
    __block UIImage * image = nil;
    
    // crear una cola
    dispatch_queue_t gemelas = dispatch_queue_create("colaDavalos", 0);
    
    // enviar un bloque que se ejecute en 2do plano
    // esta devuelve inmediatamente, aun cuando no se ha ejecutado, por que pasa a segundo plano
    dispatch_async(gemelas, ^{
        NSURL *url = [NSURL URLWithString:kMarianaDavalosUrl];
        imageData = [NSData dataWithContentsOfURL:url];
        
        //presentar en primer plano o en la cola principal
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:imageData];
            self.photoView.image = image;
        });
    });
    // but the image is nil because the execution in the "colaDavalos" thread is completed after this
    // image has been returned. 
    return image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(UIButton *)sender {

}
@end
