//
//  HighLander.m
//  ch1-Singletons
//
//  Created by Andres Kwan on 2/3/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import "HighLander.h"

@implementation HighLander

//crear un methodo de clase
//defaul
//standar
//


//instancetype - articulo en cocoamental
+(instancetype) sharedHighLander {
    // unavez es llamada siempre tendra el mismo valor - statico
    // es un marcador que se verifica para ver si ya se ejecuto,
    // si ya se realizo, simplemente retorna
    static dispatch_once_t onceToken;
    // solo puede haber uno - Highlinder
    // defaul, shared or standar
    static HighLander *shared;
    
    dispatch_once(&onceToken, ^{
        //se crea una instacia de la clase que sera almacenada en una var statica
        shared = [[HighLander alloc]init];
    });
    return shared;
}

@end
