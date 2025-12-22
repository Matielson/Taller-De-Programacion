package tema3;

import PaqueteLectura.Lector;

public class Ej01MainClass {
    
    public static void main(String[] args) {
        // CREO EL OBJETO (VACIO)
        Triangulo t1 = new Triangulo();
        
        
        // LEO DATOS POR TECLADO Y LOS CARGO EN CADA CAMPO DEL OBJETO
        System.out.println("Ingrese el lado 1: ");
        t1.setLado1(Lector.leerDouble());
        
        System.out.println("Ingrese el lado 2: ");
        t1.setLado2(Lector.leerDouble());
        
        System.out.println("Ingrese el lado 3: ");
        t1.setLado3(Lector.leerDouble());
        
        System.out.println("Ingrese el color de relleno: ");
        t1.setColorRelleno(Lector.leerString());
        
        System.out.println("Ingrese el color del delineado: ");
        t1.setColorLinea(Lector.leerString());
        
        // INFORMO EN CONSOLA EL PERIMETRO Y EL AREA
        System.out.println(t1.calcularPerimetro());
        System.out.println(t1.calcularArea());

    }
}
