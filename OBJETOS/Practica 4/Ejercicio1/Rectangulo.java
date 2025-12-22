package tema4;

public class Rectangulo extends Figura{
    
    // ATRIBUTOS DEL RECTANGULO
    private double base;
    private double altura;
    
    // CONSTRUCTOR DEL RECTANGULO
    public Rectangulo(double base, double altura, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setBase(base);
        setAltura(altura);
    } 

    // GETTERS Y SETTERS
    public double getBase() {
        return base;
    }

    public void setBase(double unaBase) {
        base = unaBase;
    }
    
    public double getAltura() {
        return altura;
    }

    public void setAltura(double unaAltura) {
        altura = unaAltura;
    }

    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    @Override
    public double calcularArea() {
        return (getBase()*getAltura()); 
    }

  
    @Override
    public double calcularPerimetro() {
        return (2*getBase()+2*getAltura());
    }
    
    // REDEFINICION DEL toString.
    @Override
    public String toString(){
       String aux = super.toString() + " Base: " + getBase() + " Altura: " + getAltura();
       return aux;
    }
}
