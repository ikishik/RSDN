//
//  ForumsCheckViewController.h
//  RSDN
//
//  Created by Igor Kishik on 21.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Forums.h"
#import <QuickDialog/QuickDialog.h>


@interface ForumsCheckViewController : QuickDialogController

-(id)initWithMultiSelectAndForums:(NSArray *)frms;

@end
