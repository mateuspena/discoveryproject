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
public class Aeronave {
    private int capacidade, prefixo;

    public Aeronave(int capacidade, int prefixo) {
        this.capacidade = capacidade;
        this.prefixo = prefixo;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public int getPrefixo() {
        return prefixo;
    }

    public void setPrefixo(int prefixo) {
        this.prefixo = prefixo;
    }

    
    
}
