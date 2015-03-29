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
    IAAPDFViewController *PDFVC = [[IAAPDFViewController alloc]initWithBook:self.book];
    
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
    self.title =self.book.title;
    self.bookCoverImage.image=self.book.bookCover;
    self.bookTitleLabel.text=self.book.title;
    self.bookAuthorsLabel.text= [self.book.authors componentsJoinedByString:@", "];
    self.bookTagsLabel.text= [self.book.tags componentsJoinedByString:@", "];
    //self.PDF=self.book.bookPDF;
    
    
    
    if (self.book.isFavorite)
    {
        [self.favoriteButton setTitle:@"Quitar de Favoritos" forState:UIControlStateNormal];
        [self.toolbarButtonMarkAsFavorite setTitle:@"Quitar de Favoritos"];
    }
    else
    {
        [self.favoriteButton setTitle:@"Poner como Favorito" forState:UIControlStateNormal];
        [self.toolbarButtonMarkAsFavorite setTitle:@"Poner como Favorito"];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden)
    {
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
    else if (displayMode == UISplitViewControllerDisplayModeAllVisible)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

#pragma mark -  IAALibrartTableViewControllerDelegate

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                        didSelectBook:(IAABook *) aBook

{
    self.book = aBook;
    [self syncViewModel];
}


@end
