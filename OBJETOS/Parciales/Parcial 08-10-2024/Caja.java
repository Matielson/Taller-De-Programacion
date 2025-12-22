package parcial08102024;

public class Caja {
    private boolean disponibilidad;
    private Ticket vTickets[];
    private int ticketActual = 0;
    private int maxTickets;

    public Caja(int maxTickets) {
        this.disponibilidad = true;
        this.vTickets = new Ticket[maxTickets];
        this.maxTickets = maxTickets;
    }
    
    public void setDisponibilidad(boolean disponibilidad) {
        this.disponibilidad = disponibilidad;
    }
    
    public void agregarTicket (Ticket miTicket) {
        if (ticketActual < maxTickets) {
            this.vTickets[ticketActual] = miTicket;
            ticketActual++;
        }
    }
    
    public int getCantLibrosVendidos() {
        int aux = 0;
        for (int i=0; i < ticketActual; i++) {
            aux += vTickets[i].getCantLibrosComprados();
        }
        return aux;
    }

    public Ticket devolverMayorTicket () {
        double maxTicketActual = -1;
        Ticket maxTicket = null;
        for (int i=0; i < ticketActual; i++) {
            if (vTickets[i].getMontoAbonado() > maxTicketActual) {
                maxTicketActual = vTickets[i].getMontoAbonado();
                maxTicket = vTickets[i];
            }
        }
        return maxTicket;
    }
    
    @Override
    public String toString () {
        String aux = "Esta Disponible? " + this.disponibilidad + " { ";
        for (int i=0; i < ticketActual; i++) {
            aux += ( (i+1) + "-" + "[" + vTickets[i].toString() + "]");
        }
        aux += "} \n";
        return aux;
    }
}
