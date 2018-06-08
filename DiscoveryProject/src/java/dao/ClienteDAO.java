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

/**
 *
 * @author Bianca
 */
public class ClienteDAO 
{
    private Connection con;
    private Cliente cliente;

    public ClienteDAO(Cliente cliente){
        this.con = ConnectionFactory.getConnection();
        this.cliente = cliente;
    }
    
    public boolean consultarCliente(){
        
        String sql = "Select * from cliente where Cpf=? and Senha=?";//md5(?)
        try {
            PreparedStatement stat = this.con.prepareStatement(sql);
            stat.setString(1, this.cliente.getCpf());
            stat.setString(2, this.cliente.getSenha());
            ResultSet rs = stat.executeQuery();
            
            while(rs.next()){
                String[] nasc = rs.getDate("DataNascimento").toString().split("-");
                
                this.cliente.setAno(Integer.parseInt(nasc[0]));
                this.cliente.setMes(Integer.parseInt(nasc[1]));
                this.cliente.setDia(Integer.parseInt(nasc[2]));
                
                this.cliente.setEmail(rs.getString("Email"));
                this.cliente.setNome(rs.getString("Nome"));
                this.cliente.setTelefone(rs.getString("Telefone"));
                
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public boolean buscarCliente(){
        
        String sql = "Select * from cliente where Cpf=?";
        try {
            PreparedStatement stat = this.con.prepareStatement(sql);
            stat.setString(1, this.cliente.getCpf());
            ResultSet rs = stat.executeQuery();
            
            while(rs.next()){
                String[] nasc = rs.getDate("DataNascimento").toString().split("-");
                
                this.cliente.setAno(Integer.parseInt(nasc[0]));
                this.cliente.setMes(Integer.parseInt(nasc[1]));
                this.cliente.setDia(Integer.parseInt(nasc[2]));
                
                this.cliente.setSenha(rs.getString("Senha"));
                this.cliente.setEmail(rs.getString("Email"));
                this.cliente.setNome(rs.getString("Nome"));
                this.cliente.setTelefone(rs.getString("Telefone"));
                
                return true;
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean excluirCliente(){
        Connection conn = ConnectionFactory.getConnection();   
        PreparedStatement stmt = null;
        boolean result = false;

        try {
          String sql = "delete from Cliente where Cpf = ?"; 
          PreparedStatement stat = con.prepareStatement(sql);  
          stat.setString(1, this.cliente.getCpf()); 
          result = (stat.executeUpdate() != 0) ? true : false ; //é execute update msm? + retorna 0 se conseguir
         } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return result;
    }
    
   public boolean cadastrarCliente(){
       
       Connection          conn    = ConnectionFactory.getConnection();
       PreparedStatement   stmt    = null;
       boolean             result  = false;
        
        
         try {
            String sql = "insert into cliente (Nome,Cpf,Email,Telefone,Senha,DataNascimento) values (?,?,?,?,md5(?),?)";
            PreparedStatement stat = conn.prepareStatement(sql); //prepara instrucao sql pra ser executada
            stat.setString(1, this.cliente.getNome());
            stat.setString(2, this.cliente.getCpf());
            stat.setString(3, this.cliente.getEmail());
            stat.setString(4, this.cliente.getTelefone());
            stat.setString(5, this.cliente.getSenha());
            stat.setString(6, this.cliente.getData());

            result = (stat.executeUpdate() != 0) ? true : false ;
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return( result );
   }
    
    public boolean atualizarCliente(){
        String sql;
                 
        PreparedStatement stat;
          
        if (this.cliente.getSenha().equals("")){
            sql = " update cliente set Nome = ?, Email = ?, Telefone = ?, DataNascimento = ? where Cpf = ?";
            try {
                stat = con.prepareStatement(sql);
                
                 stat.setString(1, this.cliente.getNome());
                 stat.setString(2, this.cliente.getEmail());
                 stat.setString(3, this.cliente.getTelefone());
                 stat.setString(4, this.cliente.getData());
                 stat.setString(5, this.cliente.getCpf());
                 
                 if(stat.executeUpdate()>0){
                     
                     return true;
                 }
                 
                 
            
            } catch (SQLException ex) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        else {
           sql = " update cliente set Senha = md5(?), Nome = ?, Email = ?, Telefone = ?, DataNascimento = ? where Cpf = ?";
            try {
                stat = con.prepareStatement(sql);
                
                stat.setString(1, this.cliente.getSenha());
                stat.setString(2, this.cliente.getNome());
                stat.setString(3, this.cliente.getEmail());
                stat.setString(4, this.cliente.getTelefone());
                stat.setString(5, this.cliente.getData());
                stat.setString(6, this.cliente.getCpf());
                
               if(stat.executeUpdate()>0){
                     
                    return true;
                 }
                
            } catch (SQLException ex) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        return false;
    }
    
    public void fechaconexao(){
        ConnectionFactory.closeConnection(this.con);
    }
}
