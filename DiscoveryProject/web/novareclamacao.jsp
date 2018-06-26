<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<%
    Object[] passagem               = (Object[]) request.getAttribute("passagem");
    int codPassagem                 = Integer.parseInt( request.getParameter("item") );
%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Nova Reclamação: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <style>
            .fh5co-contact-info ul li.passagem:before {
              font-size: 23px;
              content: "\e95d";
            }
            
            .fh5co-contact-info ul li.cidOrigem:before {
              font-size: 23px;
              content: "\e9d2";
            }

            .fh5co-contact-info ul li.cidDestino:before {
              font-size: 23px;
              content: "\e070";
            }

            .fh5co-contact-info ul li.dataHora:before {
              font-size: 23px;
              content: "\e979";
            }

            .fh5co-contact-info ul li.cabine:before {
              font-size: 23px;
              content: "\ea2c";
            }
        </style>

        <script type="text/javascript">

            function validaReclamacao()
            {
                if ( reclamacao.descricao.value=="" )
                {
                    alert("Por favor, preencha todos os campos obrigatórios!");
                    return( false );
                }

                return( true );
            }
        </script>
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
                    <div class="col-md-5 col-md-push-1 animate-box">
                        <div class="fh5co-contact-info">
                            <h3>Dados da Viagem</h3>
                            <ul>
                                <li class="passagem"> <b>Passagem: </b><%=codPassagem %></li>
                                <li class="cidOrigem"> <b>Origem: </b><%=passagem[2] %></li>
                                <li class="cidDestino"> <b>Destino: </b><%=passagem[3] %></li>
                                <li class="dataHora"> <b>Data: </b><%=passagem[4] %></li>
                                <li class="cabine"> <b>Cabine: </b><% if (passagem[0].equals("1")) {out.print("Econômica");} else {out.print("Primeira Classe");} %></li>
                            </ul>
                        </div>
                    </div>
                    <!-- FINAL - Coluna da Esquerda -->

                    <!-- INÍCIO - Coluna da Direita -->
                    <div class="col-md-6 animate-box">
                        <h3>Abrir Nova Reclamação</h3>
                        <form name="reclamacao" method="post" OnSubmit="return validaReclamacao()" action="AbreReclamacao">
                            
                            <INPUT type="hidden" name="codpassagem" value="<%=codPassagem %>">
                            
                            <!-- INÍCIO - Linha 1 -->
                            <div class="row form-group">
                                <div class="col-md-12">
                                    <b>Descrição do Problema</b><br>
                                    <textarea 
                                        name="descricao" 
                                        id="descricao"
                                        name="descricao"
                                        maxlength="200"
                                        rows="5" 
                                        class="form-control" 
                                        placeholder="Diga-nos o que esta pensado." 
                                        required
                                    enabled></textarea>
                                </div>
                            </div>
                            <!-- FINAL - Linha 1 -->

                            <!-- INÍCIO - Linha 2 -->
                            <div class="form-group" style="margin-top:30px;">
                                <center>
                                    <!-- Botão Confirmar -->
                                    <input 
                                        type="submit" 
                                        value="Abrir Reclamação" 
                                        class="btn btn-primary"
                                    enabled>

                                    <!-- Botão Cancelar -->
                                    <input 
                                        type="button" 
                                        value="Cancelar" 
                                        class="btn btn-primary" 
                                        OnClick="toIndexPage()"
                                    enabled>
                                </center>
                            </div>
                            <!-- FINAL - Linha 2 -->
                        </form>		
                    </div>
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

<% } %>