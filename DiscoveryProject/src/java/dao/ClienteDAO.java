/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import banco.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Cliente;
import negocio.Functions.MyDataHora;

/**
 *
 * @author Bianca
 */
public class ClienteDAO 
{
    private Cliente cliente;

    public ClienteDAO(Cliente cliente)
    {
        this.cliente = cliente;
    }
    
    public boolean consultarCliente()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        ResultSet           rs      = null;
        
        try {
            String sql = "SELECT "
                    + "Nome, "
                    + "Email, "
                    + "Telefone, "
                    + "date_format(DataNascimento, '%d/%m/%Y') as 'DataNascimento' "
                    + "FROM cliente WHERE Cpf=? and Senha=md5(?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, this.cliente.getCpf());
            stmt.setString(2, this.cliente.getSenha());
            
            rs = stmt.executeQuery();
            
            if ( rs.next() ) 
            {
                this.cliente.setNome( rs.getString("Nome") );
                this.cliente.setEmail( rs.getString("Email") );
                this.cliente.setTelefone( rs.getString("Telefone") );
                this.cliente.setData( rs.getString("DataNascimento") );
                
                return true;
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }
        
        return false;
    }
    
//     public boolean buscaCliente(){
//        
//        String sql = "Select * from cliente where Cpf=?";
//        try {
//            PreparedStatement stat = this.con.prepareStatement(sql);
//            stat.setString(1, this.cliente.getCpf());
//            ResultSet rs = stat.executeQuery();
//            
//            while(rs.next()){
//                String[] nasc = rs.getDate("DataNascimento").toString().split("-");
//                
//                this.cliente.setAno(Integer.parseInt(nasc[0]));
//                this.cliente.setMes(Integer.parseInt(nasc[1]));
//                this.cliente.setDia(Integer.parseInt(nasc[2]));
//                
//                this.cliente.setSenha(rs.getString("Senha"));
//                this.cliente.setEmail(rs.getString("Email"));
//                this.cliente.setNome(rs.getString("Nome"));
//                this.cliente.setTelefone(rs.getString("Telefone"));
//                
//                return true;
//                
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
    
    public boolean excluirCliente()
    {
        Connection conn         = ConnectionFactory.getConnection();   
        PreparedStatement stmt  = null;
        boolean result          = false;

        try {
            String sql = "delete from Cliente where Cpf = ?"; 
            
            stmt = conn.prepareStatement(sql);  
            stmt.setString(1, this.cliente.getCpf()); 
            
            result = (stmt.executeUpdate() > 0);
        } 
        catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt);
        }
        
        return result;
    }
    
   public boolean cadastrarCliente()
   {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        boolean             result  = false;
        
        try {
            String sql = "insert into cliente (Nome,Cpf,Email,Telefone,Senha,DataNascimento) values (?,?,?,?,md5(?),?)";
            
            stmt = conn.prepareStatement(sql); //prepara instrucao sql pra ser executada
            stmt.setString(1, this.cliente.getNome());
            stmt.setString(2, this.cliente.getCpf());
            stmt.setString(3, this.cliente.getEmail());
            stmt.setString(4, this.cliente.getTelefone());
            stmt.setString(5, this.cliente.getSenha());
            stmt.setString(6, this.cliente.getData());

            result = (stmt.executeUpdate() > 0);
        } 
        catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            ConnectionFactory.closeConnection(conn, stmt);
        }
         
        return( result );
   }
    
    public boolean atualizarCliente()
    {
        Connection          conn    = ConnectionFactory.getConnection();
        PreparedStatement   stmt    = null;
        boolean             result  = false;
        String              sql     = null;

        if ( this.cliente.getSenha().equals("") )
        {
            sql = "update cliente set Nome = ?, Email = ?, Telefone = ?, DataNascimento = ? where Cpf = ?";
            try {
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, this.cliente.getNome());
                stmt.setString(2, this.cliente.getEmail());
                stmt.setString(3, this.cliente.getTelefone());
                stmt.setString(4, MyDataHora.toUTC(this.cliente.getData()) );
                stmt.setString(5, this.cliente.getCpf());
                
                result = (stmt.executeUpdate()>0);
            } catch (SQLException ex) {
                throw new RuntimeException("Erro ao Executar Consulta (1).", ex);
            } 
            finally {
                ConnectionFactory.closeConnection(conn, stmt);
            }
        }
        else
        {
            sql = "update cliente set Senha = md5(?), Nome = ?, Email = ?, Telefone = ?, DataNascimento = ? where Cpf = ?";
            try {
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, this.cliente.getSenha());
                stmt.setString(2, this.cliente.getNome());
                stmt.setString(3, this.cliente.getEmail());
                stmt.setString(4, this.cliente.getTelefone());
                stmt.setString(5, MyDataHora.toUTC(this.cliente.getData()) );
                stmt.setString(6, this.cliente.getCpf());
                
                result = (stmt.executeUpdate()>0);
            } catch (SQLException ex) {
                throw new RuntimeException("Erro ao Executar Consulta (2).", ex);
            }
            finally {
                ConnectionFactory.closeConnection(conn, stmt);
            }
        }

        return( result );
    }
}
