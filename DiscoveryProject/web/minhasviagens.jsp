<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Cliente"%>
<%@page import="negocio.Passagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<%
    //Cliente c = (Cliente) request.getSession().getAttribute("cliente");
    Passagem p = new Passagem((Cliente) request.getSession().getAttribute("cliente"));
    ArrayList<Object[]> lst = p.listarMinhasPassagens();
%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Minhas Viagens: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function validaProcessamento(){
                if ( viagens.item.value=="" ) {
                    alert("Por favor, selecione um item da lista de viagens.");
                    return( false );
                }
                
                return( true );
            }
            
            function selectLinha(tabela, linha)
            {
                var conteudo = document.getElementById(tabela).rows[linha].cells.item(0).innerHTML;
                document.getElementById(tabela).rows[linha].cells.item(0).innerHTML = conteudo.replace(">", " checked>");
            }
        </script>
        
        <style type="text/css">
            input[type="radio"] {
                border: 0px;
                width: 80%;
                height:20px;
            }
            
            tr:hover {
                cursor: pointer;
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
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Minhas Viagens</h2>
                    </div>

                    <form name="viagens" method="post" action="ProcessaViagem" OnSubmit="return validaProcessamento()" >
                        <table class="responstable" id="viagens">
                            <col width="30px">
                            <col width="150px">
                            <col width="100px">
                            <col width="100px">
                            <col width="150px">
                            <col width="100px">
                            <col width="100px">

                            <thead>
                                <th>Item</th>
                                <th>Data Voo</th>
                                <th>Status</th>
                                <th>Assento</th>
                                <th>Checkin</th>
                                <th>Cidade Origem</th>
                                <th>Cidade Destino</th>
                            </thead>

                            <tbody>
                                <% if ( lst.size()>0 ) { for (int i=0; i< lst.size(); i++) { %>
                                <% Object[] row = lst.get(i); %>
                                <tr onClick="selectLinha('viagens', <%=i+1 %>)">
                                    <td><input type="radio" name="item" value="<%=row[0] %>" required></td>
                                    <td><%=row[1] %></td>
                                    <td><% if ( ((String)row[2]).equals("Ativa") ) {out.print("<b style='color:green'>" + row[2] + "</b>");} else {out.print("<b style='color:red'>" + row[2] + "</b>");} %></td>
                                    <td><% if ( ((String)row[3]).equals("Não Escolhido") ) {out.print("<i>" + row[3] + "</i>");} else {out.print(row[3]);} %></td>
                                    <td><% if ( ((String)row[4]).equals("Pendente") ) {out.print("<i>" + row[4] + "</i>");} else {out.print(row[4]);} %></td>
                                    <td><%=row[5] %></td>
                                    <td><%=row[6] %></td>
                                </tr>
                                <% } } else { %>
                                <tr>
                                    <td colspan="7">
                                        <center><i>Nenhuma passagem foi encontrada.</i></center>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>

                        <% if ( lst.size()>0 ) { %>
                        <div class="form-group" style="margin-top:25px; margin-right:20px;">
                            <center>
                                <!-- Botão Realiza CheckIN -->
                                <button 
                                    value="1" 
                                    name="btn"
                                    type="submit"
                                    class="btn btn-primary" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    "
                                enabled>Realizar Checkin</button>

                                <!-- Botão Cancelar Passagem -->
                                <button 
                                    value="2"
                                    name="btn"
                                    type="submit"
                                    class="btn btn-primary" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    "
                                enabled>Cancelar Passagem</button>

                                <!-- Botão Fazer Reclamação -->
                                <button 
                                    value="3"
                                    name="btn"
                                    type="submit"
                                    class="btn btn-primary" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    " 
                                enabled>Fazer Reclamação</button>
                            </center>
                        </div>
                        <% } %>
                    </form>
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