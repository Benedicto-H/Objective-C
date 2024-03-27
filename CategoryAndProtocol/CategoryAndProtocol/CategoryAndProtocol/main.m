//
//  main.m
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        SomeClass *sc = [SomeClass new];
        
        [sc publicMethod];
        sc.publicProp = @"PUBLIC PROPERTY";
        
        [sc doSomethingMethod];
        
        /*
        id<DoSomething> newSC = [SomeClass new];
        [newSC doSomethingMethod];
         */
        
        sc.number = 10;
        sc.str = @"string value from protocol property";
    }
    return 0;
}
