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
public class Pagamento {
    private int codigoPassagem;
    private int qntParcelas;
    private float valorParcelas;

    public Pagamento(int codigoPassagem, int qntParcelas, float valorParcelas) {
        this.codigoPassagem = codigoPassagem;
        this.qntParcelas = qntParcelas;
        this.valorParcelas = valorParcelas;
    }

    public int getQntParcelas() {
        return qntParcelas;
    }

    public void setQntParcelas(int qntParcelas) {
        this.qntParcelas = qntParcelas;
    }

    public float getValorParcelas() {
        return valorParcelas;
    }

    public void setValorParcelas(float valorParcelas) {
        this.valorParcelas = valorParcelas;
    }



    public int getCodigoPassagem() {
        return codigoPassagem;
    }

    public void setCodigoPassagem(int codigoPassagem) {
        this.codigoPassagem = codigoPassagem;
    }

    public void calculaValor(){
        
    }
    
    
    
    
    
}
