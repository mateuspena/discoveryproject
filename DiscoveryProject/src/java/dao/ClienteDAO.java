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
        
        String sql = "Select * from cliente where Cpf=? and Senha=md5(?)";
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
    
    public void excluirCliente(){}
    
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
    
    public void atualizarCliente(){}
    
    public void fechaconexao(){
        ConnectionFactory.closeConnection(this.con);
    }
}
