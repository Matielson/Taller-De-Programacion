package parcial12.pkg05.pkg2025;

public class AdmColonia {

    public static void main(String[] args) {
        /// INSTANCIA NADADOR
        Nadador grupoNadador = new Nadador("Lauro Di Giusto", 1000000.0, "Grupo Gays", 1000000.0, 5000000.0, 3);
        /// INSTANCIA EXPLORADOR
        Explorador grupoExplorador = new Explorador(30000.0, "Grupo Down", 20000.0, 25000.0, 2);
        
        Chico c1 = new Chico("Gonzo", 22151232, true);
        Chico c2 = new Chico("Veronico", 22123142, false);
        Chico c3 = new Chico("Alonso", 22164392, true);
        Chico c4 = new Chico("Vita B", 22153842, true);
        
        grupoNadador.agregarChico(c1);
        grupoNadador.agregarChico(c2);
        grupoNadador.agregarChico(c3);
        
        grupoExplorador.agregarChico(c2);
        grupoExplorador.agregarChico(c4);
        
        System.out.println("GRUPO NADADOR:");
        System.out.println(grupoNadador.toString());
        System.out.println("Es rentable? " + grupoNadador.esRentable());
        
        System.out.println();
        
        System.out.println("GRUPO EXPLORADOR:");
        System.out.println(grupoExplorador.toString());
        System.out.println("Es rentable? " + grupoExplorador.esRentable());
        
    }
}
