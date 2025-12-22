package ejercicio4practica5;

public class CoroPorHileras extends Coro{
    private Corista[][] mCoristas;
    private int maxCorPorColumna;
    private int maxCorPorFila;
    private int filaActual = 0;
    private int colActual = 0;
    
    
    public CoroPorHileras(String unNombre, Director unDirector, int numFilas, int numColumnas) {
        super(unNombre, unDirector);
        this.mCoristas = new Corista[numFilas][numColumnas];
        maxCorPorColumna = numColumnas;
        maxCorPorFila = numFilas;
        this.inicializarMatriz(numFilas, numColumnas);
    }
    
    private void inicializarMatriz (int numFilas, int numColumnas) {
        for (int i=0; i < numFilas; i++) {
            for (int j=0; j < numColumnas; j++) {
                this.mCoristas[i][j] = null;
            }
        }
    }
    
    public void agregarCorista (Corista unCorista) {
        if (colActual < maxCorPorColumna) {
            this.mCoristas[filaActual][colActual] = unCorista;
            colActual++;
        }
        else if ((filaActual + 1) < maxCorPorFila) {
            filaActual++;
            colActual = 0;
            this.mCoristas[filaActual][colActual] = unCorista;
            colActual++;
        }
    }  
    
    
    
    
    @Override
    public boolean isLleno() {
        return (filaActual == maxCorPorFila - 1) && (colActual == maxCorPorColumna);
    }
    
    public boolean bienFormado () {
        for (int i = 0; i < maxCorPorFila; i++) {
            int tonoFila = mCoristas[i][0].getTono();

            for (int j = 1; j < maxCorPorColumna; j++) {
                if ((mCoristas[i][j] == null) || (mCoristas[i][j].getTono() != tonoFila)) {
                    return false;
                }
            }
        }
        
        for (int i = 0; i < maxCorPorFila - 1; i++) {
            int tonoActual = mCoristas[i][0].getTono();
            int tonoSiguiente = mCoristas[i+1][0].getTono();

            if (tonoActual < tonoSiguiente) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public String toString () {
        String aux = "";
        aux += super.toString();
        for (int i=0; i < maxCorPorFila; i++) {
            for (int j=0; j < maxCorPorColumna; j++) {
                if (this.mCoristas[i][j] != null) {
                    aux += this.mCoristas[i][j].toString() + "\n";
                }
            }
        } 
        return aux;
    }

}
