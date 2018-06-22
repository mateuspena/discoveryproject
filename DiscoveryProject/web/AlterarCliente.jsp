<%-- 
    Document   : AlterarCliente
    Created on : 06/06/2018, 19:53:05
    Author     : Gilmar
--%>

<%@page import="negocio.Functions.MyDataHora"%>
<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cliente cliente = new Cliente();
    cliente = (Cliente)request.getSession().getAttribute("cliente");
%>
<!DOCTYPE html>
<html>
     <head>
        <%@include file="include/header.jsp" %>
        <title>Editar Perfil: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function validarAlteracao(){
                if ( alterar.cpf.value=="" || alterar.nome.value=="" || alterar.data.value=="" || alterar.email.value=="" || alterar.telefone.value=="")
                {
                    alert("Por favor, preencha todos os campos obrigatórios!");
                    return( false );
                }
                else if ( alterar.senha.value!="" && alterar.senha.value!=alterar.cfm_senha.value )
                {
                    alert("As senhas informadas não conferem. Por favor, verifique.");
                    return( false );
                }

                return( true );
            }
            
            function verificarCpf()
            {
                if ( alterar.cpf.value!="" && !validaCpf(alterar.cpf.value) )
                {
                    alterar.cpf.value = "";
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
                        <h2>Editar Perfil</h2>
                    </div>
                </div>

                <div class="row animate-box">
                    <!-- INÍCIO - Formulário de Login -->
                    <form name="alterar" method="post" OnSubmit="return validarAlteracao()" action="AlterarCadastro" class="form-inline">
                        
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
                                    value="<%= MyDataHora.toUTC( cliente.getData() )%>"
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
                                <p><input type="submit" class="btn btn-default btn-block" value="Alterar Cadastro"></p>
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
