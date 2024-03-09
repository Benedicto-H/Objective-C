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
        
        //  Array
        /*
        /// Immutable
        NSArray *immutableArr = [[NSArray alloc] initWithObjects:@"element1", @"element2", @"element3", nil];
//        NSArray *immutableArrLiteral = @[@"value1", @"value2", @"value3"];
        
        NSLog(@"immutableArr: %@", immutableArr);
        
        for (int i = 0; i < immutableArr.count; i++) {
            NSLog(@"immutableArr_element: %@", immutableArr[i]);
//            NSLog(@"immutableArr_element: %@", [immutableArr objectAtIndex:i]);
        }
        
        for (id element in immutableArr) {
            NSLog(@"immutableArr_element: %@", element);
        }
        
        /// Mutable
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
         */
        
        //  Dictionary
        /*
        /// Immutable
        NSDictionary *immutableDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"object1", @"Key1", @"object2", @"Key2", @"object3", @"Key3", nil];
        NSDictionary *immutableDictLiteral = @{@"Key1": @"new object1",
                                               @"Key2": @"new object2",
                                               @"Key3": @"new object3"};
        
        NSLog(@"(dict) Key1: %@", [immutableDict objectForKey:@"Key1"]);
        
        /// Mutable
        NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
        
        [mutableDict setObject:@"obj1" forKey:@"Key1"];
        [mutableDict setObject:@"obj2" forKey:@"Key2"];
        
        NSLog(@"mutableDict: %@", mutableDict);
        
        mutableDict[@"Key2"] = @"new obj2";
        NSLog(@"mutableDict: %@", mutableDict);
         */
        
        //  Complex
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:@{@"Key": @"Value"}];
        [array addObject:@[@"element1", @"element2"]];
        [array addObject:[NSNumber numberWithInt:10]];
        [array addObject:@3.14159];
        
        NSLog(@"===== array ===== \n%@", array);
        
        for (id object in array) {
            NSLog(@"%@", object);
        }
    }
    return 0;
}
