//
//  LoginViewController.m
//  RSDN
//
//  Created by Igor Kishik on 04.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize LoginField = _LoginField;
@synthesize PasswordField = _PasswordField;
@synthesize delegate = _delegate; 

- (IBAction)LogIn:(id)sender
{
    if (self.LoginField.text.length > 0 && self.PasswordField.text.length > 0) {
        [self.delegate LoginViewController:self Login:self.LoginField.text andPassword:self.PasswordField.text];
    }
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setLoginField:nil];
    [self setPasswordField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
