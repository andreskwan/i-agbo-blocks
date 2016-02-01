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
    // crear una cola
    dispatch_queue_t gemelas = dispatch_queue_create("colaDavalos", 0);

    // enviar un bloque que se ejecute en 2do plano
    dispatch_async(gemelas, ^{
        NSURL *url = [NSURL URLWithString:@"http://i.imgbox.com/abt638ka"];
        
        imageData = [NSData dataWithContentsOfURL:url];
    });
    //imageData solo existe dentro del bloque, debe crearse una referencia
    //porfuera del bloque, dentro del bloque se asigna la data, pero queda
    //disponible fuera del bloque.
    UIImage * image = [UIImage imageWithData:imageData];
    
    //debo presentar la imagen en el hilo principal
    
    self.photoView.image = image;
}
@end
