package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02VectorPersonas {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        // DECLARO MI VECTOR DE 15 PERSONAS.
        Persona [] vPersonas = new Persona[15];
        
        // DECLARO VARIABLES PARA GENERAR PERSONAS.
        String nombre;
        int dni, edad = -1, i = 0;
        
        // LLENAR VECTOR CON INFO ALEATORIA.
        while ((i < 15) && (edad != 0)) {
            // GENERO LOS DATOS
            nombre = GeneradorAleatorio.generarString(7);
            dni = GeneradorAleatorio.generarInt(77777777);
            edad = GeneradorAleatorio.generarInt(100);
            // AGREGO LOS DATOS AL VECTOR CREANDO UNA PERSONA
            if (edad != 0) {
                vPersonas[i] = new Persona(nombre, dni, edad);
                // PASO A LA SIGUIENTE POSICION.
                i++;
            }
        }
        
        if (i > 0) {
            int mayor65 = 0;
            int menorDni = vPersonas[0].getDNI();
            String personaMenorDni = vPersonas[0].toString();
            
            for (int j=0; j < i; j++) {
                if (vPersonas[j].getEdad() > 65)
                    mayor65++;
                if (vPersonas[j].getDNI() < menorDni)
                    personaMenorDni = vPersonas[j].toString();
            }
            System.out.println("La cantidad de personas con edad mayor a 65 años es: " + mayor65);
            System.out.println(personaMenorDni);
        }
        else {
            System.out.println("No se genero ninguna persona (edad 0 en la primera iteracion).");
        }
    }
}
