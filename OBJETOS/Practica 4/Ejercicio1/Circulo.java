package tema4;

public class Circulo extends Figura{
    
    // ATRIBUTO DEL CIRCULO
    private double radio;
    
    // CONSTRUCTURES 
    
    public Circulo (String CR, String CL, double radio) {
        super(CR,CL);
        setRadio(radio);
    }
    
    // GETTERS Y SETTERS

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    @Override
    public double calcularArea() {
        return Math.PI * radio * radio;
    }
    
    @Override
    public double calcularPerimetro(){
       return 2 * Math.PI * radio;
    }
    
    // REDEFINICION DEL toString.
    @Override
    public String toString() {
       String aux = super.toString() + " Radio: " + getRadio();
       return aux;
    }
}
