package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Passagem;
import negocio.Reclamacao;

public class ReclamacaoDAO 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private Reclamacao reclamacao;
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public ReclamacaoDAO(Reclamacao reclamacao) 
    {
        this.reclamacao = reclamacao;
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS OBJECTS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public boolean abreReclamacao()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        boolean             result  = false;
        
        try {
            String sql = "INSERT INTO reclamacao (Passagem, DataAbertura, Descricao) VALUES(?, now(), ?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, this.reclamacao.getPassagem().getCodigo() );
            stmt.setString(2, this.reclamacao.getDescricao() );
            
            result = ( stmt.executeUpdate()>0 );
        } 
        catch (SQLException ex) {
            Logger.getLogger(ReclamacaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt);
        }
         
        return( result );
    }
    
    
    public static ArrayList<Reclamacao> listar(String cpf)
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Reclamacao> lst   = new ArrayList<>();
        
        try {
            String sql = "SELECT " + 
                "   reclamacao.Passagem as '_Passagem'," +
                "   if (reclamacao.Situacao = 'C', 'Cadastrada', if (reclamacao.Situacao = 'F', 'Finalizada', 'Em Andamento')) as 'Situacao', " +
                "   date_format(reclamacao.DataAbertura, '%d/%m/%Y %H:%i') as 'DataAbertura', " +
                "   reclamacao.Descricao as 'Descricao' " +
                "FROM reclamacao " +
                "	INNER JOIN passagem ON reclamacao.Passagem = passagem.Codigo " +
                "WHERE " +
                "	passagem.Cliente = ? ";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cpf);
            
            rs = stmt.executeQuery();
            while ( rs.next() )
            {
                Reclamacao r =  new Reclamacao(
                    new Passagem( rs.getInt("_Passagem") ),
                    rs.getString("Situacao"),
                    rs.getString("DataAbertura"),
                    rs.getString("Descricao")
                );
                
                lst.add(r);
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(ReclamacaoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return( lst );
    }
    
}
