//
//  IAALibraryTableViewController.m
//  HackerBooks
//
//  Created by Ivan on 12/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAALibraryTableViewController.h"
#import "IAABook.h"

@interface IAALibraryTableViewController ()

@end

@implementation IAALibraryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    IAABook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellID = @"notebookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta -> celda)
    cell.textLabel.text = book.title;
    cell.imageView.image = [UIImage imageWithData:book.coverImage];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [nb.notes count]];
    
    // Devolverla
    return cell;

}
@end
