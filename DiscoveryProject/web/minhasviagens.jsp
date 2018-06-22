<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Minhas Viagens: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function realizarCheckIn(){
                if ( viagens.item.value=="" )
                    alert("Por favor, selecione um item da lista de viagens.");
                else
                    location.href = "checkin.html?cod=" + viagens.item.value;
            }

            function cancelarPassagem() {
                if ( viagens.item.value=="" )
                    alert("Por favor, selecione um item da lista de viagens.");
                else
                    location.href = "cancelamento.html?cod=" + viagens.item.value;
            }

            function fazerReclamacao() {
                if ( viagens.item.value=="" )
                    alert("Por favor, selecione um item da lista de viagens.");
                else
                    location.href = "novareclamacao.html?cod=" + viagens.item.value;
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
                        <h2>Minhas Viagens</h2>
                    </div>

                    <form name="viagens" method="post" action="#">
                        <table class="responstable">
                            <col width="50px">
                            <col width="100px">
                            <col width="100px">
                            <col width="150px">
                            <col width="150px">
                            <col width="100px">
                            <col width="100px">

                            <thead>
                                <th>Item</th>
                                <th>Código</th>
                                <th>Assento</th>
                                <th>Cidade Origem</th>
                                <th>Cidade Destino</th>
                                <th>Data CheckIn</th>
                                <th>Status</th>
                            </thead>

                            <tbody>
                                <tr>
                                    <td><input type="radio" name="item" value="123"></td>
                                    <td>123</td>
                                    <td>2</td>
                                    <td>Salvador</td>
                                    <td>Rio de janeiro</td>
                                    <td>00/00/00</td>
                                    <td>Ativo</td>
                                </tr>

                                <tr>
                                    <td><input type="radio" name="item" value="1"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td><input type="radio" name="item" value="2"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="form-group" style="margin-top:25px; margin-right:20px;">
                            <center>
                                <!-- Botão Realiza CheckIN -->
                                <input 
                                    type="button" 
                                    value="Realizar CheckIn" 
                                    class="btn btn-primary" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    "
                                    OnClick="realizarCheckIn()"
                                enabled>

                                <!-- Botão Cancelar Passagem -->
                                <input 
                                    type="button" 
                                    value="Cancelar Passagem" 
                                    class="btn btn-primary" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    "
                                    OnClick="cancelarPassagem()"
                                enabled>

                                <!-- Botão Fazer Reclamação -->
                                <input 
                                    type="button" 
                                    value="Fazer Reclamação" 
                                    style="
                                        background-color:#024457; 
                                        border: 1px solid #024457;
                                    " 
                                    class="btn btn-primary" 
                                    OnClick="fazerReclamacao()"
                                enabled>
                            </center>
                        </div>	
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