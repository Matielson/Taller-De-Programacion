package ejercicio2practica5n;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto[][] mAutos;

    private int maxNumPiso;
    private int maxNumPlaza;
    
    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.mAutos = new Auto[5][10];
        maxNumPiso = 5;
        maxNumPlaza = 10;
        this.inicializarMatriz(maxNumPiso, maxNumPlaza);
    }
    
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numPisos, int numPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        maxNumPiso = numPisos;
        maxNumPlaza = numPlazas;
        this.mAutos = new Auto[numPisos][numPlazas];
        this.inicializarMatriz(maxNumPiso, maxNumPlaza);
    }

    private void inicializarMatriz (int maxNumPiso, int maxNumPlaza) {
        for (int i=0; i < maxNumPiso; i++) {
            for (int j=0; i < maxNumPlaza; i++) {
                this.mAutos[i][j] = null;
            }   
        }
    }
    
    public void agregarAuto (Auto unAuto, int numPiso, int numPlaza) {
        this.mAutos[numPiso][numPlaza] = unAuto;
    }
    
    public String devolverPosAuto (String unaPatente) {
        for (int i=0; i < maxNumPiso; i++) {
            for (int j=0; j < maxNumPlaza; j++) {
                if ((this.mAutos[i][j] != null) && (this.mAutos[i][j].getPatente().equals(unaPatente))) {
                    return "El auto con la patente ingresada esta en Piso: " + (i+1) + " y Plaza: " + (j+1);
                }
            }
        }
        return "Auto Inexistente";
    }
    
    public int devolverCantEnPlaza (int plaza) {
        int aux = 0;
        for (int i=0; i < maxNumPiso; i++) {
            if (this.mAutos[i][plaza-1] != null) {
                aux++;
            }
        }
        return aux;
    }
    
    @Override
    public String toString () {
        String aux = "";
        for (int i=0; i < maxNumPiso; i++) {
            for (int j=0; j < maxNumPlaza; j++) {
                if (this.mAutos[i][j] != null) {
                    aux += "Piso " + (i+1) + " Plaza: " + (j+1) +  this.mAutos[i][j].toString() + " \n";
                }
                else
                    aux += "Piso " + (i+1) + " Plaza: " + (j+1) + " libre \n";
            }
        }
        return aux;
    }
}
