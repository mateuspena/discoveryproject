/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package discovery.negocio;

/**
 *
 * @author Bianca
 */
public class Passagem {
    private int codigo, codigoProgramacao, idAssento;
    private String cpfCliente;
    private boolean cancelamento;
    private int diaCheck, mesCheck, anoCheck;

    public Passagem(int codigo, int codigoProgramacao, int idAssento, String cpfCliente, boolean cancelamento, int diaCheck, int mesCheck, int anoCheck) {
        this.codigo = codigo;
        this.codigoProgramacao = codigoProgramacao;
        this.idAssento = idAssento;
        this.cpfCliente = cpfCliente;
        this.cancelamento = cancelamento;
        this.diaCheck = diaCheck;
        this.mesCheck = mesCheck;
        this.anoCheck = anoCheck;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setCodigoProgramacao(int codigoProgramacao) {
        this.codigoProgramacao = codigoProgramacao;
    }

    public void setIdAssento(int idAssento) {
        this.idAssento = idAssento;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public void setCancelamento(boolean cancelamento) {
        this.cancelamento = cancelamento;
    }

    public void setDiaCheck(int diaCheck) {
        this.diaCheck = diaCheck;
    }

    public void setMesCheck(int mesCheck) {
        this.mesCheck = mesCheck;
    }

    public void setAnoCheck(int anoCheck) {
        this.anoCheck = anoCheck;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public int getCodigoProgramacao() {
        return codigoProgramacao;
    }

    public int getIdAssento() {
        return idAssento;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public boolean isCancelamento() {
        return cancelamento;
    }

    public int getDiaCheck() {
        return diaCheck;
    }

    public int getMesCheck() {
        return mesCheck;
    }

    public int getAnoCheck() {
        return anoCheck;
    }

    @Override
    public String toString() {
        return "Passagem{" + "codigo=" + codigo + ", codigoProgramacao=" + codigoProgramacao + ", idAssento=" + idAssento + ", cpfCliente=" + cpfCliente + ", cancelamento=" + cancelamento + ", diaCheck=" + diaCheck + ", mesCheck=" + mesCheck + ", anoCheck=" + anoCheck + '}';
    }
    
    public void CheckIn(){
        
    }
    
    public void cancelaPassagem(){
        this.cancelamento=true;
    }
    
 
    
    
}
