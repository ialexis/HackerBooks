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

static NSString *cellID = @"annotationCellID";
@interface IAAAnotationViewController ()

@end

@implementation IAAAnotationViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerNib];
}

#pragma mark - XIB Registration
-(void) registerNib
{
    UINib *nib = [UINib nibWithNibName:@"IAAAAnotationCollectionViewCell" bundle:nil];
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
    cell.photoView.image = annotation.photo.image;
    
    //devolver la celda
    return cell;
}
@end
