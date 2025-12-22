package tema3;

public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    
    public Libro(  String titulo,  String editorial, int añoEdicion,  Autor primerAutor, String ISBN, double precio){
         this.titulo = titulo;
         this.editorial = editorial; 
         this.añoEdicion= añoEdicion;
         this.primerAutor = primerAutor;
         this.ISBN =  ISBN;
         this.precio = precio;
    }
    
    public Libro(  String titulo,  String editorial, Autor primerAutor, String ISBN){
         this.titulo = titulo;
         this.editorial = editorial; 
         this.añoEdicion= 2015;
         this.primerAutor = primerAutor;
         this.ISBN =  ISBN;
         this.precio = 100;
    }
    
    public Libro(){
   
    }
        
    public String getTitulo(){
        return this.titulo;
    }
  
    public String getEditorial(){
        return this.editorial;
    }
    public int getAñoEdicion(){
        return this.añoEdicion;
    }
  
    public Autor getAutor(){
        return this.primerAutor;
    } 
    public String getISBN(){
        return this.ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
   
    public void setEditorial(String editorial){
        this.editorial = editorial;
    }
    public void setAñoEdicion(int año){
        this.añoEdicion = año;
    }
   
    public void setAutor(Autor primerAutor){
        this.primerAutor = primerAutor;
    } 
    public void setISBN(String ISBN){
        this.ISBN = ISBN;
    } 
    public void setPrecio(double precio){
        this.precio = precio;
    }
   
    
   @Override
    public String toString(){
       String aux;
       aux = titulo + " por " + primerAutor.getNombre() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
}
