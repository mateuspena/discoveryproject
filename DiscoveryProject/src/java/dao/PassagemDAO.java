package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Passagem;

public class PassagemDAO 
{
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private Passagem   passagem;
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public PassagemDAO(Passagem p) 
    {
        this.passagem = p;
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // DATA ACCESS METHODS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public boolean comprarPassagem()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        boolean             result  = false;
        
        // O trecho de código a seguir visa executar a seguinte construção em SQL.
        // Onde LAST_INSERT_ID() representa o valor do campo AutoIncremental inserido
        // na query imediatamente anterior.
        /*
        START TRANSACTION; 
            INSERT INTO Passagem (Cabine, Programacao, Cliente) VALUES (?, ?, ?); 
            INSERT INTO Pagamento VALUES (LAST_INSERT_ID(), ?, ?, ?, ?, ?);
        COMMIT;
        */
        // Link: https://pt.stackoverflow.com/questions/107739/fazer-insert-em-duas-tabelas-ao-mesmo-tempo
        // Link: https://www.mkyong.com/jdbc/jdbc-transaction-example/
        try {
            conn.setAutoCommit(false);
            
            stmt = conn.prepareStatement("INSERT INTO Passagem (Cabine, Programacao, Cliente) VALUES (?, ?, ?)");
            stmt.setInt(1, this.passagem.getCabine() );
            stmt.setInt(2, this.passagem.getProgramacao().getCodigo() );
            stmt.setString(3, this.passagem.getCliente().getCpf());
            boolean r1 = stmt.executeUpdate() > 0;
            
            stmt = conn.prepareStatement("INSERT INTO Pagamento VALUES (LAST_INSERT_ID(), ?, ?, ?, ?, ?)");
            stmt.setString(1, this.passagem.getPagamento().getNumCartao() );
            stmt.setString(2, this.passagem.getPagamento().getCodCartao() );
            stmt.setFloat(3, this.passagem.getPagamento().getValor() );
            stmt.setString(4, this.passagem.getPagamento().getDataVencimento() );
            stmt.setInt(5, this.passagem.getPagamento().getQtdParcelas() );
            boolean r2 = stmt.executeUpdate() > 0;
            
            conn.commit();
            result = r1 && r2;
        } 
        catch (SQLException ex) {
            Logger.getLogger(PassagemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt);
        }
         
        return( result );
    }
}
