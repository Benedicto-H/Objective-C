//
//  Rectangle.h
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject {
    
    //  Member Fields
    double width;
    double height;
}

//  Methods
-(id)initWithWidth:(double)newWidth height:(double)newHeight;

-(void)setWidth:(double)newWidth;   //  Setter
-(double)width;    //  Getter
-(void)setHeight:(double)newHeight;   //  Setter
-(double)height;   //  Getter

-(double)getArea;
-(double)setWidth:(double)newWidth height:(double)newHeight;
-(BOOL)isSquare;

//  Factory Methods
+(id)rectangle;
+(id)rectangleWithWidth:(double)newWidth height:(double)newHeight;

@end

NS_ASSUME_NONNULL_END
    