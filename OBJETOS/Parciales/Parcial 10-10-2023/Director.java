package parcial10102023;

public class Director {
    private String nombre;
    private int dni;
    private int anioIngreso;
    private double sueldoBasico;
    private double montoViaticos;

    public Director(String nombre, int dni, int anioIngreso, double sueldoBasico, double montoViaticos) {
        this.nombre = nombre;
        this.dni = dni;
        this.anioIngreso = anioIngreso;
        this.sueldoBasico = sueldoBasico;
        this.montoViaticos = montoViaticos;
    }
    
    public double sueldoACobrar () {
        if ((2025 - this.anioIngreso) > 20) {
            return this.sueldoBasico + this.montoViaticos + (this.sueldoBasico * 0.10);
        }
        return this.sueldoBasico + this.montoViaticos;
    }
    
    @Override
    public String toString () {
        return "Nombre: " + this.nombre + " DNI: " + this.dni + " Sueldo a cobrar: " + this.sueldoACobrar();
    }
    
}
