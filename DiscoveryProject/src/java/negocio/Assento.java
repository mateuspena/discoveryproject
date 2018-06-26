package negocio;

public class Assento 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private int         idAssento;
    private int         cabine;
    private Aeronave    aeronave;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Assento(int idAssento, int cabine, Aeronave aeronave) 
    {
        this.idAssento  = idAssento;
        this.cabine     = cabine;
        this.aeronave   = aeronave;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GETTERS & SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public int getIdAssento() {
        return idAssento;
    }

    public void setIdAssento(int idAssento) {
        this.idAssento = idAssento;
    }

    public int getCabine() {
        return cabine;
    }

    public void setCabine(int cabine) {
        this.cabine = cabine;
    }

    public Aeronave getAeronave() {
        return aeronave;
    }

    public void setAeronave(Aeronave aeronave) {
        this.aeronave = aeronave;
    }
    
    
}
