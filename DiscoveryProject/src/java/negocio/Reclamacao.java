package negocio;

import dao.ReclamacaoDAO;
import java.util.ArrayList;

public class Reclamacao 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private Passagem    passagem;
    private String      situacao;
    private String      dataAbertura;
    private String      descricao;
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Reclamacao(Passagem passagem, String situacao, String dataAbertura, String descricao) 
    {
        this.passagem       = passagem;
        this.situacao       = situacao;
        this.dataAbertura   = dataAbertura;
        this.descricao      = descricao;
    }
    
    public Reclamacao(int passagem, String descricao)
    {
        this.passagem       = new Passagem(passagem);
        this.descricao      = descricao;
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public boolean abreReclamacao()
    {
        ReclamacaoDAO dao = new ReclamacaoDAO(this);
        return( dao.abreReclamacao() );
    }
    
    public static ArrayList<Reclamacao> listar(String cpf)
    {
        return( ReclamacaoDAO.listar(cpf) );
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GETTERS & SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Passagem getPassagem() {
        return passagem;
    }

    public void setPassagem(Passagem passagem) {
        this.passagem = passagem;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getDataAbertura() {
        return dataAbertura;
    }

    public void setDataAbertura(String dataAbertura) {
        this.dataAbertura = dataAbertura;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
}
