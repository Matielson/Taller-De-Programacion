package parcial12.pkg05.pkg2025;

public class Chico {
    private String nombre;
    private int telefono;
    private boolean sabeNadar;

    public Chico(String nombre, int telefono, boolean sabeNadar) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.sabeNadar = sabeNadar;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public boolean isSabeNadar() {
        return sabeNadar;
    }

    public void setSabeNadar(boolean sabeNadar) {
        this.sabeNadar = sabeNadar;
    }
}
