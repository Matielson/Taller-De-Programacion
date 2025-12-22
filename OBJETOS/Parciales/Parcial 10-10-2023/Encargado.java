package parcial10102023;

public class Encargado {
    private String nombre;
    private int dni;
    private int anioIngreso;
    private double sueldoBasico;
    private int cantEmpleadosACargo;

    public Encargado(String nombre, int dni, int anioIngreso, double sueldoBasico, int cantEmpleadosACargo) {
        this.nombre = nombre;
        this.dni = dni;
        this.anioIngreso = anioIngreso;
        this.sueldoBasico = sueldoBasico;
        this.cantEmpleadosACargo = cantEmpleadosACargo;
    }
    
    public double sueldoACobrar () {
        if ((2025 - this.anioIngreso) > 20) {
            return this.sueldoBasico + (this.sueldoBasico * 0.10) + (1000 * this.cantEmpleadosACargo);
        }
        return this.sueldoBasico + (1000 * this.cantEmpleadosACargo);
    }
    
    @Override
    public String toString () {
        return "Nombre: " + this.nombre + " DNI: " + this.dni + " Sueldo a cobrar: " + this.sueldoACobrar();
    }
}
