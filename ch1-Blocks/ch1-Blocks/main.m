//
//  main.m
//  ch1-Blocks
//
//  Created by Andres Kwan on 2/1/16.
//  Copyright © 2016 Kwan-abgo-jedy. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 change made from master - will generate conflict with develop
 tomorrow is christmas
 another commit in master
 */
void testMethod() {
     int anInteger = 42;
    /* 
     * returns nothing
     * parameters none/void
     */
    void (^counter1)(void) = ^{
        //don't work because is always set to anInteger value
        int intBlock1 = anInteger;
        NSLog(@"\nClosure - 1 - Integer is: %d", intBlock1 );
        intBlock1 += 1;
    };
    
    void (^counter2)(void) = ^{
        NSLog(@"\nClosure - 2 - Integer is: %d", anInteger + 1);
      //  anInteger++;
    };
    
    counter1();//42
    counter1();//43
    counter1();//44
    
    //45 because of __block int anInteger
    counter2();//45

    NSLog(@"\nInteger value outside the block: %d", anInteger);//46
}
/*
 change made from master - no conflicts with develop
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        // NSArray
        NSArray *list = @[@1,@2,@3,@4];
        
        //for de C del abuelo
        for (int i = 0; i < [list count]; i++) {
            NSLog(@"Para el index(int): %d el valor retornado es %ld", i, (long)[[list objectAtIndex:i] integerValue]);
        }
        
        ///////////////////////////////
        //fast iteration
        //es el mas rapido
        //id (no se el tipo de lo que esta dentro del array
        for (id element in list) {
            NSLog(@"El elemento en la lista es %@", element);
        }

        ///////////////////////////////
        //iterar con bloques
        [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"El elemento para el indice %lu en la lista es %@", (unsigned long)idx, obj);
            if (idx == 1) {
                *stop = YES;
                NSLog(@"enumeration stoped");
            }
        }];
        
        [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
            NSLog(@"El elemento para el indice %lu en la lista es %@", (unsigned long)idx, obj);
            if (idx == 1) {
                *stop = YES;
                NSLog(@"enumeration stoped");
            }
        }];

        //NSDictionary
        NSDictionary *dict = @{@"uno":@1, @"dos":@2};
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key: %@, value: %@", key, obj);
        }];
        
        //testMethod
        testMethod();
    }
    return 0;
}
