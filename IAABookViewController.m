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

@property (strong,nonatomic) IAANewPDFReederViewController *readerVC;
@property (nonatomic) BOOL showingPDF;

@end

@implementation IAABookViewController

- (IBAction)showPDF:(id)sender;
{
    
    
    /*
    //creamos la nueva vista y le pasamos el libro
    IAAPDFViewController *PDFVC = [[IAAPDFViewController alloc]initWithBook:self.book];
    
    [self.navigationController pushViewController:PDFVC animated:YES];*/
    
    [self callToPDF];
   
}

-(void) callToPDF
{
    //Se usa el frameword vfrReader importado mediante cocoapods.

    
    
    
    //IAANewPDFReaderDocument *readerDoc = [[IAANewPDFReaderDocument alloc]initWithFilePath:self.book.bookPDFFileName password:nil];

    IAANewPDFReaderDocument *readerDoc = [[IAANewPDFReaderDocument alloc]initWithBook:self.book];

    
    
    //self.readerVC = [[ReaderViewController alloc]initWithReaderDocument:readerDoc];
    self.readerVC = [[IAANewPDFReederViewController alloc]initWithReaderDocument:readerDoc];
    self.readerVC.delegate = self;
    
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController pushViewController:self.readerVC animated:YES];
    
    self.showingPDF = YES;

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
    
    
    if (([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeLeft)||([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeRight))
        {
            [self addLandscapeView];

        }
        else
        {
            [self.LandscapeView removeFromSuperview];
        }

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
    if (([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeLeft)||([[UIDevice currentDevice]orientation] == UIInterfaceOrientationLandscapeRight))
    {
        [self addLandscapeView];
        
    }
    else
    {
        [self.LandscapeView removeFromSuperview];
    }

}

- (void)addLandscapeView
{
    [self.view addSubview:self.LandscapeView];
}





- (void)syncViewModel
{
    self.title =self.book.title;
    
    
    //sincronizamos vista vertical
    self.bookCoverImage.image=[UIImage imageWithData:self.book.bookCover];
    self.bookTitleLabel.text=self.book.title;
    self.bookAuthorsLabel.text= [self.book.authors componentsJoinedByString:@", "];
    self.bookTagsLabel.text= [self.book.tags componentsJoinedByString:@", "];

    //sincronizamos vista horizontal
    self.bookCoverImageLandscape.image=[UIImage imageWithData:self.book.bookCover];
    self.bookTitleLabelLandscape.text=self.book.title;
    self.bookAuthorsLabelLanscape.text= [self.book.authors componentsJoinedByString:@", "];
    self.bookTagsLabelLandscape.text= [self.book.tags componentsJoinedByString:@", "];
    
    
    if (self.book.isFavorite)
    {
       // [self.favoriteButton setTitle:@"Quitar de Favoritos" forState:UIControlStateNormal];
        [self.toolbarButtonMarkAsFavorite setTitle:@"Quitar de Favoritos"];
        [self.toolbarButtonMarkAsFavoriteLandscape setTitle:@"Quitar de Favoritos"];
    }
    else
    {
       // [self.favoriteButton setTitle:@"Poner como Favorito" forState:UIControlStateNormal];
        [self.toolbarButtonMarkAsFavorite setTitle:@"Poner como Favorito"];
        [self.toolbarButtonMarkAsFavoriteLandscape setTitle:@"Poner como Favorito"];
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
    
 
   /* if (self.showingPDF)
    {
        [self callToPDF];
        

    }*/
  
}

#pragma mark - ReaderViewControllerDelegate

-(void) dismissReaderViewController:(ReaderViewController *)viewController
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {

        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self.navigationController.navigationBar setHidden:NO];
    self.showingPDF = NO;
}

@end
