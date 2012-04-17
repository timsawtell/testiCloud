//
//  TSiCloudDocumentModel.m
//  testiCloud
//
//  Created by Tim Sawtell on 15/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iModel.h"

@interface iModel()

@end

@implementation iModel

NSString *const oneFileName = @"one"; 
NSString *const twoFileName = @"two";
NSStringEncoding const kTextEncoding = NSUTF8StringEncoding;

@synthesize model, delegate;

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError {
    if ([contents length] > 0) {
        self.model = [NSKeyedUnarchiver unarchiveObjectWithData:contents];
        NSLog(@"%@", self.model);
    }
    if ([self.delegate respondsToSelector:@selector(modelDocumentContentsUpdated:)]) {
        [self.delegate modelDocumentContentsUpdated:self];
    }
    return YES;
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
    NSData *modelData = [NSKeyedArchiver archivedDataWithRootObject:self.model];
    return modelData;
}

+ (NSURL*)localDocumentsDirectoryURL 
{
    static NSURL *localDocumentsDirectoryURL = nil;
    if (localDocumentsDirectoryURL == nil) {
        NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,
                                                                                NSUserDomainMask, YES ) objectAtIndex:0];
        localDocumentsDirectoryURL = [NSURL fileURLWithPath:documentsDirectoryPath];
    }
    return localDocumentsDirectoryURL;
}

@end
