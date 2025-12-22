package nuestroparcial;

public class Cliente {
    private int dni;
    private String nombre;
    private int telefono;
    private String localidad;
    private boolean contrataSeguro;

    public Cliente(int dni, String nombre, int telefono, String localidad, boolean contrataSeguro) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.localidad = localidad;
        this.contrataSeguro = contrataSeguro;
    }

    public String getLocalidad() {
        return localidad;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public boolean isContrataSeguro() {
        return contrataSeguro;
    }
    
    
}
