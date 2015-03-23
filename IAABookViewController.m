//
//  IAABookViewController.m
//  HackerBooks
//
//  Created by Ivan on 22/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAABookViewController.h"

@interface IAABookViewController ()

@end

@implementation IAABookViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
