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
    NSURL *url = [NSURL URLWithString:@"http://i.imgbox.com/abt638ka"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    UIImage * image = [UIImage imageWithData:imageData];
    
    self.photoView.image = image;
}
@end
