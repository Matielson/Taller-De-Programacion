package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    
    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar ();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int[5][5];
        int i, j, sumaFilaUno = 0, sumaTotalColumna = 0, num;
        int [] vector = new int [5];
        boolean seEncontro = false;
        for (i=0; i < 5; i++){
            for(j=0; j < 5; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0; i < 5; i++) {
            System.out.print("------------------");
            System.out.println("");
            for (j=0; j < 5; j++) {
                System.out.println("("+i+","+j+"): " + matriz [i][j] + " | ");
            }
        }
        System.out.println("------------------");
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (j=0; j < 5; j++) {
            sumaFilaUno = sumaFilaUno + matriz [1][j];
        }
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        for (j=0; j < 5; j++) {
            for (i=0; i < 5; i++) {
                sumaTotalColumna = sumaTotalColumna + matriz [i][j];
            }
            vector[j] = sumaTotalColumna;
            sumaTotalColumna = 0;
        }
        
        for(i=0;i<5;System.out.println(vector[i++]));
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        i = 1;
        num = Lector.leerInt();
        while ((i < 5) && (seEncontro == false)){
            for (j=0; j < 5; j++) {
                if (num == matriz [i][j]) {
                    seEncontro = true;
                    System.out.println("El numero dado se encontro en la posicion" + "("+i+","+j+").");
                }
            }
            i++;
        }
        if (seEncontro == false)
            System.out.println("El numero dado NO se encontro en la matriz.");
    }
}
