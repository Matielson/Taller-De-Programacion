package ejercicio4practica5;

public class SistemaEscuela {

    public static void main(String[] args) {
        Director director1 = new Director("Gonzo", 35671521, 38, 8);
        Director director2 = new Director("Lauro", 22642382, 46, 13);
        
        CoroPorHileras coroHileras = new CoroPorHileras("Coro Hileras", director1, 5,5);
        CoroSemiCircular coroCircular = new CoroSemiCircular("Coro Circular", director2, 5);
        
        Corista c1 = new Corista("Juan Pérez", 12345678, 25, 80);
        Corista c2 = new Corista("María López", 23456789, 30, 75);
        Corista c3 = new Corista("Luis Gómez", 34567890, 22, 70);
        Corista c4 = new Corista("Ana Torres", 45678901, 28, 65);
        Corista c5 = new Corista("Pedro Díaz", 56789012, 27, 60);
        
        coroHileras.agregarCorista(c1);
        coroHileras.agregarCorista(c2);
        coroHileras.agregarCorista(c3);
        coroHileras.agregarCorista(c4);
        coroHileras.agregarCorista(c5);
        
        Corista c6  = new Corista("Valentina Ríos", 67890123, 23, 78);
        Corista c7  = new Corista("Martín Cabrera", 78901234, 29, 74);
        Corista c8  = new Corista("Camila Herrera", 89012345, 21, 72);
        Corista c9  = new Corista("Diego Fernández", 90123456, 26, 68);
        Corista c10 = new Corista("Lucía Benítez", 12340987, 24, 64);
        
        coroCircular.agregarCorista(c6);
        coroCircular.agregarCorista(c7);
        coroCircular.agregarCorista(c8);
        coroCircular.agregarCorista(c9);
        coroCircular.agregarCorista(c10);
        
        System.out.println(coroHileras.toString());
        System.out.println("Esta bien ordenado? " + coroHileras.bienFormado());
        System.out.println("Esta lleno? " + coroHileras.isLleno());
        
        System.out.println("\n ------------------ \n");
        
        System.out.println(coroCircular.toString());
        System.out.println("Esta bien ordenado? " + coroCircular.bienFormado());
        System.out.println("Esta lleno? " + coroCircular.isLleno());
    }
    
}
