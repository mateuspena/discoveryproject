<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Meu Perfil: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function excluirConta()
            {
                return( confirm("ATENÇÃO!\n\nAo excluir sua conta, todos os seus dados serão descartados do sistema. Você perderá o acesso a todas as compras realizadas.\n\nSe deseja continuar, clique em \"OK\".\nCaso contrario, clique em \"Cancelar\".") );
            }
        </script>
        
        <style>
            .fh5co-contact-info ul li.nomeCliente:before {
                font-size: 23px;
                content: "\e074";
            }

            .fh5co-contact-info ul li.cpfCliente:before {
                font-size: 23px;
                content: "\ea38";
            }

            .fh5co-contact-info ul li.emailCliente:before {
                font-size: 23px;
                content: "\e9da";
            }

            .fh5co-contact-info ul li.dataNascimento:before {
                font-size: 23px;
                content: "\e979";
            }
        </style>
    </head>

    <body>

    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="include/navbar.jsp" %>

<!-- INÍCIO ~ Conteúdo do Corpo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <div id="fh5co-contact" style="margin-top:50px">
            <div class="container">
                <div class="row">
                    <!-- INÍCIO - Coluna da Esquerda -->
                    <div class="col-md-4 col-md-push-1 animate-box">
                        <%
                        Cliente cliente = new Cliente();
                        cliente = (Cliente)request.getSession().getAttribute("cliente");
                        %>
                        <div class="fh5co-contact-info">
                            <h3>Meu Perfil</h3>
                            <ul>
                                <li class="nomeCliente"> <b>Nome: </b><%= cliente.getNome()%></li>
                                <li class="cpfCliente"> <b>CPF: </b> <%= cliente.getCpf()%> </li>
                                <li class="emailCliente"> <b>Email: </b> <%= cliente.getEmail()%></li>
                                <li class="dataNascimento"> <b>Data de Nascimento: </b> <%=  cliente.getData()%></li>
                            </ul>
                        </div>
                    </div>
                    <!-- FINAL - Coluna da Esquerda -->

                    <!-- INÍCIO - Coluna da Direita -->
                    <center>
                        <table border="0">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                                    
                            <tr height="150px" align="center">
                                <td>
                                    <form action="EditarCliente" method="post">
                                        <button 
                                            type="submit"
                                            name="editar"
                                            style="
                                                font-size:40px;
                                                color: #0C9CEE; 
                                                font-weight:bold; 
                                                padding: 10px 25px 1px 25px"
                                            enabled>
                                                <i class="icon-new-message"></i>
                                                <p style="font-size:14px;">Editar Perfil</p>
                                        </button>
                                    </form>
                                </td>
                                
                                <td>
                                    <button 
                                        onClick="toMinhasViagens()"
                                        style="
                                            font-size:40px;
                                            color: #0C9CEE; 
                                            font-weight:bold; 
                                            padding: 10px 38px 1px 38px"
                                        enabled>
                                            <i class="icon-direction"></i>
                                            <p style="font-size:14px;">Viagens</p>
                                    </button>
                                </td>
                                
                                <td>
                                    <button 
                                        onClick="toReclamacoes()"
                                        style="
                                            font-size:40px;
                                            color: #0C9CEE; 
                                            font-weight:bold; 
                                            padding: 10px 20px 1px 20px"
                                        enabled>
                                            <i class="icon-warning"></i>
                                            <p style="font-size:14px;">Reclamações</p>
                                    </button>
                                </td>
                                
                                <td>
                                    <form action="ExcluirCliente" onSubmit="return excluirConta()" method="post" >
                                        <button 
                                            type="submit"
                                            name="editar"
                                            style="
                                                font-size:40px;
                                                color: #0C9CEE; 
                                                font-weight:bold; 
                                                padding: 10px 19px 1px 19px"
                                            enabled>
                                                <i class="icon-remove-user"></i>
                                                <p style="font-size:14px;">Excluir Conta</p>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <!-- FINAL - Coluna da Direita -->
                </div>
            </div>
        </div>
<!-- FINAL ~ Conteúdo do Corpo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->                                 

        <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/footscripts.jsp" %>
    </body>
</html>