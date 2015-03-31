//
//  IAANewPDFReederViewController.m
//  HackerBooks
//
//  Created by Ivan on 31/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAANewPDFReederViewController.h"
#import "Settings.h"
#import "IAABook.h"
#import "IAANewPDFReaderDocument.h"

@interface IAANewPDFReederViewController ()

@end

@implementation IAANewPDFReederViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    
    //   NSData *data = [self.PDF dataUsingEncoding:NSUTF8StringEncoding];
    //   [webView loadData:data MIMEType:@"application/xhtml+xml" textEncodingName:@"utf-8" baseURL:baseUrl];
    
    //asignamos delegado
    //self.webView.delegate = self;
    
   // [self syncWithModel];
    
    //nos damos de alta en la notificacion de aviso cuando se cambie de personaje
    NSNotificationCenter *nCenter = [NSNotificationCenter defaultCenter];
    [nCenter addObserver:self
                selector:@selector (notifyBookDidChange:)
                    name:DID_SELECT_NEW_BOOK_NOTIFICATION_NAME
                  object:nil];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dealloc
{
    //nos damos de baja de la notificacion
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
    /*
    NSDictionary *dict = [notification userInfo];
    
    IAABook *newbook = [dict objectForKey:@"NEW_BOOK"];
    
    IAANewPDFReaderDocument *readerDoc = [[IAANewPDFReaderDocument alloc]initWithBook:newbook];
    
    IAANewPDFReederViewController *readerVC = [[IAANewPDFReederViewController alloc]initWithReaderDocument:readerDoc];
    readerVC.delegate = self.delegate;
    
      // [self.navigationController popViewControllerAnimated:YES];
    
   // [self dismissViewControllerAnimated:YES completion: nil];
    
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController pushViewController:readerVC animated:YES];
   [self.navigationController.navigationBar setHidden:YES];
    
    //self.readerVC = [[ReaderViewController alloc]initWithReaderDocument:readerDoc];
   // self.readerVC = [[IAANewPDFReederViewController alloc]initWithReaderDocument:readerDoc];
     
     */
}


@end
