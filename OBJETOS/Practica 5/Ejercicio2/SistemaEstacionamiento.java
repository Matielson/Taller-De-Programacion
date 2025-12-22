package ejercicio2practica5n;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class SistemaEstacionamiento {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacionamiento estacionamiento = new Estacionamiento("Negros", "9 y 50", "8:30", "22:00", 3,3);
        
        Auto auto1 = new Auto("Laura", "AH426GE");
        Auto auto2 = new Auto("Gonzo", "AE972KL");
        Auto auto3 = new Auto("Veronica", "AF267HQ");
        Auto auto4 = new Auto("Eduardo", "OUG731");
        Auto auto5 = new Auto("Virginia", "AA483II");
        Auto auto6 = new Auto("Melanie", "AB600RE");
        
        estacionamiento.agregarAuto(auto1, 0, 0);
        estacionamiento.agregarAuto(auto2, 0, 1);
        estacionamiento.agregarAuto(auto3, 1, 1);
        estacionamiento.agregarAuto(auto4, 2, 0);
        estacionamiento.agregarAuto(auto5, 2, 1);
        estacionamiento.agregarAuto(auto6, 2, 2);
        
        System.out.println(estacionamiento.toString());
        System.out.println(estacionamiento.devolverCantEnPlaza(1));
        
        System.out.println(estacionamiento.devolverPosAuto(Lector.leerString()));
    }
    
}
