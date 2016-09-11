//
//  ViewController.m
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 2/1/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "ViewController.h"
#define DAVALOS_URL @"http://cdn.playbuzz.com/cdn/47169acc-3907-48cb-88fb-c13f98a556ad/52405eb3-f4d7-4ce1-93d0-d0c807bd9764.jpg"
// @"http://landofthefreeish.com/wp-content/uploads/2011/03/mariana-davalos-maxim-07.jpg";
static NSString * kMarianaDavalosUrl = @"https://pixabay.com/static/uploads/photo/2016/08/19/18/50/fruit-1605921_960_720.jpg";

@interface ViewController ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation ViewController

//typedef
typedef void (^kCompletionBlock)(UIImage *image);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(UIButton *)sender {

    // preparar la interfaz - indicar que se esta ejecuta ndo una tarea
    [self.activityView startAnimating];
    // crear las operaciones
    
    // enlazar las operaciones
    
    // enviarlas a la cola

/*
 GCD - commented
 */
//    [self imageWith:^(UIImage *image) {
//        self.photoView.image = image;
//    }];
}

//leave it ready to use
extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));


/*
 parameter should be URL
 return: in a completion block
 */
- (void)imageWith:(void (^)(UIImage *image))completionBlock
{
    // 1 bajar la imagen en segundo plano
    
    // descarga imagen en segundo plano
    // pedirle al sistema si tiene una cola disponible, si no tiene, se crea
    // para limitar la cantidad de colas
    
    // OS tienes una cola que pueda re utilizar?
    // con prioridad por defecto
    dispatch_queue_t queueForDownload = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queueForDownload, ^{
        NSURL *url = [NSURL URLWithString:kMarianaDavalosUrl];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        //call the main tread to present UIKit content
        dispatch_async(dispatch_get_main_queue(), ^{
            uint64_t t = dispatch_benchmark(1, ^{
                // ejecutar el bloque de finalizacion que nos han pasado,
                // serie de tareas a ser completadas luego de finalizar la ejecucion en segundo plano
                UIImage *image = [UIImage imageWithData:imageData];
                
                // 2 ejecutar el bloque de finalizacion en la cola principal
                // continuation
                // how to return and where
                // execute the completion block, coulb be anything
                // another function could pass another logic in the completionBlock
                completionBlock(image);
            });
            NSLog(@"Migration took %lluns", t);
        });
    });
}
@end
