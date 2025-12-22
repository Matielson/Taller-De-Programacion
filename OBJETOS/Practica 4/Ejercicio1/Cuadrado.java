package tema4;


public class Cuadrado extends Figura{
    
    // ATRIBUTOS DEL CUADRADO
    private double lado;
    
    // CONSTRUCTUR DEL CUADRADO
    public Cuadrado(double unLado, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado(unLado);
    } 
    
    
    // GETTERS Y SETTERS
    public double getLado(){
        return lado;       
    }
    
    public void setLado(double unLado){
        lado=unLado;
    }
    
    
    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    public double calcularArea(){
       return (getLado()* getLado());
    }
    
    public double calcularPerimetro(){
       return (getLado()*4);
    }
    
    // REDEFINICION DEL toString.
    @Override
    public String toString(){
       String aux = super.toString() + " Lado: " + getLado();
       return aux;
    }
}
