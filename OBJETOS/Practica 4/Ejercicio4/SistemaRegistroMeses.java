package ejercicio4practica4;

public class SistemaRegistroMeses extends SistemaRegistro{

    public SistemaRegistroMeses(Estacion estacion, int anioInicio, int cantAnios) {
        super(estacion, anioInicio, cantAnios);
    }
    
    public double calcularPromedio (int mes) {
        double suma = 0;
        for (int i=0; i<super.getCantAnios(); i++) {
            suma += this.obtenerTemperatura(mes, (i + super.getAnioInicio()));
        }
        return suma / super.getCantAnios();
    }
    
    @Override
    public String toString () {
        String aux = "";
        String [] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo","Junio","Julio", "Agosto","Septiembre","Octubre","Noviembre", "Diciembre"};
        
        aux += super.getEstacion().getNombre() + "(" + super.getEstacion().getLatitud() + " S - " + super.getEstacion().getLongitud() + " O): \n";
        for (int i=0; i<12; i++) {
            aux += "- " + meses[i] + ": " + this.calcularPromedio(i+1) + "ºC \n";
        }
        return aux;
    }
    
}
