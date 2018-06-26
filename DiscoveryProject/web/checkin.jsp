<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<%
    Object[] passagem               = (Object[]) request.getAttribute("passagem");
    ArrayList<Object[]> assentos    =  (ArrayList<Object[]>) request.getAttribute("assentos");
    int codPassagem                 = Integer.parseInt( request.getParameter("item") );
%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Checkin de Passagem: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

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
            
           
            input[type="radio"] {
                border: 0px;
                width: 80%;
                height:20px;
            }
            
            tr:hover {
                cursor: pointer;
            }
            
        </style>

        <script type="text/javascript">
            
            function selectLinha(tabela, linha)
            {
                var conteudo = document.getElementById(tabela).rows[linha].cells.item(0).innerHTML;
                document.getElementById(tabela).rows[linha].cells.item(0).innerHTML = conteudo.replace(">", " checked>");
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
                        <h3>Checkin de Passagem</h3>
                        <form name="reclamacao" method="post" OnSubmit="return validaReclamacao()" action="RealizaCheckin">
                            <div style="overflow-y: auto; height:300px; margin-top:-15px;">
                                <INPUT type="hidden" name="codpassagem" value="<%=codPassagem %>">

                                <table class="responstable" id="assentos" style="margin-top:-1px;">
                                    <col width="15%">
                                    <col width="85%">

                                    <thead>
                                        <th>Item</th>
                                        <th>Assento</th>
                                    </thead>

                                    <tbody>
                                        <% if (assentos.size()>0) for (int i=0; i< assentos.size(); i++) { %>
                                        <% Object[] linha = assentos.get(i); %>
                                        <tr onClick="selectLinha('assentos', <%=i+1 %>)">
                                            <td><input type="radio" name="item" value="<%=linha[0] %>" required></td>
                                            <td><%=linha[1] %></td>
                                        </tr>
                                        <% } else { %>
                                        <tr> 
                                            <td><i>Nenhum assento está disponível.</i></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <!--  -->

                            <!-- INÍCIO - Linha 3 -->
                            <% if (assentos.size()>0) { %>
                            <div class="form-group" style="margin-top:30px;">
                                <center>
                                    <!-- Botão Confirmar -->
                                    <input 
                                        type="submit" 
                                        value="Realizar Checkin" 
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
                            <% } %>
                            <!-- FINAL - Linha 3 -->
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