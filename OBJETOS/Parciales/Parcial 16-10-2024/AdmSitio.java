package parcial16.pkg10.pkg24;

public class AdmSitio {

    public static void main(String[] args) {
        SitioProfesional profesional = new SitioProfesional ("Promiedos", "www.Promiedos.com", 10);
        SitioAmateur amateur = new SitioAmateur ("Bark", "www.Bark.com");
        
        TorneoProfesional miTorneo1 = new TorneoProfesional("LPF", "2025", 200000.0, 15000.0);}
        TorneoProfesional miTorneo2 = new TorneoProfesional("Sudamericana", "2025", 250000.0, 20000.0);
        TorneoProfesional miTorneo3 = new TorneoProfesional("Libertadores", "2025", 300000.0, 30000.0);
        
        profesional.registrarTorneoProfesional(miTorneo1);
        profesional.registrarTorneoProfesional(miTorneo2);
        profesional.registrarTorneoProfesional(miTorneo3);
        
    }
    
}
