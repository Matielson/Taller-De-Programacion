package parcial12.pkg05.pkg2025;

public class Nadador extends Grupo{
    private String nombre;
    private double sueldo;

    public Nadador(String miNombre,double miSueldo,String superNombre, double sueldoInstructor, double costoInscripcion, int inscriptos) {
        super(superNombre,sueldoInstructor,costoInscripcion,inscriptos);
        this.nombre = miNombre;
        this.sueldo = miSueldo;
    }

    @Override
    public String getNombre() {
        return nombre;
    }

    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    @Override
    public boolean agregarChico(Chico c) {
       boolean aux = false;
       if (c.isSabeNadar()) {
           super.setvChicos(c);
           aux = true;
       }
       return aux;
    }
    
    @Override
    public double obtenerGananciaNeta() {
        return ((getCantChicos() * getCostoInscripcion()) - getSueldoInstructor() - this.sueldo);
    }
    
    @Override
    public String toString () {
        return (super.getNombre() + ", Cantidad de chicos inscriptos: " + super.getCantChicos() + "\n" + super.toString() + "Ganancia neta del grupo: " + obtenerGananciaNeta());
    }
    
    @Override
    public boolean esRentable () {
        boolean aux = false;
        if (obtenerGananciaNeta() > 5000000.0 ) {
            aux = true;
        }
        return aux;
    }
}

