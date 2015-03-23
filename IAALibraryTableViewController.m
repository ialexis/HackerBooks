//
//  IAALibraryTableViewController.m
//  HackerBooks
//
//  Created by Ivan on 21/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAALibraryTableViewController.h"

@interface IAALibraryTableViewController ()

@end

@implementation IAALibraryTableViewController


-(id) initWithLibrary:(IAALibraryModel *) aLibrary style:(UITableViewStyle)aStyle
{

    if (self=[super initWithStyle:aStyle])
    {
        _modelLibrary=aLibrary;
    }
    self.title=@"Hacker Books";
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewDidAppear:(BOOL)animated
{
   // [self.modelLibrary loadFavorites];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.

    return [self.modelLibrary countOfTags]+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    //la seccion 0 es la de favoritos
    if (section ==0)
    {
        NSUInteger cantidad =[self.modelLibrary countOfFavorites];
        
        
        return cantidad;
        return [self.modelLibrary countOfFavorites];
    }
    else
    {
        return [self.modelLibrary bookCountForTag:[self.modelLibrary.tags objectAtIndex:section-1]];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section ==0)
    {
        return @"Favorites";
    }
    else
    {
        return [[self.modelLibrary tagAtIndex:section-1]capitalizedString];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    IAALibraryCellTableViewCell *cell = (IAALibraryCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    
   
    // Configuramos la celda...
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IAALibraryCellTableViewCell" owner:self options:nil];
        cell = (IAALibraryCellTableViewCell *)[nib objectAtIndex:0];
    }
    
    //averiguamos el libro que corresponde a la celda
    
    IAABook *book =nil;
    
    if (indexPath.section==0)
    {
        book=[self.modelLibrary bookForFavoriteAtIndex:indexPath.row];
        cell.bookFavoriteImage.highlighted=YES;
        cell.bookFavoriteImage.image = [UIImage imageNamed:@"726-star"];
        cell.bookFavoriteImage.highlightedImage= [UIImage imageNamed:@"726-star-selected"];

    }
    else
    {
        book=[self.modelLibrary bookForTag:[self.modelLibrary tagAtIndex:indexPath.section-1] atIndex:indexPath.row];
        cell.bookFavoriteImage.highlighted=false;
        cell.bookFavoriteImage.image = [UIImage imageNamed:@"721-bookmarks"];
        cell.bookFavoriteImage.highlightedImage= [UIImage imageNamed:@"721-bookmarks-selected"];
    }
    
    
    
    //Añadimos los datos a cada uno de los elementos de nuestra celda
   /* cell.disclosureImage.image = [UIImage imageNamed:@"miImagenDisclosure"];
    cell.titulo.text=@"Nombre";
    cell.subtitulo.text=@"Descripcion";
    cell.imagen.image = [UIImage imageNamed:@"721-bookmarks"];
    cell.fondoImagen.image=[UIImage imageNamed:@"miImagenFondo"];
    */
    
    cell.bookTitle.text=book.title;
    cell.bookCoverImage.image=book.bookCover;
    cell.bookAuthors.text = [book.authors componentsJoinedByString:@", "];
    return cell;
    

    
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Devuelve la altura de la fila
    
    return 50;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    //cogemos el libro seleccionado
    
    IAABook *book =nil;
    
    if (indexPath.section==0)
    {
        //cell.bookFavoriteImage.highlighted=YES;
        book=[self.modelLibrary bookForFavoriteAtIndex:indexPath.row];
    }
    else
    {
        book=[self.modelLibrary bookForTag:[self.modelLibrary tagAtIndex:indexPath.section-1] atIndex:indexPath.row];
    }
    
    //creamos la nueva vista y le pasamos el libro
    IAABookViewController *bookVB = [[IAABookViewController alloc]initWithBook:book];
    
    [self.navigationController pushViewController:bookVB animated:YES];
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
