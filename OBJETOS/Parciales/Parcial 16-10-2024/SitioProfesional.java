package parcial16.pkg10.pkg24;

public class SitioProfesional extends Sitio{
    // CONSTRUCTOR DE SITIO PROFESIONAL
    private TorneoProfesional vTorneos[];
    private int cantTotal = 0;
    private int cantMax;

    public SitioProfesional(String miNombreSitio, String miDireccionWeb, int miCantTorneos) {
        super(miNombreSitio, miDireccionWeb);
        this.vTorneos = new TorneoProfesional[miCantTorneos];
        this.cantMax = miCantTorneos;
    }

    public TorneoProfesional[] getvTorneos() {
        return vTorneos;
    }

    public void setvTorneos(TorneoProfesional[] vTorneos) {
        this.vTorneos = vTorneos;
    }

    public int getCantTotal() {
        return cantTotal;
    }

    public void setCantTotal(int cantTotal) {
        this.cantTotal = cantTotal;
    }

    public int getCantMax() {
        return cantMax;
    }

    public void setCantMax(int cantMax) {
        this.cantMax = cantMax;
    }
    
    public boolean registrarTorneoProfesional (TorneoProfesional miTorneo) {
        boolean aux = false;
        if (cantTotal < cantMax) {
            this.vTorneos[cantTotal] = miTorneo;
            cantTotal++;
            aux = true;
        }
        return aux;
    }
    
    public double contarRecaudacion () {
        double aux = 0;
        for (int i=0; i<cantTotal; i++) {
            aux = vTorneos[i].getMontoRecaudado() - vTorneos[i].getMontoPagado();
        }
        return aux;
    }
    
    public double cotizarSitio () {
        double cotizacionWeb = 0;
        cotizacionWeb += contarRecaudacion();
        cotizacionWeb += cantTotal * 1000;
        return cotizacionWeb;
    }
    
}
