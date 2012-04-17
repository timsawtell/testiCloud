//
//  FirstViewController.h
//  testiCloud
//
//  Created by Local Dev User on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iModel.h"

@interface FirstViewController : UIViewController <iModelDocumentDelegate>

-(void)modelDocumentContentsUpdated:(iModel*)iModelDocument;
@property (nonatomic, strong) iModel *model;

@end
