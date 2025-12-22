package Ejercicio2Practica4;

import PaqueteLectura.Lector;

public class MainClass {

    public static void main(String[] args) {
        
        // VARIABLES
        String nombre;
        double sueldoBasico, antiguedad;
        int partidos, goles, campeonatos;
        
        // LEER ATRIBUTOS DEL JUGADOR
        System.out.println("|---------|");
        System.out.println("Ingrese el nombre del jugador: ");
        nombre = Lector.leerString();
        
        System.out.println("|---------|");
        System.out.println("Ingrese el sueldo basico del jugador: ");
        sueldoBasico = Lector.leerDouble();
        
        System.out.println("|---------|");
        System.out.println("Ingrese la antiguedad del jugador: ");
        antiguedad = Lector.leerDouble();
        
        System.out.println("|---------|");
        System.out.println("Ingrese la cantidad de partidos del jugador: ");
        partidos = Lector.leerInt();
        
        System.out.println("|---------|");
        System.out.println("Ingrese la cantidad de goles del jugador: ");
        goles = Lector.leerInt();
        
        // CREAR EL JUGADOR
        Jugador j = new Jugador(nombre,sueldoBasico, antiguedad, partidos, goles);
        
        // LEER ATRIBUTOS DEL ENTRENADOR
        System.out.println("|---------|");
        System.out.println("Ingrese el nombre del entrenador: ");
        nombre = Lector.leerString();
        
        System.out.println("|---------|");
        System.out.println("Ingrese el sueldo basico del entrenador: ");
        sueldoBasico = Lector.leerDouble();
        
        System.out.println("|---------|");
        System.out.println("Ingrese la antiguedad del entrenador: ");
        antiguedad = Lector.leerDouble();
        
        System.out.println("|---------|");
        System.out.println("Ingrese la cantidad de campeonatos del entrenador: ");
        campeonatos = Lector.leerInt();
        
        // CREAR EL ENTRENADOR
        Entrenador e = new Entrenador(nombre,sueldoBasico, antiguedad, campeonatos);
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
}
