package nuestroparcial;

public class NuestroParcial {

    public static void main(String[] args) {
        Empresa emp = new Empresa("Storage", "Calle 7 y 45", 5000, 5, 3);
        
        Cliente cli1 = new Cliente(42163211, "Mario Lopez", 221511421, "La Plata", true);
        Cliente cli2 = new Cliente(42163211, "Gonzalo Martinez", 24142421, "Los Hornos", false);
        Cliente cli3 = new Cliente(42163211, "Tomas Bilbao", 22632121, "Los Hornos", true);
        Cliente cli4 = new Cliente(42163211, "Hernan Lopez Muñoz", 581511421, "Berazategui", true);
        Cliente cli5 = new Cliente(42163211, "Pedro Balboa", 878111421, "Quilmes", false);
        Cliente cli6 = new Cliente(42163211, "Simon Caceres", 221511421, "La Plata", true);
        Cliente cli7 = new Cliente(42163211, "Pablo Rodriguez", 221511421, "San Isidro", false);
        
        emp.agregarCliente(cli1);
        emp.agregarCliente(cli2);
        emp.agregarCliente(cli3);
        emp.agregarCliente(cli4);
        emp.agregarCliente(cli5);
        emp.agregarCliente(cli6);
        emp.agregarCliente(cli7);
        
        System.out.println("Lista de clientes con localidad en Los Hornos \n" + emp.listarClientesLosHornos(1));
        
        System.out.println("El sector con mas clientes es el numero: " + emp.numSectorMasClientes());
        
        System.out.println(emp.toString());
    }
    
}
