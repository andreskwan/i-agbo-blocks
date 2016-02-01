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
    NSURL *url = [NSURL URLWithString:@"http://cdn.playbuzz.com/cdn/47169acc-3907-48cb-88fb-c13f98a556ad/52405eb3-f4d7-4ce1-93d0-d0c807bd9764.jpg"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    UIImage * image = [UIImage imageWithData:imageData];
    
    self.photoView.image = image;
}
@end
