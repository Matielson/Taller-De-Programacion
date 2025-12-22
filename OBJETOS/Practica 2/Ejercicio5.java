package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej05Partido {

    public static void main(String[] args) {
        Partido [] vPartidos = new Partido[20];
        int cantPartidos = 0;
        
        String equipoLocal = GeneradorAleatorio.generarString(7);
        String equipoVisitante = GeneradorAleatorio.generarString(7);
        int cantLocal = GeneradorAleatorio.generarInt(10);
        int cantVisitante = GeneradorAleatorio.generarInt(10);
        int cantRiver = 0;
        int cantGolesBoca = 0;
        
        while ((cantPartidos < 20) && !equipoVisitante.equals("ZZZ"))  {
            vPartidos[cantPartidos] = new Partido(equipoLocal, equipoVisitante, cantLocal, cantVisitante);
            
            if (vPartidos[cantPartidos].getGanador().equals("River")) {
                cantRiver++;
            }
            
            if (vPartidos[cantPartidos].getLocal().equals("Boca")) {
                cantGolesBoca = cantGolesBoca + vPartidos[cantPartidos].getGolesLocal();
            }
            
            cantPartidos++;
            
            if (cantPartidos < 20) {
                equipoLocal = GeneradorAleatorio.generarString(7);
                equipoVisitante = GeneradorAleatorio.generarString(7);
                cantLocal = GeneradorAleatorio.generarInt(10);
                cantVisitante = GeneradorAleatorio.generarInt(10);
            }
        }
        
        for (int i=0; i<20; i++) {
            System.out.println("Local: " + vPartidos[i].getLocal() + " Goles: " + vPartidos[i].getGolesLocal() + (" VS") + (" Visitante: ") + vPartidos[i].getVisitante() + (" Goles: ") +vPartidos[i].getGolesVisitante());
        }
        
        System.out.println("--------------");
        System.out.println("La cantidad de partidos que gano River fue de: " + cantRiver);
        System.out.println("La cantidad de goles que realizo Boca jugando de local fue de: " + cantGolesBoca);
    }
}
