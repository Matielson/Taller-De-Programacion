package ejercicio4practica4;

import PaqueteLectura.GeneradorAleatorio;

public class MainClass {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion estacion = new Estacion("La Plata", -34.921, 57.955);
        SistemaRegistroAnios RegAnios = new SistemaRegistroAnios(estacion, 2021, 3);
        for (int i=0; i < 3; i++) {
            for (int j=0; j < 12; j++) {
                RegAnios.registrarTemperatura(GeneradorAleatorio.generarDouble(40), (j+1), (i+RegAnios.getAnioInicio()));
            }
        }
        System.out.println(RegAnios.toString());
        System.out.println(RegAnios.toString2());
        System.out.println("-----------------");
        
        Estacion estacion2 = new Estacion("Mar Del Plata", -38.002, -57.556);
        SistemaRegistroMeses RegMeses = new SistemaRegistroMeses(estacion2, 2020, 4);
        for (int i=0; i < 4; i++) {
            for (int j=0; j < 12; j++) {
                RegMeses.registrarTemperatura(GeneradorAleatorio.generarDouble(40), (j+1), (i+RegMeses.getAnioInicio()));
            }
        }
        System.out.println(RegMeses.toString());
        System.out.println(RegMeses.toString2());
        
    }
    
}
