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
public class Reclamacao {
    private int codigoPassagem;
    private int descricao, situacao;
    private int dia, mes, ano;

    public Reclamacao(int codigoPassagem, int descricao, int situacao, int dia, int mes, int ano) {
        this.codigoPassagem = codigoPassagem;
        this.descricao = descricao;
        this.situacao = situacao;
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }

    public int getCodigoPassagem() {
        return codigoPassagem;
    }

    public void setCodigoPassagem(int codigoPassagem) {
        this.codigoPassagem = codigoPassagem;
    }

    public int getDescricao() {
        return descricao;
    }

    public void setDescricao(int descricao) {
        this.descricao = descricao;
    }

    public int getSituacao() {
        return situacao;
    }

    public void setSituacao(int situacao) {
        this.situacao = situacao;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    @Override
    public String toString() {
        return "Reclamacao{" + "codigoPassagem=" + codigoPassagem + ", descricao=" + descricao + ", situacao=" + situacao + ", dia=" + dia + ", mes=" + mes + ", ano=" + ano + '}';
    }
    
    
    
    
}
