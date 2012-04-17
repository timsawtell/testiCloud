//
//  Model.m
//  testiCloud
//
//  Created by Tim Sawtell on 15/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize one, two;

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.one = [aDecoder decodeObjectForKey:@"one"];
        self.two = [aDecoder decodeObjectForKey:@"two"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.one forKey:@"one"];
    [aCoder encodeObject:self.two forKey:@"two"];
}

@end
