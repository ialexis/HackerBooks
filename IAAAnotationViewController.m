//
//  IAAAnotationViewController.m
//  HackerBooks
//
//  Created by Ivan on 21/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAAnotationViewController.h"
#import "IAAAnnotation.h"
#import "IAAAnnotationCollectionViewCell.h"
#import "IAAPhoto.h"
#import "IAASimpleAnnotationViewController.h"

static NSString *cellID = @"annotationCellID";
@interface IAAAnotationViewController ()
@property (nonatomic, strong) IAABook *book;
@end

@implementation IAAAnotationViewController

#pragma mark - inicializadores de conveniencia
-(id) initCoreDataCollectionViewControllerWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                                            layout: (UICollectionViewFlowLayout *) layout
                                                              book:(IAABook *) book
{
    if (self = [super initWithFetchedResultsController:aFetchedResultsController layout:layout])
    {
        _book = book;
    }
    return self;

}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerNib];
    
    //añadirmos esta linea para que muestre el boton de anotaciones
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(addAnnotation)];
    
    self.navigationItem.rightBarButtonItem = add;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - XIB Registration
-(void) registerNib
{
    UINib *nib = [UINib nibWithNibName:@"IAAAnotationCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:cellID];
}

#pragma mark - Data Source

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //obtener el objeto
    IAAAnnotation *annotation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //objeter una celda
    
    IAAAnnotationCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    //Configurar la celda (sync view-model)
    cell.annotationText.text = annotation.text;
    cell.photoView.image = annotation.imageAnnotation;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    cell.modificacionDateText.text = [fmt stringFromDate:annotation.modificationDate];
    cell.backgroundColor = [UIColor redColor];    //devolver la celda
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Averiguar la nota
    IAAAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear el controlador
    IAASimpleAnnotationViewController *nVC = [[IAASimpleAnnotationViewController alloc] initWithModel:note];
    
    // Hacer el push
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    

}
#pragma mark - Add Annotation
- (void)addAnnotation
{
    [IAAAnnotation annotationWithText:@"Nueva Anotacion"
                                 book:self.book
                              context:self.fetchedResultsController.managedObjectContext];
     
    
     
}
@end
