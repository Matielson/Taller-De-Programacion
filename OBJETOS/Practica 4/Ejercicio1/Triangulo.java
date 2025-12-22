package tema4;

public class Triangulo extends Figura{
    
    /// ATRIBUTOS DEL TRIANGULO.
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    // CONSTRUCTUR/ES
    public Triangulo(String CR, String CL, double lado1, double lado2, double lado3) {
        super(CR,CL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    
    // GETTERS Y SETTERS
    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    // METODOS PROPIOS (ABSTRACTOS EN LA CLASE FIGURA)
    @Override
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }
    
    @Override
    public double calcularPerimetro(){
       return (getLado1() + getLado2() + getLado3()); 
    }
    
    // REDEFINICION DEL toString.
    @Override
    public String toString() {
        String aux = super.toString() + " Lado 1: " + getLado1() + " Lado 2: " + getLado2() + " Lado 3: " + getLado3();
        return aux;
    }
}
