//
//  main.m
//  Memory
//
//  Created by 홍진표 on 3/9/24.
//

#import <Foundation/Foundation.h>
#import "Tracer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"========== START ==========");
        
        Tracer *tracer = [Tracer new];
        
        printf("tracer 포인터 변수: %s \n", [tracer.description UTF8String]);
        printf("tracer 포인터 변수의 주소값: %p \n", &tracer);
        printf("tracer 포인터 변수가 가지고 있는 Tracer의 인스턴스 주소값: %p \n", tracer);
        
        tracer.name = @"tracer";
        tracer = nil;
        
        printf("\n");
        
        Tracer *clone = [Tracer new];
        
        printf("clone 포인터 변수: %s \n", [clone.description UTF8String]);
        printf("clone 포인터 변수의 주소값: %p \n", &clone);
        printf("clone 포인터 변수가 가지고 있는 Tracer의 인스턴스 주소값: %p \n", clone);
        
        clone.name = @"clone";
        
        printf("\n");
        
        Tracer *newClone = clone;
        
        printf("newClone 포인터 변수: %s \n", [newClone.description UTF8String]);
        printf("newClone 포인터 변수의 주소값: %p \n", &newClone);
        printf("newClone 포인터 변수가 가지고 있는 Tracer의 인스턴스 주소값: %p \n", newClone);
        
        clone = nil;
        
        printf("\n");
        
        NSLog(@"========== END ==========");
    }
    return 0;
}
