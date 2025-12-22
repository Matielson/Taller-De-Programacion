package ejercicio4practica5;

public class Corista {
    private String nombre;
    private int dni;
    private int edad;
    private int tono;

    public Corista(String nombre, int dni, int edad, int tono) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    @Override
    public String toString() {
        return "Corista" + " Nombre: " + nombre + ", Dni: " + dni + ", Edad: " + edad + ", Tono: " + tono;
    }
}
