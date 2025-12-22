package parcial16.pkg10.pkg24;

public abstract class Sitio {
    private String nombreSitio;
    private String direccionWeb;
    private int cantUsuariosRegistrados;

    public Sitio(String miNombreSitio, String miDireccionWeb) {
        this.nombreSitio = miNombreSitio;
        this.direccionWeb = miDireccionWeb;
        this.cantUsuariosRegistrados = 0;
    }

    public String getNombreSitio() {
        return nombreSitio;
    }

    public void setNombreSitio(String nombreSitio) {
        this.nombreSitio = nombreSitio;
    }

    public String getDireccionWeb() {
        return direccionWeb;
    }

    public void setDireccionWeb(String direccionWeb) {
        this.direccionWeb = direccionWeb;
    }

    public int getCantUsuariosRegistrados() {
        return cantUsuariosRegistrados;
    }

    public void setCantUsuariosRegistrados(int cantUsuariosRegistrados) {
        this.cantUsuariosRegistrados = cantUsuariosRegistrados;
    }
    
    public String toString () {
        return ("Nombre: " + this.getNombreSitio() + " Direccion: " + this.getDireccionWeb() + " Cantidad de Usuarios Registrados: " + this.getCantUsuariosRegistrados() + " Cotizacion comercial del sitio" + this.cotizarSitio());
    }
    
    public abstract double cotizarSitio ();
    
    
}
