package ejercicio3practica5n;

public class Gira extends Recital{
    private String nombreGira;
    private Fecha vFechas[];
    private int fechaActual;
    private int cantFechasMax;
    private int dimL = 0;
    
    public Gira(String miNombre,int cantTemas,String miNombreG,int cantFechas) {
        super(miNombre,cantTemas);
        this.nombreGira = miNombreG;
        this.vFechas = new Fecha[cantFechas];
        this.fechaActual = 0;
        this.cantFechasMax = cantFechas;
    }
    
    public void agregarFecha (Fecha unaFecha) {
        this.vFechas[dimL] = unaFecha;
        dimL++;
    }
    
    @Override
    public void actuar () {
        System.out.println("Buenas noches... " + this.vFechas[fechaActual].getCiudad());
        super.actuar();
        fechaActual++;
    }
    
    @Override
    public double calcularCosto() {
        return 30000 * dimL;
    }
    
}
