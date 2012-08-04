//
//  LoginViewController.h
//  RSDN
//
//  Created by Igor Kishik on 04.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController; 

@protocol LoginViewControllerDelegate <NSObject>
-(void)LoginViewController:(LoginViewController *)sender
                     Login:(NSString *)login
               andPassword:(NSString *) password;
@end

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *LoginField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (nonatomic, weak) id<LoginViewControllerDelegate> delegate;

@end
