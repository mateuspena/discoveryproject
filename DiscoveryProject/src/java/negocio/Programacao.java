package negocio;

import dao.ProgramacaoDAO;
import java.util.ArrayList;

/**
 *
 * @author Bianca
 */
public class Programacao {
    private int     codigo;
    private String  dataSaida;
    private String  dataChegada;
    private Voo     numeroVoo;

    /*@Override
    public String toString() {
        return "Programacao{" + "codigo=" + codigo + ", diaSaida=" + diaSaida + ", mesSaida=" + mesSaida + ", anoSaida=" + anoSaida + ", diaChegada=" + diaChegada + ", mesChegada=" + mesChegada + ", anoChegada=" + anoChegada + ", numeroVoo=" + numeroVoo + '}';
    }*/
    
    public static ArrayList<Object[]> pesquisarVoo(int cOrigem, int cDestino, int cabine, String dtVoo)
    {
        Object[] data = {
            dtVoo + " 00:00:00",
            dtVoo + " 23:59:00"
        };
        
        return( ProgramacaoDAO.pesquisarVoo(cOrigem, cDestino, cabine, data) );
    }

    
    // Construtores, getters e setters.
    public Programacao(int codigo, String dataSaida, String dataChegada, Voo numeroVoo) {
        this.codigo = codigo;
        this.dataSaida = dataSaida;
        this.dataChegada = dataChegada;
        this.numeroVoo = numeroVoo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(String dataSaida) {
        this.dataSaida = dataSaida;
    }

    public String getDataChegada() {
        return dataChegada;
    }

    public void setDataChegada(String dataChegada) {
        this.dataChegada = dataChegada;
    }

    public Voo getNumeroVoo() {
        return numeroVoo;
    }

    public void setNumeroVoo(Voo numeroVoo) {
        this.numeroVoo = numeroVoo;
    }
}
