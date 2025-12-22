package parcial06122024;

public class ConButacas extends Obra{
    private Butaca vButacas[];

    public ConButacas(String nombreObra, String nombreDirector, int cantActoresEnEscena, int capMaxEspectadores) {
        super(nombreObra, nombreDirector, cantActoresEnEscena, capMaxEspectadores);
        this.vButacas = new Butaca[capMaxEspectadores];
        for (int i=0; i < capMaxEspectadores; i++) {
            this.vButacas[i] = new Butaca();
        }
    }
    
    public boolean ocuparButaca (int posicion) {
        boolean aux = false;
        if (this.vButacas[posicion].isOcupada() == false) {
            this.vButacas[posicion].setOcupada();
            aux = true;
        }
        return aux;
    }
    
    @Override
    public void vaciarObra () {
        int cantMax = super.getCapMaxEspectadores();
        for (int i=0; i < cantMax; i++) {
           this.vButacas[i].setDesocupada();
        }
    }
    
    @Override
    public double obtenerTotalRecaudado() {
        double aux = 0;
        int cantMax = super.getCapMaxEspectadores();
        for (int i=0; i < cantMax; i++) {
           if (this.vButacas[i].isOcupada()) {
               aux+= this.vButacas[i].getPrecio();
           }
        }
        return aux;
    }
    
}
