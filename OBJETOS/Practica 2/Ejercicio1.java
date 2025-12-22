package tema2;

import PaqueteLectura.Lector;

public class Ej01Persona {

    public static void main(String[] args) {
        // DEFINO LAS VARIABLES A USAR EN LA CREACION DE LA PERSONA.
        String nombre;
        int edad, dni;
        // LEO POR TECLADO VALORES Y ASIGNO A LAS VARIABLES.
        System.out.println("Ingrese el nombre de la persona: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese la edad de la persona: ");
        edad = Lector.leerInt();
        System.out.println("Ingrese el dni de la persona: ");
        dni = Lector.leerInt();
        // CREO MI OBJETO PERSONA.
        Persona miPersona = new Persona(nombre, dni, edad);
        // REPRESENTO EL OBJETO CON EL (toString())
        System.out.println(miPersona.toString());
    }
}
