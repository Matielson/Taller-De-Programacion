package parcial14102024;

public class Sandwich {
    private String nombre;
    private Pan pan;
    private Ingrediente vIngredientes[];
    private int cantMax;
    private int cantActual = 0;

    public Sandwich(String nombre, Pan miPan, int capacidad) {
        this.nombre = nombre;
        this.pan = miPan;
        this.vIngredientes = new Ingrediente[capacidad];
        this.cantMax = capacidad;
    }
    
    public void agregarIngrediente (Ingrediente miIngrediente) {
        if (this.cantActual < this.cantMax) {
            vIngredientes[cantActual] = miIngrediente;
            this.cantActual++;
        }
    }
    
    public double costoTotalIngredientes () {
        double aux = 0;
        for (int i=0; i < cantActual; i++) {
            aux += vIngredientes[i].retornarCosto();
        }
        return aux;
    }
    
    public String representarIngredientes () {
        String aux = "";
        for (int i=0; i < cantActual; i++) {
            aux += "Ingrediente: " + (i+1) + " " + vIngredientes[i].toString() + "\n";
        }
        return aux;
    }
    
    @Override
    public String toString () {
        return ("Nombre: " + this.nombre + " de " + pan.toString() + " \nCantidad Ingredientes: " + this.cantActual + "\n" +representarIngredientes() + "Costo Final Sandwich: " + (costoTotalIngredientes() + pan.retornarCosto()));
    }

}
