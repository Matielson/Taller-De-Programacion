package parcial16.pkg10.pkg24;

public class SitioAmateur extends Sitio {
    private int cantTorneosJugados;
    private int cantClick;

    public SitioAmateur(String miNombreSitio, String miDireccionWeb) {
        super(miNombreSitio, miDireccionWeb);
        this.cantTorneosJugados = 0;
        this.cantClick = 0;
    }

    public int getCantTorneosJugados() {
        return cantTorneosJugados;
    }

    public void setCantTorneosJugados(int cantTorneosJugados) {
        this.cantTorneosJugados = cantTorneosJugados;
    }

    public int getCantClick() {
        return cantClick;
    }

    public void setCantClick(int cantClick) {
        this.cantClick = cantClick;
    }
    
    public double cotizarSitio () {
        double cotizacionWeb = 0;
        cotizacionWeb += 10 * this.cantClick;
        cotizacionWeb += 50 * super.getCantUsuariosRegistrados();
        return cotizacionWeb;
    }
    
    public void registrarTorneoAmateur (int cantClicks) {
        this.cantClick += cantClicks;
        cantTorneosJugados++;
    }
    
}
