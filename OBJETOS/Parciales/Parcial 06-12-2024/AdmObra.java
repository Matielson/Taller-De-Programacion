package parcial06122024;

public class AdmObra {

    public static void main(String[] args) {
        ConButacas obraConButacas = new ConButacas("Star Wars", "Mario Perez", 20, 3000);
        
        SinButacas obraSinButacas = new SinButacas("La Casa de Papel", "Felipe Lozada", 25, 5000, 4800, 25000.0);
        
        for (int i=0; i < 2600; i++) {
            obraConButacas.ocuparButaca(i);
        }
        
        System.out.println(obraConButacas.toString());
        System.out.println();
        System.out.println(obraSinButacas.toString());
    }
}
