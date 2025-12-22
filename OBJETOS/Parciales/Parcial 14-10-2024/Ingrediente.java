package parcial14102024;

public class Ingrediente extends Componente{
    private String grupo;

    public Ingrediente(String nombre, double costo, String grupo) {
        super(nombre,costo);
        this.grupo = grupo;
    }
    
    @Override
    public double retornarCosto () {
        double aux = super.getCosto();
        if (this.grupo.contentEquals("B")) {
            aux = aux * 1.10;
        }
        return aux;
    }
    
    @Override
    public String toString () {
        return (super.getNombre() + " - " + retornarCosto() + " - " +  this.grupo);
    }
    
}
