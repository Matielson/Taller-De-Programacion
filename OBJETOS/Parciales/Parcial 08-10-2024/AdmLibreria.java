package parcial08102024;

public class AdmLibreria {

    public static void main(String[] args) {
        
        Libreria libreria = new Libreria("Librería Matías", 3);

        libreria.generarTicketYAgregar(0, 12345678, 2, 1500.0, "efectivo");
        libreria.generarTicketYAgregar(0, 87654321, 1, 800.0, "tarjeta");
        libreria.generarTicketYAgregar(1, 11223344, 3, 2400.0, "efectivo");
        libreria.generarTicketYAgregar(2, 99887766, 1, 900.0, "tarjeta");
        libreria.generarTicketYAgregar(3, 44556677, 4, 3200.0, "efectivo");

        System.out.println(libreria.toString());
        
        Ticket ticketMayorMonto = libreria.mayorTicketMonto();
        System.out.println("Ticket con mayor monto abonado: " + ticketMayorMonto.getMontoAbonado());
        
        
    }
    
}
