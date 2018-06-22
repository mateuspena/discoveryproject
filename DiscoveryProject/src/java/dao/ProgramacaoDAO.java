package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class ProgramacaoDAO 
{
    public static ArrayList<Object[]> pesquisarVoo(int cOrigem, int cDestino, int cabine, Object[] data)
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Object[]> lst   = new ArrayList<>();
        
        try {            
            String valor = cabine == 1 ? "v.ValorEconomica as 'Valor'" : "v.ValorPrimeiraClasse as 'Valor'";
            
            stmt = conn.prepareStatement( "SELECT " +
                "   p.Codigo as 'CodProgramacao', " +
                "   cOrigem.Cidade as 'Origem', " +
                "   cDestino.Cidade as 'Destino', " +
                "   date_format(p.DataSaida, '%d/%m/%Y %H:%i:%s') as 'Data', " +
                valor +
                "FROM " +
                "   programacao p " +
                "   INNER JOIN voo v ON p.NumeroVoo = v.Numero " +
                "   INNER JOIN cidade cOrigem ON v.CidadeOrigem = cOrigem.idCidade " +
                "   INNER JOIN cidade cDestino ON v.CidadeDestino = cDestino.idCidade " +
                "   INNER JOIN aeronave an ON v.Aeronave = an.Prefixo " +
                "   INNER JOIN assento ast ON an.Prefixo = ast.Aeronave " +
                "WHERE " +
                "   ast.Cabine = ? " +
                "   AND cOrigem.idCidade = ? " +
                "   AND cDestino.idCidade = ? " +
                "   AND p.DataSaida BETWEEN ? and ? " +
                "ORDER BY p.DataSaida "  
            );
            stmt.setInt(1, cabine);
            stmt.setInt(2, cOrigem);
            stmt.setInt(3, cDestino);
            stmt.setString(4, (String)data[0] );
            stmt.setString(5, (String)data[1] );
            
            rs = stmt.executeQuery();
                    
            while ( rs.next() )
            {
                Object[] linha = {
                    rs.getInt("CodProgramacao"),
                    rs.getString("Origem"),
                    rs.getString("Destino"),
                    rs.getString("Data"),
                    rs.getFloat("Valor")
                };
                
                lst.add(linha);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro na conexão", e);
        } finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return( lst );
    }
}
