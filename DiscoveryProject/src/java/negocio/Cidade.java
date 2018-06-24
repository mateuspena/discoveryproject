package negocio;

import dao.CidadeDAO;
import java.util.ArrayList;

/**
 *
 * @author Bianca
 */
public class Cidade 
{ 
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private int         idCidade;
    private String      cidade;

    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Cidade(String nome) 
    {
        this.cidade = nome;
    }
    
    public Cidade(int id, String cidade)
    {
        this.idCidade   = id;
        this.cidade     = cidade;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public static ArrayList<Cidade> listarCidades()
    {
        return( CidadeDAO.listar() );
    }
    
    public static Cidade consultaCidade(int id)
    {
        return( CidadeDAO.consultar(id) );
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GETTERS & SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getIdCidade() {
        return idCidade;
    }

    public void setIdCidade(int idCidade) {
        this.idCidade = idCidade;
    }
}
