package parcial10102023;

public class SistemaEmpresa {

    public static void main(String[] args) {
        Director director = new Director ("Gonzalo Villareal", 24672114, 2020, 2000, 50);
        
        Empresa empresa = new Empresa("Arcor", "Chacarita, Buenos Aires", director, 4);
        
        Encargado enc1 = new Encargado("Laura Di Giusti", 67234145, 2016, 1000, 3);
        Encargado enc2 = new Encargado("Eduardo Ibanez", 83455162, 2021, 600, 1);
        Encargado enc3 = new Encargado("Hernan Lopez Munioz", 67234145, 2004, 7000, 0);
        
        empresa.agregarEncargado(enc1, 1);
        empresa.agregarEncargado(enc2, 3);
        empresa.agregarEncargado(enc3, 4);
        
        System.out.println(empresa.toString());
    }
    
}
