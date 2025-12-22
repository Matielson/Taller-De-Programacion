package ejercicio4practica4;

public class SistemaRegistro {
    private Estacion estacion;
    private int anioInicio;
    private int cantAnios;
    private double[][] temperaturas;
    
    public SistemaRegistro(Estacion estacion, int anioInicio, int cantAnios) {
        this.estacion = estacion;
        this.anioInicio = anioInicio;
        this.cantAnios = cantAnios;
        
        temperaturas = new double[cantAnios][12];
        
        int i;
        int j;
        for (i=0; i < cantAnios; i++) {
            for (j=0; j < 12; j++) {
                temperaturas[i][j] = 9999;
            }
        }
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public int getAnioInicio() {
        return anioInicio;
    }
    
    public void registrarTemperatura (double temp, int mes, int anio) {
        this.temperaturas[anio-this.anioInicio][mes-1] = temp;
    }
    
    public double obtenerTemperatura (int mes, int anio) {
        return this.temperaturas[anio-this.anioInicio][mes-1];
    }
    
    public String toString2() {
        int i;
        int j;
        double max = -1;
        int maxAnio = -1;
        int maxMes = -1;
        for (i=0; i < this.cantAnios; i++) {
            for (j=0; j < 12; j++) {
                if (this.temperaturas[i][j] > max) {
                    max = this.temperaturas[i][j];
                    maxAnio = i;
                    maxMes = j;
                }
            }
        }
        return "Se registro la mayor temperatura en el mes: " + maxMes + " del año: " + (maxAnio + this.anioInicio);
    }
    
}
