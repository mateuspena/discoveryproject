package negocio;

/**
 *
 * @author Bianca
 */
public class Voo {
    private int numero, cidadeOrigem, cidadeDestino, idAeronave;
    private float valorReal;
    private int valorPontos;

    public Voo(int numero, int cidadeOrigem, int cidadeDestino, int idAeronave, float valorReal, int valorPontos) {
        this.numero = numero;
        this.cidadeOrigem = cidadeOrigem;
        this.cidadeDestino = cidadeDestino;
        this.idAeronave = idAeronave;
        this.valorReal = valorReal;
        this.valorPontos = valorPontos;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getCidadeOrigem() {
        return cidadeOrigem;
    }

    public void setCidadeOrigem(int cidadeOrigem) {
        this.cidadeOrigem = cidadeOrigem;
    }

    public int getCidadeDestino() {
        return cidadeDestino;
    }

    public void setCidadeDestino(int cidadeDestino) {
        this.cidadeDestino = cidadeDestino;
    }

    public int getIdAeronave() {
        return idAeronave;
    }

    public void setIdAeronave(int idAeronave) {
        this.idAeronave = idAeronave;
    }

    public float getValorReal() {
        return valorReal;
    }

    public void setValorReal(float valorReal) {
        this.valorReal = valorReal;
    }

    public int getValorPontos() {
        return valorPontos;
    }

    public void setValorPontos(int valorPontos) {
        this.valorPontos = valorPontos;
    }
    
    
    
    
}
