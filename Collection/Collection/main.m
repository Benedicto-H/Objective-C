//
//  main.m
//  Collection
//
//  Created by 홍진표 on 3/8/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //  Immutable
        NSArray *immutableArr = [[NSArray alloc] initWithObjects:@"element1", @"element2", @"element3", nil];
        
        NSLog(@"immutableArr: %@", immutableArr);
        
        for (int i = 0; i < immutableArr.count; i++) {
            NSLog(@"immutableArr_element: %@", immutableArr[i]);
//            NSLog(@"immutableArr_element: %@", [immutableArr objectAtIndex:i]);
        }
        
        for (id element in immutableArr) {
            NSLog(@"immutableArr_element: %@", element);
        }
        
        //  Mutable
        NSMutableArray *mutableArr = [NSMutableArray array];
        
        [mutableArr addObject:@"value1"];
        [mutableArr addObjectsFromArray:@[@"value2", @"value3"]];
        
        for (id value in mutableArr) {
            NSLog(@"mutableArr: %@", value);
        }
        
        [mutableArr removeObject:mutableArr[2]];
        NSLog(@"mutableArr: %@", mutableArr);
        
        [mutableArr removeAllObjects];
        NSLog(@"mutableArr: %@", mutableArr);
    }
    return 0;
}
