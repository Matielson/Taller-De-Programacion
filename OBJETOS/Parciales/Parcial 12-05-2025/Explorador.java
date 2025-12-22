package parcial12.pkg05.pkg2025;

public class Explorador extends Grupo{
    private double costoAlquiler;

    public Explorador(double costoAlquiler, String nombre, double sueldoInstructor, double costoInscripcion, int Inscriptos) {
        super(nombre, sueldoInstructor, costoInscripcion, Inscriptos);
        this.costoAlquiler = costoAlquiler;
    }
    
    public double getCostoAlquiler() {
        return costoAlquiler;
    }

    public void setCostoAlquiler(double costoAlquiler) {
        this.costoAlquiler = costoAlquiler;
    }
    
    @Override
    public boolean agregarChico(Chico c) {
       super.setvChicos(c);
       return true;
    }
    
    @Override
    public double obtenerGananciaNeta() {
        return ((getCantChicos() * getCostoInscripcion()) - getSueldoInstructor() - this.costoAlquiler);
    }
    
    @Override
    public String toString () {
        return (super.getNombre() + ", Cantidad de chicos inscriptos: " + super.getCantChicos() + "\n" + super.toString() + "Ganancia neta del grupo: " + obtenerGananciaNeta());
    }
    
    @Override
    public boolean esRentable () {
        boolean aux = false;
        if (obtenerGananciaNeta() > 50000000.0 ) {
            aux = true;
        }
        return aux;
    }
}
