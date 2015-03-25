//
//  IAAPDFViewController.h
//  HackerBooks
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAAPDFViewController : UIViewController
@property (strong,nonatomic) NSData *PDF;
@property (strong,nonatomic) NSURL *PDFURL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(id) initWithPDF: (NSData *) aPDF andURL: (NSURL *) aURLPDF;
@end
