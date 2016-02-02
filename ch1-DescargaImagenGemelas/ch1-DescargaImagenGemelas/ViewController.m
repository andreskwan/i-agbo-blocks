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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(UIButton *)sender {
    [self imageWith:^(UIImage *image) {
        self.photoView.image = image;
    }];
}

- (void)imageWith:(void (^)(UIImage *image))completionBlock
{
    // descarga imagen en segundo plano
    // pedirle al sistema si tiene una cola disponible, si no tiene, se crea
    // para limitar la cantidad de colas
    dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(download, ^{
        NSURL *url = [NSURL URLWithString:kMarianaDavalosUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // ejecutar el bloque de finalizacion que nos han pasado,
            // serie de tareas a ser completadas luego de finalizar la ejecucion en segundo plano
            UIImage *image = [UIImage imageWithData:imageData];
            // execute the completion block, coulb be anything
            // another function could pass another logic in the completionBlock
            completionBlock(image);
        });
    });
}

@end
