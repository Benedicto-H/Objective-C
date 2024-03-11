//
//  Album.h
//  OOP
//
//  Created by 홍진표 on 3/11/24.
//

#import <Foundation/Foundation.h>
#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Album : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *songs;

-(instancetype)init;
-(void)addSong:(Song *)song;
-(Song *)searchSong:(NSString *)title;
-(void)deleteSong:(NSString *)title;
-(void)play;

@end

NS_ASSUME_NONNULL_END
