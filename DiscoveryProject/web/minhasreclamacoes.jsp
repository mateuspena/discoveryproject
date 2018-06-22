<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
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
                            <col width="100px">
                            <col width="200px">
                            <col width="300px">
                            <col width="100px">

                            <thead>
                                <th>Código Passagem</th>
                                <th>Abertura da Reclamação</th>
                                <th>Descrição</th>
                                <th>Situação</th>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>20/02/2037</td>
                                    <td>Minhas bagagens se perderam.</td>
                                    <td>Aberta</td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
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