package parcial06122024;

import PaqueteLectura.GeneradorAleatorio;

public class Butaca {
    private double precio;
    private boolean ocupada;

    public Butaca() {
        this.precio = GeneradorAleatorio.generarDouble(999999);
        this.ocupada = false;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada() {
        this.ocupada = true;
    }
    
    public void setDesocupada() {
        this.ocupada = false;
    }

    public double getPrecio() {
        return precio;
    }
    
    
    
    
}
