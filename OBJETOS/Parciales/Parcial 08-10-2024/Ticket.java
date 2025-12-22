package parcial08102024;

public class Ticket {
    private int numTicket;
    private int dniCliente;
    private int cantLibrosComprados;
    private double montoAbonado;
    private String medioDePago;

    public Ticket(int numTicket, int dniCliente, int cantLibrosComprados, double montoAbonado, String medioDePago) {
        this.numTicket = numTicket;
        this.dniCliente = dniCliente;
        this.cantLibrosComprados = cantLibrosComprados;
        this.montoAbonado = montoAbonado;
        this.medioDePago = medioDePago;
    }

    public int getCantLibrosComprados() {
        return cantLibrosComprados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }
    
    @Override
    public String toString () {
        return (this.numTicket + this.dniCliente + this.cantLibrosComprados + this.montoAbonado + this.medioDePago);
    }
    
    
}
