//
//  Rectangle.h
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject

@property (nonatomic) double width;
@property double height;

-(double)getArea;

@property (readonly) double getAreaWithPropertyReadonly;
//@property (readwrite) double getAreaWithPropertyReadWrite;

@end

NS_ASSUME_NONNULL_END
    
