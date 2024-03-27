//
//  SomeClass.m
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/12/24.
//

#import "SomeClass.h"

@interface SomeClass ()

@property (nonatomic, strong) NSString *privateProp;

-(void)privateMethod;

@end

@implementation SomeClass {
    int privateVar;
}

@synthesize number, str;

- (void)publicMethod {
    NSLog(@"Public Method");
}

- (void)privateMethod {
    NSLog(@"Private Method");
}

- (void)doSomethingMethod {
    NSLog(@"Do Something");
}

@end
