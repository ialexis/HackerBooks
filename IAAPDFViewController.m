//
//  IAAPDFViewController.m
//  HackerBooks
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAPDFViewController.h"
#import "Settings.h"

@interface IAAPDFViewController ()

@end

@implementation IAAPDFViewController


-(id) initWithBook: (IAABook *) aBook
{
    if (self=[super init])
    {
        _book=aBook;
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
    
    
    
 //   NSData *data = [self.PDF dataUsingEncoding:NSUTF8StringEncoding];
 //   [webView loadData:data MIMEType:@"application/xhtml+xml" textEncodingName:@"utf-8" baseURL:baseUrl];
    
    
    
    [self syncWithModel];

    //nos damos de alta en la notificacion de aviso cuando se cambie de personaje
    NSNotificationCenter *nCenter = [NSNotificationCenter defaultCenter];
    [nCenter addObserver:self
                selector:@selector (notifyBookDidChange:)
                    name:DID_SELECT_NEW_BOOK_NOTIFICATION_NAME
                  object:nil];
    

}


-(void) syncWithModel
{
    
    NSData *data = [NSData dataWithContentsOfFile:[self.book bookPDFFileName]];
    
    [self.webView loadData:data MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:[NSURL URLWithString:@"https://"]];
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
#pragma mark - notifications

-(void) notifyBookDidChange: (NSNotification *) notification
{
    NSDictionary *dict = [notification userInfo];
    
    IAABook *newbook = [dict objectForKey:@"NEW_BOOK"];
    
    //actualizamos el modelo
    self.book=newbook;
    
    //Sincronizamos vista y modelo
    [self syncWithModel];
}

@end
