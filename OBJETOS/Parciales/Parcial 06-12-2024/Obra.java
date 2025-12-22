package parcial06122024;

public abstract class Obra {
    private String nombreObra;
    private String nombreDirector;
    private int cantActoresEnEscena;
    private int capMaxEspectadores;

    public Obra(String nombreObra, String nombreDirector, int cantActoresEnEscena, int capMaxEspectadores) {
        this.nombreObra = nombreObra;
        this.nombreDirector = nombreDirector;
        this.cantActoresEnEscena = cantActoresEnEscena;
        this.capMaxEspectadores = capMaxEspectadores;
    }

    public int getCapMaxEspectadores() {
        return capMaxEspectadores;
    }
    
    
    
    @Override
    public String toString () {
        return ("Nombre de la obra: " + this.nombreObra + " Director: " + this.nombreDirector + " Cantidad de actores en escena: " + this.cantActoresEnEscena + " Total Recaudado: " + obtenerTotalRecaudado());
    }
    
    public abstract void vaciarObra ();
    public abstract double obtenerTotalRecaudado();
}
