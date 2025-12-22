package Ejercicio3Practica4;

public class Trabajador extends Persona{
    
    private String tarea;

    public Trabajador (String nombre, int dni, int edad, String trabajo) {
        super(nombre,dni,edad);
        setTarea(trabajo);
    }
    
    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    public String toString () {
        return (super.toString() + " Soy " + getTarea() + ".");
    }
}
