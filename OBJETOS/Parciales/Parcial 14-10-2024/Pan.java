package parcial14102024;

public class Pan extends Componente{
    private String calidad;

    public Pan(String nombre, double costo, String calidad) {
        super(nombre,costo);
        this.calidad = calidad;
    }
    
    @Override
    public double retornarCosto () {
        double aux = super.getCosto();
        if (this.calidad.contentEquals("Premium")) {
            aux = aux * 1.20;
        }
        return aux;
    }
    
    @Override
    public String toString () {
        return (super.getNombre() + " - " + retornarCosto() + " - " +  this.calidad);
    }
    
    
}
