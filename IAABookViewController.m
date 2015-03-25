//
//  IAABookViewController.m
//  HackerBooks
//
//  Created by Ivan on 22/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAABookViewController.h"
#import "IAAPDFViewController.h"
#import "IAALibraryTableViewController.h"

@interface IAABookViewController ()

@end

@implementation IAABookViewController

- (IBAction)showPDF:(id)sender;
{
    //creamos la nueva vista y le pasamos el libro
    IAAPDFViewController *PDFVC = [[IAAPDFViewController alloc]initWithPDF:self.PDF andURL:self.book.bookPDFURL];
    
    [self.navigationController pushViewController:PDFVC animated:YES];
}

-(id) initWithBook: (IAABook *) aBook
{
   /* NSString *nibName = nil;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        nibName = @"IAABookViewControlleriPhone";
    }*/
    
  //  if (self = [super initWithNibName:nibName bundle:nil]) {

    if (self = [super init]) {
        _book = aBook;
        self.title = aBook.title;
    }
    return self;
}

- (IBAction)setFavorite:(id)sender
{
    if (self.book.isFavorite)
    {
        [self.book markAsFavoriteWithValue:NO];
    }
    else
    {
        [self.book markAsFavoriteWithValue:YES];
    }
    [self syncViewModel];
    
    // Enviar notificación
    NSNotification *notificationFavoriteBook = [NSNotification notificationWithName:DID_SELECT_FAVORITE_BOOK_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{@"BOOK": self.book}];
    [[NSNotificationCenter defaultCenter] postNotification:notificationFavoriteBook];

  

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self syncViewModel];
    
}
- (void)syncViewModel
{
    self.bookCoverImage.image=self.book.bookCover;
    self.bookTitleLabel.text=self.book.title;
    self.bookAuthorsLabel.text= [self.book.authors componentsJoinedByString:@", "];
    self.bookTagsLabel.text= [self.book.tags componentsJoinedByString:@", "];
    self.PDF=self.book.bookPDF;
    
    
    
    if (self.book.isFavorite)
    {
        [self.favoriteButton setTitle:@"Quitar de Favoritos" forState:UIControlStateNormal];
    }
    else
    {
        [self.favoriteButton setTitle:@"Poner como Favorito" forState:UIControlStateNormal];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.rightBarButtonItem = nil;
}


#pragma mark -  IAAWineryTableViewControllerDelegate

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                        didSelectBook:(IAABook *) aBook

{
    self.book = aBook;
    [self syncViewModel];
}


@end
