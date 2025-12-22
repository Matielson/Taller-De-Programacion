package ejercicio4practica4;

public class SistemaRegistroAnios extends SistemaRegistro{

    public SistemaRegistroAnios(Estacion estacion, int anioInicio, int cantAnios) {
        super(estacion, anioInicio, cantAnios);
    }
    
    public double calcularPromedio (int anio) {
        double suma = 0;
        for (int i=0; i<12; i++) {
            suma += this.obtenerTemperatura((i+1), (anio + super.getAnioInicio()));
        }
        return suma / 12;
    }
    
    @Override
    public String toString () {
        String aux = "";
        
        aux += super.getEstacion().getNombre() + "(" + super.getEstacion().getLatitud() + " S - " + super.getEstacion().getLongitud() + " O): \n";
        for (int i=0; i<super.getCantAnios(); i++) {
            aux += "- Año " + (i+super.getAnioInicio()) + ": " + this.calcularPromedio(i) + "ºC \n";
        }
        return aux;
    }
    
}
