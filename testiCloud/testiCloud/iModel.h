//
//  TSiCloudDocumentModel.h
//  testiCloud
//
//  Created by Tim Sawtell on 15/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@protocol iModelDocumentDelegate;

@interface iModel : UIDocument
@property (nonatomic, strong) Model *model;
@property (nonatomic, weak) id <iModelDocumentDelegate> delegate;
+ (NSURL*)localDocumentsDirectoryURL;
@end

@protocol iModelDocumentDelegate <NSObject>
-(void)modelDocumentContentsUpdated:(iModel*)iModelDocument;
@end