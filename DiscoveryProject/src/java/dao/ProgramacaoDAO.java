package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Programacao;

public class ProgramacaoDAO 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private Programacao programacao;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public ProgramacaoDAO(Programacao programacao) {
        this.programacao = programacao;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public static ArrayList<Object[]> pesquisarVoo(int cOrigem, int cDestino, int cabine, String data)
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Object[]> lst   = new ArrayList<>();
        
        try {            
            String valor = cabine == 1 ? "v.ValorEconomica as 'Valor'" : "v.ValorPrimeiraClasse as 'Valor'";
            
            stmt = conn.prepareStatement( "SELECT " +
                "   distinct p.Codigo as 'CodProgramacao', " +
                "   cOrigem.Cidade as 'Origem', " +
                "   cDestino.Cidade as 'Destino', " +
                "   date_format(p.DataSaida, '%d/%m/%Y %H:%i') as 'Data', " +
                valor +
                "FROM " +
                "   programacao p " +
                "   INNER JOIN voo v ON p.NumeroVoo = v.Numero " +
                "   INNER JOIN cidade cOrigem ON v.CidadeOrigem = cOrigem.IdCidade " +
                "   INNER JOIN cidade cDestino ON v.CidadeDestino = cDestino.IdCidade " +
                "   INNER JOIN aeronave av ON v.Aeronave = av.Prefixo " +
                "   INNER JOIN assento ast ON av.Prefixo = ast.Aeronave " +
                "WHERE " +
                "   ast.Cabine = ? " +
                "   AND cOrigem.idCidade = ? AND cDestino.idCidade = ? " +
                "   AND date(p.DataSaida) = ? " +
                "ORDER BY p.DataSaida "  
            );
            stmt.setInt(1, cabine);
            stmt.setInt(2, cOrigem);
            stmt.setInt(3, cDestino);
            stmt.setString(4, data );
            
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
    
    
    
    
    public ArrayList<Object[]> assentosDisponiveis(int cabine)
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Object[]> lst   = new ArrayList<>();
        
        try {
            String sql = "SELECT " +
                "   assento.IdAssento as '_IdAssento', " +
                "   concat('A', assento.Aeronave, if (assento.Cabine = 1, 'E', 'P'), assento.IdAssento) as 'Assento' " +
                "FROM assento " +
                "   INNER JOIN aeronave ON assento.Aeronave = aeronave.Prefixo " +
                "   INNER JOIN voo ON aeronave.Prefixo = voo.Aeronave " +
                "   INNER JOIN programacao ON voo.Numero = programacao.NumeroVoo " +
                "WHERE " +
                "   programacao.Codigo = ? " +
                "   AND assento.Cabine = ? " +
                "   AND assento.IdAssento NOT IN( SELECT if (Assento IS NULL, 0, Assento) FROM passagem WHERE Programacao = ?) ";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, this.programacao.getCodigo() );
            stmt.setInt(2, cabine );
            stmt.setInt(3, this.programacao.getCodigo() );
            
            rs = stmt.executeQuery();
            while ( rs.next() )
            {
                Object[] row = {
                    rs.getString("_IdAssento"),
                    rs.getString("Assento")
                };
                
                lst.add(row);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(ProgramacaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return( lst );
    }
}
