package controller;

import java.util.ArrayList;
import negocio.*;

public abstract class Index 
{
    /**
     * Carrega a lista de cidades a partir do banco de dados, encapsula os
     * resultados em um objeto e devolve para a página.
     * @return Object[].
     */
    public static Object[] carregarListaCidades()
    {       
        // Listar cidades cadastradas no sistema.
        ArrayList<Cidade> c = Cidade.listarCidades();
        
        // Criar campos para os respectivos atributos da tabela retornada.
        int[] id            = new int[ c.size() ];
        String[] cidade     = new String[ c.size() ];
        
        // Iterar lista, extraindo valores e guardando nos campos.
        for (int i=0; i< c.size(); i++)
        {
            id[i]       = c.get(i).getIdCidade();
            cidade[i]   = c.get(i).getCidade();
        }
        
        // Encapsular campos em estrutura de dados.
        Object[] obj = {
            id,
            cidade
        };
        
        // Retornar.
        return( obj );
    }
}
