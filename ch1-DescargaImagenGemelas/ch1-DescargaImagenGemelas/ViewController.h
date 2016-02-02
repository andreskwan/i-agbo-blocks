//
//  ViewController.h
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 2/1/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

//only will have a getter
@property (strong, nonatomic, readonly) UIImage *davalosImage;

- (IBAction)downloadImage:(UIButton *)sender;

@end

