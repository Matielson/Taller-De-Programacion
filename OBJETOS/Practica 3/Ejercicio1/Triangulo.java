package tema3;

public class Triangulo {
    double base;
    double lado1;
    double lado2;
    double altura;
    String colorRelleno;
    String colorLinea;

    public Triangulo(double base, double lado1, double lado2, String colorRelleno, String colorLinea) {
        this.base = base;
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public double getAltura() {
        return altura;
    }
    
     public void setAltura(double altura) {
        this.altura = altura;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

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

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(double base, double lado1, double lado2) {
        return (base + lado1 + lado2);
    }
    
    public double calcularArea(double base, double altura) {
        return (base * altura / 2);
    }
}
