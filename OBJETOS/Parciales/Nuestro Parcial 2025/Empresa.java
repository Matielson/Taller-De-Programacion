package nuestroparcial;

public class Empresa {
    private String nombre;
    private String direccion;
    private double costoMes;
    private Cliente[][] mClientes;
    private int cantClientes;
    private int cantMaxFilas;
    private int cantMaxColumnas;

    public Empresa(String nombre, String direccion, double costoMes, int sectores, int bauleras) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.costoMes = costoMes;
        this.mClientes = new Cliente[sectores][bauleras];
        this.cantClientes = 0;
        this.cantMaxFilas = sectores;
        this.cantMaxColumnas = bauleras;
        this.inicializarMatriz();
    }
    
    private void inicializarMatriz () {
        for (int i=0; i < cantMaxFilas; i++) {
            for (int j=0; j < cantMaxColumnas; j++) {
                this.mClientes[i][j] = null;
            }
        }
    }
    
    public void agregarCliente (Cliente miCliente) {
        if (this.cantClientes < cantMaxFilas * cantMaxColumnas) {
            int fila = this.cantClientes / cantMaxColumnas;
            int col = this.cantClientes % cantMaxColumnas;
            this.mClientes[fila][col] = miCliente;
            this.cantClientes++;
        }
    }
    
    public String listarClientesLosHornos (int sector) {
        String aux = "";
        int dimLBauleras = this.cantClientes % cantMaxColumnas;
        for (int i=0; i < dimLBauleras; i++) {
            if (mClientes[i][sector].getLocalidad().equals("Los Hornos")) {
                aux += "DNI: " +  mClientes[i][sector-1].getDni() + " Nombre: " + mClientes[i][sector-1].getNombre() + " Telefono: " + mClientes[i][sector-1].getTelefono() + " Localidad: " + mClientes[i][sector-1].getLocalidad() + " Asegurado? " + mClientes[i][sector-1].isContrataSeguro() + "\n";
            }
        }
        return aux;
    }
    
    public int numSectorMasClientes () {
        int max = -1;
        int maxSector = 0;
        int cantActual = 0;
        int dimLSectores = this.cantClientes / cantMaxColumnas;
        int dimLBauleras = this.cantClientes % cantMaxColumnas;
        
        for (int i=0; i < dimLSectores; i++) {
            cantActual = 0;
            for (int j=0; j < dimLBauleras; j++) {
                if (mClientes[i][j].isContrataSeguro()) {
                    cantActual++;
                }
            }
            if (cantActual > max) {
                maxSector = (i+1);
                max = cantActual;
            }
        }
        return maxSector;
    }
    
    @Override
    public String toString () {
        String aux = "Empresa: " + this.nombre + " - " + "Direccion: " + this.direccion + " Costo por Mes: " + this.costoMes + "\n";
        int cantSectoresLlenos = this.cantClientes / cantMaxColumnas; // ESTO DA 4
        int cantBaulerasFaltantes = this.cantClientes / cantMaxFilas; // ESTO DA 2

        // RECORRO LA MATRIZ QUE SE QUE ESTA COMPLETA
        for (int i=0;i < cantSectoresLlenos; i++) {
            aux += "Sector " + (i+1) + ": \n"; 
            for (int j=0; j < cantMaxColumnas; j++) {
                aux += "Baulera " + (j+1) + ": " + "DNI: " +  mClientes[i][j].getDni() + " Nombre: " + mClientes[i][j].getNombre() + " Telofono: " + mClientes[i][j].getTelefono() + " Localidad: " + mClientes[i][j].getLocalidad() + " Asegurado? " + mClientes[i][j].isContrataSeguro() + "\n";
            }
        } 

        // RECORRO LA PARTE QUE FALTA
        for (int i=0; i < cantBaulerasFaltantes; i++) {
            aux += "Baulera " + (j+1) + ": " + "DNI: " +  mClientes[i][j].getDni() + " Nombre: " + mClientes[i][j].getNombre() + " Telofono: " + mClientes[i][j].getTelefono() + " Localidad: " + mClientes[i][j].getLocalidad() + " Asegurado? " + mClientes[i][j].isContrataSeguro() + "\n";
        }
        
        return aux;
    }

    
    
    /* 
    VERSION VITO
    
    public String toString() {
        String aux = "Empresa: " + this.nombre + "- " + this.direccion + ";" + this.costoPorMes + "\n";
        for (int i = 0; i < this.cantSectoresMax ; i++) {
            aux += "Sector " + (i+1) + ": \n";
            for (int j = 0 ; j < this.cantBaulerasMax ; j++) {
                int cant = i * this.cantBaulerasMax + j;
                if (cant < this.cantClientes) {
                    aux += "Baulera " + (j+1) + ":" + this.mClientes[i][j].getDNI() + " nombre: " + this.mClientes[i][j].getNombre() + " telefono: " + this.mClientes[i][j].getTelefono() + " localidad: " + this.mClientes[i][j].getLocalidad() + " asegurado : " + this.mClientes[i][j].isSeguroAd() + " \n";
                }
            }
        }
        return aux;
    }
    */
    
    
    
}
