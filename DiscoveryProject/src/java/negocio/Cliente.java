/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import dao.ClienteDAO;
import negocio.Functions.MyDataHora;

/**
 *
 * @author Bianca
 */
public class Cliente {
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ATRIBUTOS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    private String cpf;
    private String nome;
    private String telefone;
    private String email;
    private String senha;
    private String data;

    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // CREATE, READ, UPDATE, DELETE
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public boolean validaAcesso()
    {
        ClienteDAO dao = new ClienteDAO(this); 
        return( dao.consultarCliente() );
    }
    
//    public boolean buscarCliente(){
//        ClienteDAO dao = new ClienteDAO(this); 
//        boolean consulta = dao.buscarCliente();
//        dao.fechaconexao();
//        return consulta;
//    }
    
    public boolean atualizarCliente()
    {
        ClienteDAO dao = new ClienteDAO(this); 
        return( dao.atualizarCliente() );
    }
     
    public boolean incluirCliente()
    {
        ClienteDAO dao = new ClienteDAO(this);
        return( dao.cadastrarCliente() );
    }
    
    public boolean excluirCliente()
    {
        ClienteDAO dao = new ClienteDAO(this);
        return( dao.excluirCliente() );
    }
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ~ CONSTRUTORES
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public Cliente(String cpf, String nome, String telefone, String email, String senha, String data) 
    {
        this.setCpf(cpf);
        this.setNome(nome);
        this.setTelefone(telefone);
        this.setEmail(email);
        this.setSenha(senha);
        this.setData(data);
    }
    
    public Cliente(String cpf, String senha) {
        this.cpf        = cpf;
        this.senha      = senha;
    }

    public Cliente(String cpf) {
        this.cpf        = cpf;
    }

    public Cliente() {
    }  
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ~ GETTERS E SETTERS
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public String getData(){
        return( this.data );
    }
    
    /**
     * Preenche o atributo data com uma string no formato dd/mm/yyyy.
     * @param data
     */
    public void setData(String data) {
        if  ( data.contains("-") )
            this.data = MyDataHora.toDateFormat(data);
        else
            this.data = data;
    }
    
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return( this.cpf );
    }
    
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return( this.nome );
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}