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
@property (strong, nonatomic, readonly) UIImage *imageDownloadedInSetter;

- (IBAction)downloadImage:(UIButton *)sender;

// returns - nothing
// parameter - uiimage - which is returned to the caller
// completion block
- (void)imageWith:(void (^)(UIImage *image))completionBlock;
@end

