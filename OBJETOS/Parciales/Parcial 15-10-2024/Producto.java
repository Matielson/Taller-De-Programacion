package parcial15102024;

public class Producto {
    
     /// ATRIBUTOS DE LA CLASE PRODUCTO
    private int codigo;
    private String nombre;
    private String marca;
    private int cantUnidadesExhibidas;
    private double precioPorUnidad;

    /// CONSTRUCTOR DE LA CLASE SUPERMERCADO
    public Producto(int codigo, String nombre, String marca, int cantUnidadesExhibidas, double precioPorUnidad) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.marca = marca;
        this.cantUnidadesExhibidas = cantUnidadesExhibidas;
        this.precioPorUnidad = precioPorUnidad;
    }

    /// GETTERS Y SETTERS
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getCantUnidadesExhibidas() {
        return cantUnidadesExhibidas;
    }

    public void setCantUnidadesExhibidas(int cantUnidadesExhibidas) {
        this.cantUnidadesExhibidas = cantUnidadesExhibidas;
    }

    public double getPrecioPorUnidad() {
        return precioPorUnidad;
    }

    public void setPrecioPorUnidad(double precioPorUnidad) {
        this.precioPorUnidad = precioPorUnidad;
    }
    
    
}
