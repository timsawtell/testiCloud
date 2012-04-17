//
//  FirstViewController.m
//  testiCloud
//
//  Created by Local Dev User on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize model;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.model = [[iModel alloc] initWithFileURL:[iModel localDocumentsDirectoryURL]];
    NSLog(@"file url: %@",self.model.fileURL);
    [self.model saveToURL:self.model.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
        if (success) {
            NSLog(@"saved/created");
        } else {
            NSLog(@"not save");
        }
    }];
    
    [self.model openWithCompletionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"yay");
        } else {
            NSLog(@"crap");
        }
    }];
    
    self.model.model.one = @"Ab";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)modelDocumentContentsUpdated:(iModel*)iModelDocument
{
    NSLog(@"stuff changed");
}

@end
