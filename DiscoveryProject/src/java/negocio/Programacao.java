package negocio;

import dao.ProgramacaoDAO;
import java.util.ArrayList;

/**
 *
 * @author Bianca
 */
public class Programacao 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private int     codigo;
    private String  dataSaida;
    private String  dataChegada;
    private Voo     numeroVoo;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Programacao(int codigo, String dataSaida, String dataChegada, Voo numeroVoo) {
        this.codigo         = codigo;
        this.dataSaida      = dataSaida;
        this.dataChegada    = dataChegada;
        this.numeroVoo      = numeroVoo;
    }
    
    public Programacao(int codigo)
    {
        this.codigo = codigo;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public static ArrayList<Object[]> pesquisarVoo(int cOrigem, int cDestino, int cabine, String dtVoo)
    {
        return( ProgramacaoDAO.pesquisarVoo(cOrigem, cDestino, cabine, dtVoo) );
    }
    
    
    public ArrayList<Object[]> assentosDisponiveis(int cabine)
    {
        ProgramacaoDAO dao = new ProgramacaoDAO(this);
        return( dao.assentosDisponiveis(cabine) );
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GETTERS & SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(String dataSaida) {
        this.dataSaida = dataSaida;
    }

    public String getDataChegada() {
        return dataChegada;
    }

    public void setDataChegada(String dataChegada) {
        this.dataChegada = dataChegada;
    }

    public Voo getNumeroVoo() {
        return numeroVoo;
    }

    public void setNumeroVoo(Voo numeroVoo) {
        this.numeroVoo = numeroVoo;
    }
}
