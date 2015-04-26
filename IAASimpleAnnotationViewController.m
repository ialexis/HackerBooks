//
//  IAASimpleAnnotationViewController.m
//  HackerBooks
//
//  Created by Ivan on 26/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAASimpleAnnotationViewController.h"
#import "IAAPhotoViewController.h"
#import "IAAPhoto.h";

@interface IAASimpleAnnotationViewController ()

@end

@implementation IAASimpleAnnotationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja en notificaciones
    [self tearDownKeyboardNotifications];
    
    // Sincronizo vistas -> Modelo
    
    //self.model.name = self.nameView.text;
    self.model.text = self.annotationText.text;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
-(id) initWithModel:(IAAAnnotation *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Asignamos delegados
    self.nameView.delegate = self;
    
    // Alta en notificaciones de teclado
    [self setupKeyboardNotifications];
    
    
    //añadirmos esta linea para que muestre el boton de camara
    UIBarButtonItem *buttonCamera = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                     target:self action:@selector(displayPhoto:)];
    
    self.navigationItem.rightBarButtonItem = buttonCamera;
    
    // Sincornizar modelo -> Vista
    
    // Fechas
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateLabel.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateLabel.text = [fmt stringFromDate:self.model.modificationDate];
    
    //imagen
    self.photoImageView.image = self.model.photo.image;
    
    
    // Texto
    self.annotationText.text = self.model.text;
    
}

#pragma mark - Actions
- (IBAction)displayPhoto:(id)sender {
 /*   if (self.model.photo == nil)
    {
        self.model.photo = [IAAPhoto photoWithImage:nil context:self.model.managedObjectContext];
    }
   */ 
    

    // Crear un controlador de fotos
    IAAPhotoViewController *pVC = [[IAAPhotoViewController alloc]
                                   initWithPhoto:self.model.photo];
    
    // Push que te crió
    [self.navigationController pushViewController:pVC
                                         animated:YES];
    
}


-(IBAction)hideKeyboard:(id)sender{
    
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // Buen momento para validar el texto
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    // Buen momento para guardar el texto
}


-(void) setupKeyboardNotifications{
    
    // Alta en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
}


-(void) tearDownKeyboardNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc removeObserver:self];
    
}

// UIKeyboardWillShowNotification
-(void) notifyThatKeyboardWillAppear:(NSNotification *)n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Sacar el tamaño (bounds) del teclado del objeto
    // userInfo que viene en la notificación
    NSValue *wrappedFrame = [n.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbdFrame = [wrappedFrame CGRectValue];
    
    
    // Calcular los nuevos bounds de self.textView
    // Hacerlo con una animación que coincida con la
    // del teclado
    CGRect currentFrame = self.annotationText.frame;
    
    CGRect newRect = CGRectMake(currentFrame.origin.x,
                                currentFrame.origin.y,
                                currentFrame.size.width,
                                currentFrame.size.height -
                                kbdFrame.size.height +
                                self.bottomBar.frame.size.height);
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.annotationText.frame = newRect;
                     }];
    
    
    
}

// UIKeyboardWillHideNotification
-(void)notifyThatKeyboardWillDisappear:(NSNotification *) n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Devolver a self.textView su bounds original
    // mediante una animación que coincide con la
    // del teclado.
    [UIView animateWithDuration:duration
                     animations:^{
                         self.annotationText.frame = CGRectMake(8,
                                                          150,
                                                          304,
                                                          359);
                         
                     }];
}




@end
