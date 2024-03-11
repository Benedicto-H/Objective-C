//
//  main.m
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "NSMutableArray+IntExt.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student *student = [Student new];
        
        [student study];
        [student enroll];
        
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:@10];
        
        NSNumber *number = array[0];
        NSLog(@"number: %d", [number intValue]);
        
        [array addInt:100];
        NSLog(@"array: %@", array);
        
        int iNum = [array intAtIndex:1];
        NSLog(@"iNum: %d", iNum);
    }
    return 0;
}
