package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02VectorPersonas {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        // CREACION DE MATRIZ PARA EL CASTING
        Persona[][] casting = new Persona [5][8];
        
        // INICIALIZACION DE VARIABLES
        int totalInscriptos = 0;
        int dia = 0, turno = 0;
        int dni, edad;
        String nombre = GeneradorAleatorio.generarString(3);
        while ((totalInscriptos < 40) && (!nombre.equals("ZZZ"))) {
            dni = GeneradorAleatorio.generarInt(77777777);
            edad = GeneradorAleatorio.generarInt(100);

            casting[dia][turno] = new Persona(nombre, edad, dni);
            totalInscriptos++;
            turno++;
            
            if (turno == 8) {
                turno = 0;
                dia++;
            }

            if (totalInscriptos < 40) {
                nombre = GeneradorAleatorio.generarString(3);
            }
        }
        
        for (int i=0; i < 5; i++) {
            for (int j=0; j < 8; j++) {
                System.out.println("Para el dia: " +(i+1)+ " turno: " +(j+1)+ " el nombre registrado es: " + casting[i][j].getNombre());
            }
        }
    }
}
