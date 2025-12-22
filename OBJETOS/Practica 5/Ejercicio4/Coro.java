package ejercicio4practica5;

public abstract class Coro {
    private String nombre;
    private Director director;

    public Coro(String nombre, Director director) {
        this.nombre = nombre;
        this.director = director;
    }
    
    @Override
    public String toString() {
        return "Nombre Del Coro: " + this.nombre + "\n Director: " + this.director.toString() + "\n";
    }
    
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean isLleno();
    
}
