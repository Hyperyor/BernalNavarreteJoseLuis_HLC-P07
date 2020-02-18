package entidades;
// Generated 16-feb-2020 0:32:35 by Hibernate Tools 4.3.1

/**
 * Escribe generated by hbm2java
 */
public class Escribe implements java.io.Serializable {

    private EscribeId id;
    private Float beneficioAutor;

    public Escribe() {
    }

    public Escribe(EscribeId id) {
        this.id = id;
    }

    public Escribe(EscribeId id, Float beneficioAutor) {
        this.id = id;
        this.beneficioAutor = beneficioAutor;
    }

    public EscribeId getId() {
        return this.id;
    }

    public void setId(EscribeId id) {
        this.id = id;
    }

    public Float getBeneficioAutor() {
        return this.beneficioAutor;
    }

    public void setBeneficioAutor(Float beneficioAutor) {
        this.beneficioAutor = beneficioAutor;
    }

}