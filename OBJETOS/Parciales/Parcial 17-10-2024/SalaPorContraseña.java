package admzoom;

public class SalaPorContraseña extends Sala {
    private String contrasena;
    private int cantParticipantesDegenados;

    public SalaPorContraseña(String contrasena, int ID, String URL) {
        super(ID, URL);
        this.contrasena = contrasena;
        this.cantParticipantesDegenados = 0;
    }
    
    @Override
    public void agregarParticipante (Participante miParticipante) {
        if (this.contrasena.contentEquals(miParticipante.getContrasenaIngresada())) {
            super.agregarParticipante(miParticipante);
        }
        else
            cantParticipantesDegenados++;
    }
    
    @Override
    public void reiniciarSala() {
        super.reiniciarSala();
        this.cantParticipantesDegenados = 0;
    }
    
    @Override
    public double calcularTasaDeAdmision () {
        return super.calcularTasaDeAdmision() + this.cantParticipantesDegenados;
    }
    
    @Override
    public String toString () {
        String aux = ("ID" + super.getID() + " URL: " + this.getURL() + "\n");
        for (int i=0; i < super.getCantActual(); i++) {
            aux += ((i+1) + "- " + "Nombre: " + super.getvParticipantes()[i].getNombre() + " Email: " + super.getvParticipantes()[i].getEmail() + "\n"); 
        }
        aux+= (this.calcularTasaDeAdmision());
        return aux;
    }
    
}
