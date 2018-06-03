/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import dao.ClienteDAO;

/**
 *
 * @author Bianca
 */
public class Cliente {
    private String cpf;
    private String nome;
    private int dia, mes, ano;
    private String telefone;
    private String email;
    private String senha;

    public Cliente(String cpf, String nome, int dia, int mes, int ano, String telefone, String email, String senha) {
        this.cpf = cpf;
        this.nome = nome;
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
    }

    public Cliente(String cpf, String senha) {
        this.cpf = cpf;
        this.senha = senha;
    }

    public Cliente() {
    }
    
    public String getNascimento(){
        String data = Integer.toString(this.getDia())+"/"+Integer.toString(this.getMes())+"/"+Integer.toString(this.getAno());
        return data; 
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
        return cpf;
    }

    public String getNome() {
        return nome;
    }

    public int getDia() {
        return dia;
    }

    public int getMes() {
        return mes;
    }

    public int getAno() {
        return ano;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    @Override
    public String toString() {
        return "Cliente{" + "cpf=" + cpf + ", nome=" + nome + ", dia=" + dia + ", mes=" + mes + ", ano=" + ano + '}';
    }
    
    public boolean validaAcesso(){
        ClienteDAO dao = new ClienteDAO(this); 
        boolean consulta = dao.consultarCliente();
        dao.fechaconexao();
        return consulta;
    }
    
}
