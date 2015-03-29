# HackerBooks
Repositorio de la practica del curso AGBO Fundamentos iOS

**Procesado de JSON**

diferencias entre isKindOfClass y isMemberOfClass

*isKindOfClass*: devuelve YES si recive una instancia de de la clase especificada o bien de alguna clase que herede de la clase especificada.

*isMemberOfClass*: devuelve YES unicamente si recive una instancia de de la clase especificada.


**Modelo**

Los datos descargados de portada y PDF los guardo en el directorio de cache de la aplicacion ya que si por cualquier motivo el iDevice considera que deber borrarlos, se descargan de nuevo automaticamente.


**Tabla de libros**

*Como almaceno los libros favoritos:* Los almaceno en un diccionario que guardo en NSDefauts, dicho diccionario se va actualizando cada vez que hay algun cambio en algun libro (un libro es marcado como favorito o desmarcado como tal).

*¿Se me ocurre mas de una forma de hacerlo?* si, se podria hacer tambien almacenandolo en un array o de forma mas optima usando bases de datos (preferiblemente coredata=, pero como eso no lo hemos visto todavia he optado por guardar el modelo en forma del fichero JSON original y los favoritos en un diccionario para poder buscarlos rapidamente por titulo en un momento dado.

 *El aviso desde AGTBook a un AGTLibraryTableViewController:* Realmente se me ocurre solo 1 forma de hacerlo en este caso y es mediante notificaciones, en otras circunstancias la primera opcion seria mediante el mecanismo del delegado, la segundo mediante una notificacion. En este caso al ser un modelo de datos el que comunica informacion, hacerlo desde delegado seria muy complicado y ademas poco comun y rebuscado (creo), lo habitual en estos casos es usar notificaciones si o si.

*¿Es una aberracion cargar los libros de nuevo?* En absoluto, el mecanismo esta muy optimizado y solo se recarga en cada momento unicamente el contenido que se muestra en pantalla lo que tiene un efecto practicamente nulo en el rendimiento general del sistema.

**Controlador de PDF**

¿como se cuando el usuario cambia de libro? mediante una notificacion a la que suscribo el controlador del PDF. La tabla solo puede tener un delegado al que avisar cuando se cambia de libro, y este es o bien ella misma (Caso iphone) o bien la vista del libro (caso de tener un splitview en un iPad), por tanto para avisar a una tercera vista solo esta la opcion de la notificacion.

