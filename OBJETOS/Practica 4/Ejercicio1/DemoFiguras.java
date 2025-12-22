package tema4;

public class DemoFiguras {

    public static void main(String[] args) {
        // CREAMOS Y ASIGNAMOS VALORES A LOS OBJETOS
        Triangulo t = new Triangulo("Rojo", "Negro", 5.0, 6.0, 7.0);
        Circulo c = new Circulo ("Verde", "Violeta", 5.0);
        
        System.out.println("Triangulo: ");
        System.out.println(t.toString());
        System.out.println("------------");
        
        System.out.println("Circulo: ");
        System.out.println(c.toString());
        System.out.println("------------");
        
        // DESPINTAMOS EL CIRCULO
        c.despintar();
        System.out.println(c.toString());
    }
}
