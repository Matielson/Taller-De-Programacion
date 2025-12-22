package ejercicio3practica5n;

public class EventoOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private String diaEvento;

    public EventoOcasional(String miNombre,int cantTemas,String miMotivo,String miNombreC,String miDia) {
        super(miNombre,cantTemas);
        this.motivo = miMotivo;
        this.nombreContratante = miNombreC;
        this.diaEvento = miDia;
    }
    
    @Override
    public void actuar () {
        if (this.motivo.equals("Show De Beneficiencia")) {
            System.out.println("Recuerden colaborar con... " + this.nombreContratante);
        }
        else if (this.motivo.equals("Show De TV")) {
            System.out.println("Saludos amigos televidentes");
        }
        else if (this.motivo.equals("Show Privado")) {
            System.out.println("Un feliz cumpleaños para... " + this.nombreContratante);
        }
        
        super.actuar();
    }
    
    @Override
    public double calcularCosto() {
        double costo = 0;
        if (this.motivo.equals("Show De Beneficiencia")) {
            costo = 0;
        }
        else if (this.motivo.equals("Show De TV")) {
            costo = 50000;
        }
        else if (this.motivo.equals("Show Privado")) {
            costo = 150000;
        }
        return costo;
    }
}
