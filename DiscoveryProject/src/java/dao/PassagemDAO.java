package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
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
    
    public ArrayList<Object[]> listarMinhasPassagens()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        ArrayList<Object[]> lst   = new ArrayList<>();
        
        try {
            String sql = "SELECT " +
                "   passagem.Codigo as '_Passagem', " +
                "   date_format(programacao.DataSaida, '%d/%m/%Y %H:%i:%s') as 'DataVoo', " +
                "   if (passagem.Cancelada = 0, 'Ativa', 'Cancelada') as 'Status', " +
                "   if (passagem.Assento IS NOT NULL, concat('A', assento.Aeronave, if (passagem.Cabine = 1, 'E', 'P'), passagem.Assento), 0) as 'Assento', " +
                "   if (passagem.DataCheckIn IS NULL, 'Pendente', date_format(passagem.DataCheckIn, '%d/%m/%Y %H:%i:%s')) as 'Checkin', " +
                "   cidade1.Cidade as 'CidadeOrigem', " +
                "   cidade2.Cidade as 'CidadeDestino' " +
                "FROM passagem " +
                "   INNER JOIN cliente ON passagem.Cliente = cliente.Cpf " +
                "   INNER JOIN programacao ON passagem.Programacao = programacao.Codigo " +
                "   INNER JOIN voo ON programacao.NumeroVoo = voo.Numero " +
                "   INNER JOIN cidade cidade1 ON voo.CidadeOrigem = cidade1.IdCidade " +
                "   INNER JOIN cidade cidade2 ON voo.CidadeDestino = cidade2.IdCidade " +
                "   LEFT JOIN assento ON passagem.Assento = assento.IdAssento " +
                "WHERE " +
                "   cliente.Cpf = ? " +
                "ORDER BY passagem.DataCheckIn" ;
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, this.passagem.getCliente().getCpf() );
            
            rs = stmt.executeQuery();
            while ( rs.next() ) 
            {
                Object[] row = {
                    rs.getInt("_Passagem"),
                    rs.getString("DataVoo"),
                    rs.getString("Status"),
                    rs.getString("Assento"),
                    rs.getString("Checkin"),
                    rs.getString("CidadeOrigem"),
                    rs.getString("CidadeDestino")
                };
                
                lst.add(row);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(PassagemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }        
        
        return(lst);
    }
}
