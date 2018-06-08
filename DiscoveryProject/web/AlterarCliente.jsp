<%-- 
    Document   : AlterarCliente
    Created on : 06/06/2018, 19:53:05
    Author     : Gilmar
--%>

<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <%@include file="include/header.jsp" %>
        <title>Cadastrar: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function validarCadastro(){
                if ( cadastrar.cpf.value=="" || cadastrar.nome.value=="" || cadastrar.data.value=="" || cadastrar.email.value=="" || cadastrar.telefone.value=="")
                {
                    alert("Por favor, preencha todos os campos obrigatórios!");
                    return( false );
                }

                return( true );
            }
            
            function verificarCpf()
            {
                if ( cadastrar.cpf.value!="" && !validaCpf(cadastrar.cpf.value) )
                {
                    cadastrar.cpf.value = "";
                    alert("Por favor, preencha o campo CPF adequadamente.");
                }  
            }
        </script>

        <style>
            #mylink {
                color: #dddddd;
            }

            #mylink:hover {
                color: #ffffff;
                text-decoration: underline;
            }
        </style>
    </head>
    
    <body>
    <div class="fh5co-loader"></div>
    <div id="page">
        
 <!-- INÍCIO ~ Conteiner Formulário ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <div id="fh5co-started" >
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Editor</h2>
                    </div>
                </div>

                <div class="row animate-box">
                    <%Cliente cliente = new Cliente();
                         cliente = (Cliente)request.getSession().getAttribute("cliente");%>
                    <!-- INÍCIO - Formulário de Login -->
                    <form name="alterar" method="post" OnSubmit="return validarCadastro()" action="AlterarCadastro" class="form-inline">
                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">

                                <!-- Campo CPF -->
                                <input 
                                    type="hidden" 
                                    name="cpf" 
                                    id="cpf"
                                    value="<%= cliente.getCpf()%>"
                                    onfocusout="verificarCpf()"
                                    class="form-control" 
                                    OnKeyDown="fMasc(this, mCPF)"
                                    maxlength="14"
                                    required
                                >
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="nome" style="color:#efefef">Nome</label>

                                <!-- Campo Nome -->
                                <input 
                                    type="text" 
                                    name="nome"
                                    id="nome" 
                                    value="<%= cliente.getNome()%>"
                                    class="form-control" 
                                    maxlength="45"
                                    required
                                enabled>
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="data de nascimento" style="color:#efefef">Data de Nascimento</label>

                                <!-- Campo Data Nascimento -->
                                <input 
                                    type="date"
                                    name="data"
                                    id="data" 
                                    value="<%= cliente.getData2()%>"
                                    class="form-control"
                                    required
                                enabled>
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="nome" style="color:#efefef">Email</label>

                                <!-- Campo Email -->
                                <input 
                                    type="email" 
                                    name="email"
                                    id="email" 
                                    value="<%= cliente.getEmail()%>"
                                    class="form-control" 
                                    maxlength="45"
                                    required
                                enabled>
                            </div>
                        </div>
                        
                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="senha" style="color:#efefef">Senha</label>

                                <!-- Campo Senha -->
                                <input 
                                    type="Password" 
                                    name="senha"
                                    id="senha" 
                                   
                                    class="form-control" 
                                    placeholder="●●●●●●●●"
                                    maxlength="10"                                   
                                enabled>
                            </div>
                        </div>
                        
                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="cfm_senha" style="color:#efefef">Confirmar Senha</label>

                                <!-- Campo Confirmar Senha -->
                                <input 
                                    type="Password" 
                                    name="cfm_senha"
                                    id="cfm_senha" 
                                    class="form-control" 
                                    placeholder="●●●●●●●●"
                                    maxlength="10"
                                enabled>
                            </div>
                        </div>
                        
                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="telefone" style="color:#efefef">Telefone</label>
                                <input 
                                    type="text" 
                                    name="telefone" 
                                    value="<%= cliente.getTelefone()%>"
                                    class="form-control" 
                                    maxlength="9"
                                    required
                                enabled>
                            </div>
                        </div>
                        

                        <div class="col-md-8 col-md-offset-2">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <p><input name="modificar" type="submit" class="btn btn-default btn-block" value="Alterar"></p>
                            </div>
                        </div>
                    </form>
                    <!-- FINAL - Formulário de Login -->
                </div>
            </div>
        </div>
<!-- FINAL ~ Conteiner Formulário ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/footscripts.jsp" %>
    </body>
</html>
