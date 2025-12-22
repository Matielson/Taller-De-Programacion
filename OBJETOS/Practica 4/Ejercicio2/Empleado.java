package Ejercicio2Practica4;

public abstract class Empleado {
    
    // ATRIBUTOS DE LA CLASE
    private String nombre;
    private double sueldoBasico;
    private double antiguedad;
    
    // CONSTRUCTOR DE LA CLASE
    public Empleado (String nom, double sueldo, double antig) {
        setNombre(nom);
        setSueldoBasico(sueldo);
        setAntiguedad(antig);
    }
    
    // GETTERS
    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public double getAntiguedad() {
        return antiguedad;
    }

    // SETTERS
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setAntiguedad(double antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    // TO STRING
    @Override
    public String toString () {
        String aux = (" | Nombre: " + getNombre() + " | Sueldo: " + this.calcularSueldoACobrar() + " | Efectividad: " + this.calcularEfectividad());
        return aux;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
