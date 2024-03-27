//
//  Tracer.h
//  Memory
//
//  Created by 홍진표 on 3/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tracer : NSObject

@property (nonatomic, strong) NSString *name;

-(void)dealloc;

@end

NS_ASSUME_NONNULL_END
