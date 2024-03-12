//
//  SomeClass.h
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/12/24.
//

#import <Foundation/Foundation.h>
#import "DoSomething.h"

NS_ASSUME_NONNULL_BEGIN

@interface SomeClass : NSObject <DoSomething> {
    int publicVar;
}

@property (nonatomic, strong) NSString *publicProp;

-(void)publicMethod;


@end

NS_ASSUME_NONNULL_END
