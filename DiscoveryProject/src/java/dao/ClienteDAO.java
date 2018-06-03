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
            //String nasc1="00/00/0000";
            //String[] nasc = nasc1.split("-");
            while(rs.next()){
                //nasc = rs.getString("DataNacimento");
                //String[] nasc = rs.getDate("DataNacimento").toString().split("-");
                /*
                this.cliente.setAno(Integer.parseInt(nasc[0]));
                this.cliente.setMes(Integer.parseInt(nasc[1]));
                this.cliente.setDia(Integer.parseInt(nasc[2]));
                */
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
    
    public void adcionarCliente(){ }
    
    public void atualizarCliente(){}
    
    public void fechaconexao(){
        ConnectionFactory.closeConnection(this.con);
    }
}
