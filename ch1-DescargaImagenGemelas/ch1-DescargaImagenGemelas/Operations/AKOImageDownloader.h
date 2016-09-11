//
//  AKOImageDownloader.h
//  ch1-DescargaImagenGemelas
//
//  Created by Andres Kwan on 9/11/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface AKOImageDownloader : NSOperation

//deberia crear un protocolo que se encarge de avisar antes y despues de que la tarea se
//ejecute en sugundo plano
// el delegado seria el ViewController
// con el protocolo, se puede reutilizar las operaciones.

// en lugar del protocolo...
// se creara un inicializador propio,
// por que se le debe pasar una referencia a la imageVC
-(id) initWithImageViewController:(ViewController *) vc;
@end
