package negocio;

import dao.PassagemDAO;
import java.util.ArrayList;
import java.util.HashMap;

public class Passagem 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private int             codigo;
    private boolean         cancelada;
    private String          dataCheckIn;
    private int             cabine;
    private Assento         assento;
    private Programacao     programacao;
    private Cliente         cliente;
    private Pagamento       pagamento;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
    public Passagem(int codigo, boolean cancelada, String dataCheckIn, int cabine, Assento assento, Programacao programacao, Cliente cliente, Pagamento pagamento)
    {
        this.codigo         = codigo;
        this.cancelada      = cancelada;
        this.dataCheckIn    = dataCheckIn;
        this.cabine         = cabine;
        this.assento        = assento;
        this.programacao    = programacao;
        this.cliente        = cliente;
        this.pagamento      = pagamento;
    }
    
    public Passagem(int CodProgramacao, int cabine, Pagamento pag, Cliente clt) 
    {
        this.programacao    = new Programacao(CodProgramacao);
        this.pagamento      = pag;
        this.cliente        = clt;
        this.cabine         = cabine;
    }
    
    
    public Passagem(Cliente c)
    {
        this.cliente = c;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public boolean confirmarCompra()
    {
        PassagemDAO dao = new PassagemDAO(this);
        return( dao.comprarPassagem() );
    }
    
    public ArrayList<Object[]> listarMinhasPassagens()
    {
        PassagemDAO dao = new PassagemDAO(this);
        return( dao.listarMinhasPassagens() );
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

    public boolean isCancelada() {
        return cancelada;
    }

    public void setCancelada(boolean cancelada) {
        this.cancelada = cancelada;
    }

    public String getDataCheckIn() {
        return dataCheckIn;
    }

    public void setDataCheckIn(String dataCheckIn) {
        this.dataCheckIn = dataCheckIn;
    }

    public int getCabine() {
        return cabine;
    }

    public void setCabine(int cabine) {
        this.cabine = cabine;
    }

    public Assento getAssento() {
        return assento;
    }

    public void setAssento(Assento assento) {
        this.assento = assento;
    }

    public Programacao getProgramacao() {
        return programacao;
    }

    public void setProgramacao(Programacao programacao) {
        this.programacao = programacao;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Pagamento getPagamento() {
        return pagamento;
    }

    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
    }
    
}
