<%@page import="negocio.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.Reclamacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<%
    ArrayList<Reclamacao> reclamacoes = Reclamacao.listar( ((Cliente)request.getSession().getAttribute("cliente")).getCpf() );
%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Minhas Reclamações: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function validaConsulta()
            {
                if ( reclamacoes.item.value=="" )
                {
                    alert("Por favor, selecione um item da lista de reclamações!");
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
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Minhas Reclamações</h2>
                        <p>Atenção! Reclamações finalizadas são respondidas através do email do Cliente. Por favor, confira sua caixa de entrada.</p>
                    </div>

                    <center>
                        <table class="responstable">
                            <col width="10%">
                            <col width="20%">
                            <col width="20%">
                            <col width="50%">

                            <thead>
                                <th>Passagem</th>
                                <th>Situação</th>
                                <th>Data de Abertura</th>
                                <th>Descrição</th>
                            </thead>

                            <tbody>
                                <% if (reclamacoes.size()>0) for (int i=0; i< reclamacoes.size(); i++) { %>
                                <% Reclamacao r = reclamacoes.get(i); %>
                                <tr>
                                    <td><%=r.getPassagem().getCodigo() %></td>
                                    <td><% if ( r.getSituacao().equals("Cadastrada") ) {out.print("<b style='color:red'>" + r.getSituacao() + "</b>");} else if ( r.getSituacao().equals("Finalizada") ) {out.print("<b style='color:green'>" + r.getSituacao() + "</b>");} else {out.print("<b style='color:blue'>" + r.getSituacao() + "</b>");} %></td>
                                    <td><%=r.getDataAbertura() %></td>
                                    <td><%=r.getDescricao() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </center>
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