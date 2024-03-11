//
//  Album.m
//  OOP
//
//  Created by 홍진표 on 3/11/24.
//

#import "Album.h"

@implementation Album

@synthesize title, songs;

- (instancetype)init
{
    if (self = [super init]) {
        title = @"";
        songs = [NSMutableArray array];
    }
    return self;
}

- (void)addSong:(Song *)song {
    [songs addObject:song];
}

- (Song *)searchSong:(NSString *)title {
    for (Song *song in songs) {
        if ([song isEqualToSongTitle:title]) {
            return song;
        }
    }
    return nil;
}

- (void)deleteSong:(NSString *)title {
    [songs removeObject:[self searchSong:title]];
}

- (void)play {
    NSLog(@"Album Title: %@", title);
    
    for (Song *song in songs) {
        [song play];
    }
}

@end
