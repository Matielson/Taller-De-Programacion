package admzoom;

public class Participante {
    private String nombre;
    private String email;
    private String contrasenaIngresada;

    public Participante(String nombre, String email) {
        this.nombre = nombre;
        this.email = email;
        this.contrasenaIngresada = null;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEmail() {
        return email;
    }

    public String getContrasenaIngresada() {
        return contrasenaIngresada;
    }
    
    public Participante(String nombre, String email, String contrasenaIngresada) {
        this.nombre = nombre;
        this.email = email;
        this.contrasenaIngresada = contrasenaIngresada;
    }
    
}
