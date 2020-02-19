package entidades;
// Generated 19-feb-2020 19:21:03 by Hibernate Tools 4.3.1



/**
 * EscribeId generated by hbm2java
 */
public class EscribeId  implements java.io.Serializable {


     private String isbn;
     private int codigoAutor;
     private int numero;

    public EscribeId() {
    }

    public EscribeId(String isbn, int codigoAutor, int numero) {
       this.isbn = isbn;
       this.codigoAutor = codigoAutor;
       this.numero = numero;
    }
   
    public String getIsbn() {
        return this.isbn;
    }
    
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public int getCodigoAutor() {
        return this.codigoAutor;
    }
    
    public void setCodigoAutor(int codigoAutor) {
        this.codigoAutor = codigoAutor;
    }
    public int getNumero() {
        return this.numero;
    }
    
    public void setNumero(int numero) {
        this.numero = numero;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof EscribeId) ) return false;
		 EscribeId castOther = ( EscribeId ) other; 
         
		 return ( (this.getIsbn()==castOther.getIsbn()) || ( this.getIsbn()!=null && castOther.getIsbn()!=null && this.getIsbn().equals(castOther.getIsbn()) ) )
 && (this.getCodigoAutor()==castOther.getCodigoAutor())
 && (this.getNumero()==castOther.getNumero());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getIsbn() == null ? 0 : this.getIsbn().hashCode() );
         result = 37 * result + this.getCodigoAutor();
         result = 37 * result + this.getNumero();
         return result;
   }   


}


