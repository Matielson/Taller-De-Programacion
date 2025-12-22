package parcial14102024;

public class AdmSandwich {

    public static void main(String[] args) {
        Pan miPan = new Pan("Salvado", 500.0, "Premium");
        Sandwich sanguche = new Sandwich("Sanguche de milanesa", miPan, 3);
        
        Ingrediente ingr1 = new Ingrediente("Tomate", 50.0, "B");
        Ingrediente ingr2 = new Ingrediente("Lechuga", 30.0, "A");
        Ingrediente ingr3 = new Ingrediente("Huevo", 100.0, "A");
        
        sanguche.agregarIngrediente(ingr1);
        sanguche.agregarIngrediente(ingr2);
        sanguche.agregarIngrediente(ingr3);
        
        System.out.println(sanguche.toString());
    }
    
}
