package parcial06122024;

public class SinButacas extends Obra{
    private int cantEntradasVendidas;
    private double precioEntrada;

    public SinButacas(String nombreObra, String nombreDirector, int cantActores, int capMaxEspectadores,int cantEntradasVendidas, double precioEntrada) {
        super(nombreObra,nombreDirector,cantActores,capMaxEspectadores);
        this.cantEntradasVendidas = cantEntradasVendidas;
        this.precioEntrada = precioEntrada;
    }

    public void setCantEntradasVendidas(int cantEntradasVendidas) {
        this.cantEntradasVendidas = cantEntradasVendidas;
    }

    public int getCantEntradasVendidas() {
        return cantEntradasVendidas;
    }

    public double getPrecioEntrada() {
        return precioEntrada;
    }

    @Override
    public void vaciarObra () {
        this.cantEntradasVendidas = 0;
    }
    
    @Override
    public double obtenerTotalRecaudado() {
        return (getCantEntradasVendidas() * getPrecioEntrada());
    }
    
}
