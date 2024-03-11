//
//  Song.m
//  OOP
//
//  Created by 홍진표 on 3/3/24.
//

#import "Song.h"

@implementation Song

@synthesize title, artist, duration;

- (id)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    if (self = [super init]) {
        self.title = title;
        self.artist = artist;
    }
    return self;
}

- (void)play {
    NSLog(@"Title: %@ \nArtist: %@ \nDuration: %d", self.title, self.artist, self.duration);
}

- (BOOL)isEqualToSongTitle:(NSString *)title {
    return [self.title isEqualToString:title];
}

+ (id)songWithTitle:(NSString *)title artist:(NSString *)artist {
    Song *song = [[Song alloc] initWithTitle:title artist:artist];
    
    return song;
}

@end
