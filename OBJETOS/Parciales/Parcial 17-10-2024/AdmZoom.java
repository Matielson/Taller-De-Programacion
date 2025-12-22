package admzoom;


public class AdmZoom {

    public static void main(String[] args) {
        Sala miSala = new Sala(25, "www.asd.com");
        
        SalaPorContraseña miSalaConContrasena = new SalaPorContraseña("Puto", 30, "www.asd2.com");
        
        Participante miParticipante1 = new Participante("Matias", "masdh33@gmail.com");
        Participante miParticipante2 = new Participante("Pepe", "mfdrg33@gmail.com");
        Participante miParticipante3 = new Participante("Hola", "maasd33@gmail.com", "Puto");
        Participante miParticipante4 = new Participante("Rodgirgo", "maiop@gmail.com", "PUTO123");
        
        miSala.agregarParticipante(miParticipante1);
        miSala.agregarParticipante(miParticipante2);
        miSalaConContrasena.agregarParticipante(miParticipante3);
        miSalaConContrasena.agregarParticipante(miParticipante4);
        
        System.out.println(miSala.toString());
        System.out.println(miSalaConContrasena.toString());
        
        miSala.reiniciarSala();
        miSalaConContrasena.reiniciarSala();
        
    }
}   
