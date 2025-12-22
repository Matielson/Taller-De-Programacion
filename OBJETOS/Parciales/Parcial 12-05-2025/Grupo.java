package parcial12.pkg05.pkg2025;

public abstract class Grupo {
    private String nombre;
    private double sueldoInstructor;
    private double costoInscripcion;
    private Chico vChicos[];
    private int cantChicos = 0;
    private int cantMax;

    public Grupo(String nombre, double sueldoInstructor, double costoInscripcion, int Inscriptos) {
        this.nombre = nombre;
        this.sueldoInstructor = sueldoInstructor;
        this.costoInscripcion = costoInscripcion;
        this.vChicos = new Chico[Inscriptos];
        this.cantMax = Inscriptos;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoInstructor() {
        return sueldoInstructor;
    }

    public void setSueldoInstructor(double sueldoInstructor) {
        this.sueldoInstructor = sueldoInstructor;
    }

    public double getCostoInscripcion() {
        return costoInscripcion;
    }

    public void setCostoInscripcion(double costoInscripcion) {
        this.costoInscripcion = costoInscripcion;
    }

    public Chico[] getvChicos() {
        return vChicos;
    }
    
    public void setvChicos(Chico miChico) {
        if (cantChicos < cantMax) {
            this.vChicos[cantChicos] = miChico;
            cantChicos++;
        }
    }
    
    public int getCantChicos () {
        return cantChicos;
    }
    
    @Override
    public String toString () {
        String aux = "";
        for (int i=0; i < cantChicos; i++) {
            aux += "Chico " + (i+1) + ": " +vChicos[i].getNombre() + " " + vChicos[i].getTelefono() + " Sabe nadar? " + vChicos[i].isSabeNadar() + "\n";
        }
        return aux;
    }
    
    public abstract boolean agregarChico(Chico c);
    public abstract double obtenerGananciaNeta();
    public abstract boolean esRentable();
}
