package parcial08102024;

public class Libreria {
    private String nombre;
    private int numVentaActual;
    private Caja vCajas[];

    public Libreria(String nombre, int maxTickets) {
        this.nombre = nombre;
        this.numVentaActual = 0;
        this.vCajas = new Caja[4];
        for (int i=0; i < 4; i++) {
            this.vCajas[i] = new Caja(maxTickets);
        }
    }
    
    public void generarTicketYAgregar (int numCaja, int dniCliente, int cantLibrosComprados, double montoAbonado, String formaDePago) {
        this.vCajas[numCaja].agregarTicket(new Ticket(this.numVentaActual, dniCliente, cantLibrosComprados, montoAbonado, formaDePago));
    }
    
    public void marcarCajasMenor (int valor) {
        for (int i=0; i < 4; i++) {
            if (vCajas[i].getCantLibrosVendidos() < valor) {
                vCajas[i].setDisponibilidad(false);
            }
        }
    }
    
    public Ticket mayorTicketMonto () {
        double aux = -1;
        Ticket maxTicketAbonado = null;
        for (int i=0; i < 4; i++) {
            if (this.vCajas[i].devolverMayorTicket().getMontoAbonado() > aux) {
                maxTicketAbonado = this.vCajas[i].devolverMayorTicket();
            }
        }
        return maxTicketAbonado;
    }
    
    @Override
    public String toString () {
        String aux = "Libreria: " + this.nombre + "\n";
        for (int i=0; i <4; i++) {
            aux += "Caja" + (i+1) + ": "+ vCajas[i].toString();
        }
        return aux;
    }
    
    
}
