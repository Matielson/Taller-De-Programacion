package ejercicio3practica5n;

public class SistemaProductorMusical {

    public static void main(String[] args) {
        EventoOcasional evOcasional = new EventoOcasional("The Rolling Stones", 5, "Show Privado", "Gobierno De La Ciudad", "20 Nov");
        
        Gira gira = new Gira ("YSY A", 10, "Cumpleaños de 15", 3);
        
        gira.agregarFecha(new Fecha("La Plata", "18 Nov"));
        gira.agregarFecha(new Fecha("Cordoba", "23 Nov"));
        gira.agregarFecha(new Fecha("Rosario", "2 Dic"));
        
        System.out.println("El costo del evento ocasional ingresado es de: " + evOcasional.calcularCosto());
        System.out.println("El costo de la gira ingresada es de: " + gira.calcularCosto());
        
        evOcasional.actuar();
        gira.actuar();
    }
    
}
