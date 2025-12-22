package ejercicio2practica5n;

public class Auto {
    private String nombreDuenio;
    private String patente;

    public Auto(String nombreDuenio, String patente) {
        this.nombreDuenio = nombreDuenio;
        this.patente = patente;
    }

    public String getPatente() {
        return patente;
    }
    
    @Override
    public String toString () {
        return " Dueño: " + this.nombreDuenio + " Patente: " + this.patente;
    }
    
}
