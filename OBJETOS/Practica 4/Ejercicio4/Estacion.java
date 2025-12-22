package ejercicio4practica4;

public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;

    public Estacion(String nombre, double latitud, double longitud) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public String getNombre() {
        return nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public double getLongitud() {
        return longitud;
    }
    
    @Override
    public String toString() {
        return "Estacion:" + nombre + "- Latitud: " + latitud + "- Longitud: " + longitud;
    }
    
    
}
