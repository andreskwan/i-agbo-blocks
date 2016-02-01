//
//  ViewController.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 2/1/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "ViewController.h"

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

    // permitir que se modifique dentro del bloque y quede disponible fuera de el
    __block NSData *imageData = nil;
    __block UIImage * image = nil;
    
    // crear una cola
    dispatch_queue_t gemelas = dispatch_queue_create("colaDavalos", 0);

    // enviar un bloque que se ejecute en 2do plano
    dispatch_async(gemelas, ^{
        NSURL *url = [NSURL URLWithString:@"http://i.imgbox.com/abt638ka"];
        imageData = [NSData dataWithContentsOfURL:url];
        
        //presentar en primer plano o en la cola principal
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:imageData];
            self.photoView.image = image;
        });
    });
}
@end
