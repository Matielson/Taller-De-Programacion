package parcial15102024;

public class Supermercado {
    
    /// ATRIBUTOS DE LA CLASE SUPERMERCADO
    private String nombre;
    private String direccion;
    private Producto estructura[][];
    private int gondolaActual = 0;
    private int estanteActual = 0;
    private int gondolaMax;
    private int estanteMax;

    /// CONSTRUCTOR DE LA CLASE SUPERMERCADO
    public Supermercado(String nombre, String direccion, int gondolas, int estantes) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.estructura = new Producto[gondolas][estantes];
        this.gondolaMax = gondolas;
        this.estanteMax = estantes;
    }

    /// GETTERS Y SETTERS
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Producto[][] getEstructura() {
        return estructura;
    }

    public void setEstructura(Producto[][] estructura) {
        this.estructura = estructura;
    }
    
    /// METODOS PROPIOS DE LA CLASE
    
    public void registrarProducto (Producto miProducto) {
        if (this.estanteActual < this.estanteMax) {
            estructura[gondolaActual][estanteActual] = miProducto;
            estanteActual++;
            if (this.estanteActual == this.estanteMax) {
                this.gondolaActual++;
                estanteActual = 0;
            }
        }
    }
    
    public String listarProducto (String marcaABuscar, int gondolaABuscar) {
        String aux = "No se encontro el elemento solicitado en la gondola " + gondolaABuscar ;
        for (int i=0; i < estanteMax; i++) {
            if (estructura[gondolaABuscar][i].getMarca().contentEquals(marcaABuscar)) {
                aux = "Producto{" + estructura[gondolaABuscar][i].getCodigo() + " - " + estructura[gondolaABuscar][i].getNombre() + " - " + estructura[gondolaABuscar][i].getCantUnidadesExhibidas() + " - " + estructura[gondolaABuscar][i].getPrecioPorUnidad() + "} \n";
            }
        }
        return aux;
    }
    
    public int gondolaConMayorUnidades () {
        int maxActual = 0;
        int maxGondola = -1;
        for (int i=0; i < gondolaMax; i++) {
            int j;
            for (j=0; j < estanteMax; j++) {
                maxActual += estructura[i][j].getCantUnidadesExhibidas();
            }
            if (maxActual > maxGondola) {
                maxGondola = i;
            }
        }
        return maxGondola;
    }
    
    /// TO STRING
    
    @Override
    public String toString () {
        String aux = "";
        aux = ("Supermercado: " + getNombre() + " " + getDireccion() + "\n");
        for (int i=0; i < gondolaMax; i++) {
            aux += ("Gondola " + (i+1) + ": \n");
            int j=0;
            for (j=0; j < estanteMax; j++) {
                aux += ("Estante " + (j+1) + ": " + "Producto{" + estructura[i][j].getCodigo() + " - " + estructura[i][j].getNombre() + " - " + estructura[i][j].getCantUnidadesExhibidas() + " - " + estructura[i][j].getPrecioPorUnidad() + "} \n");
            }
        }
        return aux;
    }
    
}
