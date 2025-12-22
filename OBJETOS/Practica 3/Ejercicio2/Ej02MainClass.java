package tema3;

import PaqueteLectura.Lector;

public class Demo01Libro {

    public static void main(String[] args) {
        Libro libro = new Libro();
        Autor autor = new Autor();
        libro.setTitulo("Java: A Beginner's Guide");
        libro.setEditorial("Mcgraw-Hill");
        libro.setAñoEdicion(2014);
        libro.setISBN("978-0071809252");
        libro.setPrecio(21.72);
        System.out.println("Ingrese el nombre del autor: "); 
        autor.setNombre(Lector.leerString());
        System.out.println("Ingrese la biografia del autor: "); 
        autor.setBiografia(Lector.leerString());
        System.out.println("Ingrese el Origen del autor: "); 
        autor.setOrigen(Lector.leerString());
        libro.setAutor(autor);
        System.out.println(libro);
    }
}
