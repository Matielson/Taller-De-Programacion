package ejercicio3practica5n;

public abstract class Recital {
    private String nombre;
    private String [] vTemas;
    private int dimL;
    private int cantTemas;

    public Recital(String miNombre,int cantTemas){
        this.nombre = miNombre;
        this.vTemas = new String[cantTemas];
        this.dimL = 0;
        this.cantTemas = cantTemas;
    }

    public String[] getvTemas() {
        return vTemas;
    }
    
    public void agregarTema (String tema) {
        this.vTemas[dimL] = tema;
    }
    
    public void actuar () {
        for (int i=0; i < dimL; i++) {
            System.out.println("y ahora tocaremos... " + this.vTemas[i]);
        }
    }
    
    public abstract double calcularCosto ();
}
