# HackerBooks
Repositorio de la practica del curso AGBO Fundamentos iOS

**Procesado de JSON**

diferencias entre isKindOfClass y isMemberOfClass

*isKindOfClass*: devuelve YES si recive una instancia de de la clase especificada o bien de alguna clase que herede de la clase especificada.

*isMemberOfClass*: devuelve YES unicamente si recive una instancia de de la clase especificada.


**Modelo**

Los datos descargados de portada y PDF los guardo en el directorio de cache de la aplicacion ya que si por cualquier motivo el iDevice considera que deber borrarlos, se descargan de nuevo automaticamente.


**Tabla de libros**

Como almaceno los libros favoritos: Los almaceno en un diccionario que guardo en NSDefauts.

¿Se me ocurre mas de una forma de hacerlo? si, se podria hacer tambien almacenandolo en un array o de forma mas optima usando bases de datos, pero como eso no lo hemos visto todavia he optado por guardar el modelo en forma del fichero JSON original y los favoritos en un diccionario para poder buscarlos rapidamente por titulo en un momento dado.

 El aviso desde AGTBook a un AGTLibraryTableViewController: Realmente se me ocurren 1 formas de hacerlo en este caso y es mediante notificaciones, en otras circunstancias la primera opcion seria mediante el mecanismo del delegado, la segundo mediante una notificacion. En este caso al ser un modelo de datos el que comunica informacion, hacerlo desde delegado seria muy complicado y ademas poco comun, lo habitual en estos casos es usar notificaciones si o si.

