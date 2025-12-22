package parcial10102023;

public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    private Encargado[] vEncargados;
    private int dimF;
    
    public Empresa (String nombre, String direccion, Director unDirector, int cantSucursales) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = unDirector;
        this.dimF = cantSucursales;
        this.vEncargados = new Encargado[cantSucursales];
        this.inicializarVector();
    }
    
    private void inicializarVector() {
        for (int i=0; i < dimF; i++) {
            this.vEncargados[i] = null;
        }
    }
    
    public void agregarEncargado (Encargado unEncargado, int numSucursal) {
        this.vEncargados[numSucursal - 1] = unEncargado;
    }
    
    public double sueldoACobrarEmpleados () {
        double aux = this.director.sueldoACobrar();
        for (int i=0; i < dimF; i++) {
            if (this.vEncargados[i] != null) {
                aux += this.vEncargados[i].sueldoACobrar();
            }
        }
        return aux;
    }
    
    @Override
    public String toString () {
        String aux = "Empresa " + this.nombre + "\n Direccion: " + this.direccion + "\n Director: " + this.director.toString() + "\n Encargados: \n ";
        
        for (int i=0; i < dimF; i++) {
            aux += "Sucursal " + (i+1) + "\n";
            if (this.vEncargados[i] != null) {
                aux += this.vEncargados[i].toString() + "\n";
            }
            else
                aux += "Sin Encargado." + "\n";
        }
        return aux;
    }
}
