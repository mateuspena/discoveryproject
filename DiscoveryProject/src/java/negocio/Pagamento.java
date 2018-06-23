package negocio;

import dao.PagamentoDAO;

public class Pagamento 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private String      numCartao;
    private String      codCartao;
    private float       valor;
    private String      dataVencimento;
    private int         qtdParcelas;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Pagamento(String numCartao, String codCartao, float valor, String dataVencimento, int qtdParcelas) 
    {
        this.numCartao      = numCartao;
        this.codCartao      = codCartao;
        this.valor          = valor;
        this.dataVencimento = dataVencimento;
        this.qtdParcelas    = qtdParcelas;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // GETTERS & SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public String getNumCartao() {
        return numCartao;
    }

    public void setNumCartao(String numCartao) {
        this.numCartao = numCartao;
    }

    public String getCodCartao() {
        return codCartao;
    }

    public void setCodCartao(String codCartao) {
        this.codCartao = codCartao;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public int getQtdParcelas() {
        return qtdParcelas;
    }

    public void setQtdParcelas(int qtdParcelas) {
        this.qtdParcelas = qtdParcelas;
    }
    
}
