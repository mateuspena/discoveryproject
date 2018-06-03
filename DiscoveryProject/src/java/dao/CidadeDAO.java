package dao;

import java.util.ArrayList;
import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import negocio.Cidade;

public abstract class CidadeDAO 
{
    public static ArrayList<Cidade> listar()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Cidade>   c       = new ArrayList<>();
        
        try {
            // Preparar query para listar cidades no banco.
            stmt = conn.prepareStatement("SELECT * FROM cidade");
            
            // Executar query no banco e capturar retorno.
            rs = stmt.executeQuery();
            
            // Se bem-sucedida, a consulta irá retornar uma tabela
            // contendo uma lista de cidades. O método next() de result set
            // percorre esta tabela, linha por linha, até atingir o final,
            // quando retorna false.
            while ( rs.next() )
            {
                // Capturar atributos da linha.
                int     idCidade    = rs.getInt("idCidade");
                String  cidade      = rs.getString("Cidade");
                
                // Instanciar objeto cidade.
                Cidade city = new Cidade(idCidade, cidade);
                
                // Incluir objeto cidade na lista.
                c.add(city);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(CidadeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return( c );
    }
    
    public static Cidade consultar(int id)
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        Cidade              city    = null;
        
        try {
            // Preparar query para listar cidades no banco.
            stmt = conn.prepareStatement("SELECT * FROM cidade WHERE idCidade = ?");
            stmt.setInt(1, id);
            
            // Executar query no banco e capturar retorno.
            rs = stmt.executeQuery();
            
            // Se bem-sucedida, a consulta irá retornar uma tabela
            // contendo uma lista de cidades. O método next() de result set
            // percorre esta tabela, linha por linha, até atingir o final,
            // quando retorna false.
            if ( rs.next() )
            {
                // Capturar atributos da linha.
                int     idCidade    = rs.getInt("idCidade");
                String  cidade      = rs.getString("Cidade");
                
                // Instanciar objeto cidade.
                city = new Cidade(idCidade, cidade);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(CidadeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return( city );
    }
    
}
