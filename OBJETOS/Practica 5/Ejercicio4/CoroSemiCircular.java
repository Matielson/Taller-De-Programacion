package ejercicio4practica5;

public class CoroSemiCircular extends Coro{
    private Corista[] vCoristas;
    private int dimL = 0;
    private int dimF;
    
    public CoroSemiCircular(String unNombre, Director unDirector, int ancho) {
        super(unNombre, unDirector);
        this.vCoristas = new Corista[ancho];
        this.dimF = ancho;
    }
    
    public void agregarCorista(Corista unCorista) {
        if (dimL < dimF) {
            this.vCoristas[dimL] = unCorista;
            dimL++;
        }
    }
    
    @Override
    public boolean isLleno() {
        return dimL == dimF;
        // if (dimL == dimF) {
        //    return true;
        //}
        //else
        //  return false;
    }
    
    public boolean bienFormado () {
        for (int i=0; i < (dimL - 1); i++) {
            int tonoActual = vCoristas[i].getTono();
            int tonoSiguiente = vCoristas[i+1].getTono();
            if (tonoActual <= tonoSiguiente) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public String toString () {
        String aux = "";
        aux += super.toString();
        for (int i=0; i < dimL; i++) {
            aux += this.vCoristas[i].toString() + "\n";
        }
        return aux;
    }
}
