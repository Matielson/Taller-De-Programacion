package parcial14102024;

public abstract class Componente {
    private String nombre;
    private double costo;

    public Componente(String nombre, double costo) {
        this.nombre = nombre;
        this.costo = costo;
    }

    public double getCosto() {
        return costo;
    }

    public String getNombre() {
        return nombre;
    }
    
    public abstract double retornarCosto();
    @Override
    public abstract String toString();
    
}
