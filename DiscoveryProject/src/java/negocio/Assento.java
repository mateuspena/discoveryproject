/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author Bianca
 */
public class Assento {
    private int idAssento, idAeronave,tipo;
    private String localizacao;

    public Assento(int idAssento, int idAeronave, int tipo, String localizacao) {
        this.idAssento = idAssento;
        this.idAeronave = idAeronave;
        this.tipo = tipo;
        this.localizacao = localizacao;
    }

    public int getIdAssento() {
        return idAssento;
    }

    public void setIdAssento(int idAssento) {
        this.idAssento = idAssento;
    }

    public int getIdAeronave() {
        return idAeronave;
    }

    public void setIdAeronave(int idAeronave) {
        this.idAeronave = idAeronave;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    @Override
    public String toString() {
        return "Assento{" + "idAssento=" + idAssento + ", idAeronave=" + idAeronave + ", tipo=" + tipo + ", localizacao=" + localizacao + '}';
    }
    
    
    
    
}
