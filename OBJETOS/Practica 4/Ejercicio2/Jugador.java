package Ejercicio2Practica4;

public class Jugador extends Empleado{
    
    // ATRIBUTOS
    private int numPartidos;
    private int numGoles;
    
    // CONSTRUCTOR
    public Jugador (String nombre, double sueldo, double antig, int partidos, int goles) {
        super(nombre, sueldo, antig);
        setNumPartidos(partidos);
        setNumGoles(goles);
    }
    
    // GETTERS
    public int getNumPartidos() {
        return numPartidos;
    }

    public int getNumGoles() {
        return numGoles;
    }
    
    // SETTERS
    public void setNumPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    @Override
    public double calcularEfectividad() {
        return ((double)getNumGoles() / getNumPartidos());
    }
    
    @Override
    public double calcularSueldoACobrar() {
        if (((double)getNumGoles() / getNumPartidos()) > 0.5) {
            return (getSueldoBasico() * (1 + 0.10 * getAntiguedad()) + getSueldoBasico());
        }
        else
            return getSueldoBasico() * (1 + 0.10 * getAntiguedad());
    }
    
    // REDEFINICION TO STRING
    @Override
    public String toString(){
       String aux = super.toString();
       return aux;
    }
}
