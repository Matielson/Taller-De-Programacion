package admzoom;

public class Sala {
    private int ID;
    private String URL;
    private Participante vParticipantes[];
    private int cantParticipantesRechazados;
    private int cantActual = 0;

    public Sala(int ID, String URL) {
        this.ID = ID;
        this.URL = URL;
        this.cantParticipantesRechazados = 0;
        this.vParticipantes = new Participante[300];
    }

    public int getID() {
        return ID;
    }

    public String getURL() {
        return URL;
    }

    public int getCantParticipantesRechazados() {
        return cantParticipantesRechazados;
    }
    
    public int getCantActual() {
        return cantActual;
    }

    public void sumarCantParticipantesRechazados() {
        this.cantParticipantesRechazados++;
    }

    public void sumarCantActual() {
        this.cantActual++;
    }

    public Participante[] getvParticipantes() {
        return vParticipantes;
    }
    
    public void agregarParticipante (Participante miParticipante) {
        if (this.cantActual < 300) {
            vParticipantes[cantActual] = miParticipante;
            cantActual++;
        }
        else
            cantParticipantesRechazados++;
    }
    
    public void reiniciarSala () {
        for (int i=0; i < cantActual; i++) {
            this.vParticipantes[i] = null;
            this.cantParticipantesRechazados = 0;
        }
    }
    
    public int totalSolicitudes () {
        return (this.cantActual + this.cantParticipantesRechazados);
    }
    
    public double calcularTasaDeAdmision () {
        return (100 * (cantActual / totalSolicitudes()));
    }
    
    @Override
    public String toString () {
        String aux = ("ID" + this.ID + " URL: " + this.URL + "\n");
        for (int i=0; i < cantActual; i++) {
            aux += ((i+1) + "- " + "Nombre: " + vParticipantes[i].getNombre() + " Email: " + vParticipantes[i].getEmail() + "\n"); 
        }
        aux+= (this.calcularTasaDeAdmision());
        return aux;
    }
    
}
