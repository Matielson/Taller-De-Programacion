package ejercicio1practica5;

public class Investigador {
    private String nombre;
    private String categoria;
    private String especialidad;
    private Subsidio vSubsidios[];

    public Investigador(String nombre, String categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }
    
    public void agregarSubsidio (Subsidio unSubsidio) {
        boolean verificar = false;
        int i = 0;
        while ((verificar != true) && (i < 5)) {
            if (vSubsidios[i] == null) {
                vSubsidios[i] = unSubsidio;   
                verificar = true;
            }
            i++;
        }
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Subsidio[] getvSubsidios() {
        return vSubsidios;
    }

    public void setvSubsidios(Subsidio[] vSubsidios) {
        this.vSubsidios = vSubsidios;
    }
    
}
