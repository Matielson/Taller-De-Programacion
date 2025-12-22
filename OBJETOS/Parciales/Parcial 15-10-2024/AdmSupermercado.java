package parcial15102024;

import PaqueteLectura.GeneradorAleatorio;

public class AdmSupermercado {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        /// CREO EL SUPERMERCADO
        Supermercado superChino = new Supermercado("Chino la concha de tu vieja", "44 entre 9 y 10", 3,4);
        
        /// CREO Y AGREGO TODOS LOS PRODUCTOS EN EL SUPERMERCADO
        int codigo = 100;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                Producto p = new Producto(codigo++,"Producto:" + GeneradorAleatorio.generarInt(100),"Marca:" + GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50) + 1, GeneradorAleatorio.generarDouble(5000) + 1000);
                superChino.registrarProducto(p);
            }
        }
        
        /// BUSCO UN PRODUCTO EN LA GONDOLA 1
        System.out.println(superChino.listarProducto("Dos Molinos", 0));
        
        /// BUSCO LA GONDOLA CON MAYOR UNIDADES
        System.out.println(superChino.gondolaConMayorUnidades());
        
        /// MUESTRO EL SUPERMERCADO COMO STRING
        System.out.println(superChino.toString());
        
    }
    
}
