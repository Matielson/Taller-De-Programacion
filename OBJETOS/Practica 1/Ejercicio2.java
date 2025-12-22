package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new double [15];
        //Paso 4: Declarar indice y variables auxiliares a usar
        double altura, sumaAlturas = 0, promedioAlturas;
        int cantJugadores = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (int i = 0; i < 15; i++) {
            altura = Lector.leerDouble();
            vector[i] = altura;
            sumaAlturas = sumaAlturas + altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedioAlturas = sumaAlturas / 15;
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (int i = 0; i < 15; i++) {
            if (vector[i] > promedioAlturas)
                cantJugadores = cantJugadores + 1;
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores que superan el promedio de altura es: " + cantJugadores);
    }
}
