package negocio;

import dao.CidadeDAO;
import java.util.ArrayList;

/**
 *
 * @author Bianca
 */
public class Cidade {
    private int         idCidade;
    private String      cidade;

    public Cidade(String nome) {
        this.cidade = nome;
    }//o codigo sera gerado automaticamente no banco
    
    public Cidade(int id, String cidade)
    {
        this.idCidade   = id;
        this.cidade     = cidade;
    }

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
    
    /**
     * Listar todas as todas cadastradas no sistema.
     * @return (ArrayList) Classe Cidade.
     */
    public static ArrayList<Cidade> listarCidades()
    {
        return( CidadeDAO.listar() );
    }
    
    public static Cidade consultaCidade(int id)
    {
        return( CidadeDAO.consultar(id) );
    }
    
}
