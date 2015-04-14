//
//  IAALibraryTableViewController.m
//  HackerBooks
//
//  Created by Ivan on 12/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAALibraryTableViewController.h"
#import "IAABook.h"
#import "IAABookViewController.h"
#import "IAALibraryCellTableViewCell.h"

@interface IAALibraryTableViewController ()

@end

@implementation IAALibraryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title=@"HackerBooks 2";
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

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //averiguamos cual es el libro
    IAABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear una celda
    
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    IAALibraryCellTableViewCell *cell = (IAALibraryCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    
    
    
    /*
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:cellID];
    }
    */
     
     // Configuramos la celda...
     if (cell == nil)
     {
     NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IAALibraryCellTableViewCell" owner:self options:nil];
     cell = (IAALibraryCellTableViewCell *)[nib objectAtIndex:0];
     }

    
    
    //sincronizamos vista y modelo
    cell.bookTitle.text=b.title;
    cell.bookAuthors.text = b.authors;
    
    
    //cargamos la imagen
    
    [cell.activityIndicator startAnimating];
    
    // crear un cola
    dispatch_queue_t loadCovers = dispatch_queue_create("loadCovers", 0);
    
    
    dispatch_async(loadCovers, ^{
        UIImage *img= b.imageBookCover;
        
        
        // se ejecuta en primer plano
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.bookCoverImage.image=img;
            
            [cell.activityIndicator stopAnimating];
            
        });
    });
    
    
    
    return cell;
    
    
    
    
    
    
    // Devolverla
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //cogemos el libro seleccionado
    
    IAABook *book =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear el controlador
 /*   IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:book];
    
    // Hacer un push
    [self.navigationController pushViewController:bookVC
   animated:YES];
   */
    
    // Avisar al delegado
    [self.delegate IAALibraryTableViewController:self didSelectBook:book];
    
    
    //mandamos una notificacion
    
 //   NSNotification *notificationSelectNewCharacter = [NSNotification notificationWithName:DID_SELECT_NEW_BOOK_NOTIFICATION_NAME object:self                                                                                 userInfo:@{@"NEW_BOOK": book}];
    
 //   [[NSNotificationCenter defaultCenter] postNotification:notificationSelectNewCharacter];
    
    
    /*
     //creamos la nueva vista y le pasamos el libro
     IAABookViewController *bookVB = [[IAABookViewController alloc]initWithBook:book];
     
     [self.navigationController pushViewController:bookVB animated:YES];
     
     */
    
  //  [self saveLastSelectedBookAtSection:indexPath.section
                   //                 row:indexPath.row];
}

#pragma mark -  IAALibraryTableViewControllerDelegate

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                        didSelectBook:(IAABook *) aBook
{
    // Crear el controlador
    IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:aBook];

    
    // Hacer un push
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}
@end
