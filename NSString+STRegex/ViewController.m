//
//  ViewController.m
//  NSString+STRegex
//
//  Created by yls on 14-1-15.
//  Copyright (c) 2014年 yls. All rights reserved.
//

#import "ViewController.h"
#import "NSString+STRegex.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *idCardNum = @"11010120140101391x";
    BOOL rc = [idCardNum isValidIdCardNum];
    if (rc) {
        NSLog(@"身份证号合法");
    } else {
        NSLog(@"身份证号不合法");
    }
    
    NSString *phone = @"13811111111";
    rc = [phone isValidPhoneNum];
    if (rc) {
        NSLog(@"手机号合法");
    } else {
        NSLog(@"手机号不合法");
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(st_textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextField:(UITextField *)field valid:(BOOL)valid
{
    UIColor *color = valid ? [UIColor greenColor] : [UIColor redColor];
    field.layer.borderColor = color.CGColor;
    field.layer.borderWidth = 2.0;
    field.layer.opacity = 1.0;
}

- (void)st_textDidChange:(NSNotification *)noti
{
    UITextField *textField = noti.object;
    
    if ([textField isKindOfClass:[UITextField class]]) {
        if (textField.text.length == 0) {
            textField.layer.borderColor = [UIColor blackColor].CGColor;
            textField.layer.borderWidth = .0;
            return ;
        }
        
        BOOL isValid = NO;
        
        NSString *text = textField.text;
        NSLog(@"%@", text);
        
        switch (textField.tag) {
            case 1:
            {
                isValid = [text isValidEmail];
            }
                break;
            case 2:
            {
                isValid = [text isValidPhoneNum];
            }
                break;
            case 3:
            {
                isValid = [text isValidIP];
            }
                break;
            case 4:
            {
                isValid = [text isValidIdCardNum];
            }
                break;
            case 5:
            {
                isValid = [text isValidWithMinLenth:4 maxLenth:12 containChinese:NO firstCannotBeDigtal:YES];
            }
                break;
            case 6:
            {
                isValid = [text isValidTaxNo];
            }
                break;
            default:
                break;
        }
        
        [self setTextField:textField valid:isValid];
    }
}

- (void)keyBoardWillShow:(NSNotification *)noti
{
    [UIView animateWithDuration:.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = -216;
        self.view.frame = frame;
    }];
}

- (void)keyBoardWillHide:(NSNotification *)noti
{
    [UIView animateWithDuration:.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    }];
}

- (IBAction)touchDown:(id)sender {
    for (UIView *v in self.view.subviews) {
        [v resignFirstResponder];
    }
}

@end
