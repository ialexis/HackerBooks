//
//  IAAPDFViewController.h
//  HackerBooks
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAABook.h"

@interface IAAPDFViewController : UIViewController <UIWebViewDelegate>
@property (strong,nonatomic) IAABook *book;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithBook: (IAABook *) aBook;
@end
