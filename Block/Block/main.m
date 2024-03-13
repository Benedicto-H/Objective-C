//
//  main.m
//  Block
//
//  Created by 홍진표 on 3/13/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /*
        void (^doSomething)(void);
        doSomething = ^{
            NSLog(@"doSomething Block");
        };
         */
        
        void (^doSomething)(void) = ^(void) {
            NSLog(@"doSomthing Block");
        };
        
        doSomething();
        
        int (^doSomethingWithParams)(int, int) = ^(int val1, int val2) {
            return val1 + val2;
        };
        
        int res = doSomethingWithParams(10, 10);
        printf("res: %d \n", res);
        
        NSArray *array = @[@"element1", @"element2", @"element3", @"element4", @"element5"];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"obj: %@ \nidx: %ld \nstop: %d", obj, idx, *stop);
            
            if (idx > [array count] - 3) {
                *stop = YES;
                
                printf("\n");
                NSLog(@"obj: %@ \nidx: %ld \nstop: %d", obj, idx, *stop);
            }
        }];
    }
    return 0;
}
