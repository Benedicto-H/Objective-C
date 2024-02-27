//
//  main.m
//  Object
//
//  Created by 홍진표 on 2/26/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*
        NSObject *object = [[NSObject alloc] init];
        NSLog(@"object: %@", object);
        printf("Addr object: %p", object);
        
        NSObject *newObject = object;
        NSLog(@"newObject: %@", newObject);
         */
        
        /*
        NSString *str = @"Hello, iOS";
        NSUInteger len = [str length];
        NSLog(@"Length of str: %lu", len);
        
        NSLog(@"Uppercase String: %@", [@"objective-c" uppercaseString]);
        NSLog(@"Capitalized String: %@", [@"objc" capitalizedString]);
         */
        
        /*
        NSString *str = @"1";
        
        NSComparisonResult result = [str compare:@"09"];
        NSLog(@"result: %ld", result);
        
        NSComparisonResult newResult = [str compare:@"09" options:NSNumericSearch];
        NSLog(@"newResult: %ld", newResult);
         */
        
        NSString *str1 = [[NSString alloc] initWithString:@"Hello Objective-C"];
        NSString *str2 = [[NSString alloc] initWithFormat:@"Hello %@", @"Objc"];
        NSString *str3 = [NSString stringWithFormat:@"Factory %@", @"Method"];
        NSString *str4;
        NSString *str5;
        
        if (str4 == nil) {
            str4 = [NSString stringWithFormat:@"str4 %@", @"with Factory Method"];
            NSLog(@"str1: %@ \nstr2: %@ \nstr3: %@ \nstr4: %@", str1, str2, str3, str4);
        }
        
        NSLog(@"str5 is nil?: %@", [str5 uppercaseString]);
    }
    return 0;
}
