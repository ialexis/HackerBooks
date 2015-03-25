//
//  IAAPDFViewController.m
//  HackerBooks
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAPDFViewController.h"

@interface IAAPDFViewController ()

@end

@implementation IAAPDFViewController


-(id) initWithPDF: (NSData *) aPDF andURL:(NSURL *)aURLPDF
{
    if (self=[super init])
    {
        _PDF=aPDF;
        _PDFURL=aURLPDF;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
 //   NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
 //   [webView loadData:data MIMEType:@"application/xhtml+xml" textEncodingName:@"utf-8" baseURL:baseUrl];
      [self.webView loadData:self.PDF MIMEType: @"application/pdf" textEncodingName:@"UTF-8" baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
