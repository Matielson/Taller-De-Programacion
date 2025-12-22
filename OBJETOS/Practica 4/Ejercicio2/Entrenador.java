package Ejercicio2Practica4;

public class Entrenador extends Empleado {
    
    // ATRIBUTO
    private int cantCampeonatos;
    
    // CONSTRUCTOR
    public Entrenador (String nombre, double sueldo, double antig, int campeonatos) {
        super(nombre, sueldo, antig);
        setCantCampeonatos(campeonatos);
    }
    
    // GETTER
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    // SETTER
    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    @Override
    public double calcularEfectividad() {
        return (getCantCampeonatos() / getAntiguedad());
    }
    
    @Override
    public double calcularSueldoACobrar() {
        if (getCantCampeonatos() >= 1) {
            if (getCantCampeonatos() > 4) {
                if (getCantCampeonatos() > 10) {
                    return (getSueldoBasico() * (1 + 0.10 * getAntiguedad()) + 50000);
                }
                else
                    return (getSueldoBasico() * (1 + 0.10 * getAntiguedad()) + 30000);
            }
            else 
                return (getSueldoBasico() * (1 + 0.10 * getAntiguedad()) + 5000);
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
