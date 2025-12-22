package ejercicio1practica5;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreD;
    private Investigador vInvestigadores[];

    public Proyecto(String nombre, int codigo, String nombreD) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreD = nombreD;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        boolean verificar = false;
        int i = 0;
        while ((verificar != true) && (i < 50)) {
            if (vInvestigadores[i] == null) {
                vInvestigadores[i] = unInvestigador;   
                verificar = true;
            }
            i++;
        }
    }
    
    public double dineroTotalOtorgado() {
        int i=0;
        double total = 0;
        while ((i <50) && (vInvestigadores[i] != null)) {
            
        }
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public Investigador[] getvInvestigadores() {
        return vInvestigadores;
    }

    public void setvInvestigadores(Investigador[] vInvestigadores) {
        this.vInvestigadores = vInvestigadores;
    }
}
