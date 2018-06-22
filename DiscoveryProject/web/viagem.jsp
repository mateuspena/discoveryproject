<%@page import="negocio.*"%>
<%@page import="negocio.Functions.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   
    // Carregar dados da pesquisa.
    HashMap<String, Object> COMPRA = (HashMap<String, Object>) request.getSession().getAttribute("COMPRA");
    
    int TipoViagem  = Integer.parseInt( COMPRA.get("TipoViagem").toString() );
    int Cabine      = Integer.parseInt( COMPRA.get("Cabine").toString() );
    String cOrigem  = ((Cidade) COMPRA.get("CidadeOrigem")).getCidade();
    String cDestino = ((Cidade) COMPRA.get("CidadeDestino")).getCidade();
    String dataIda      = (String) COMPRA.get("DataIda");
    String dataVolta    = (String) COMPRA.get("DataVolta");

    // Carregar tabelas.
    ArrayList<Object[]> tIda    = ((ArrayList<Object[]>) COMPRA.get("tIda"));
    ArrayList<Object[]> tVolta  = ((ArrayList<Object[]>) COMPRA.get("tVolta"));
    
    // Formatar dados para exibição.
    dataIda     = MyDataHora.toDateFormat( dataIda );
    dataVolta   = dataVolta!=null ? MyDataHora.toDateFormat( dataVolta ) : dataVolta;  
%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Sua Viagem: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <style>
            .fh5co-contact-info ul li.cidOrigem:before {
              font-size: 23px;
              content: "\e9d2";
            }

            .fh5co-contact-info ul li.cidDestino:before {
              font-size: 23px;
              content: "\e070";
            }

            .fh5co-contact-info ul li.tipoPassagem:before {
              font-size: 23px;
              content: "\ea20";
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
            function defineTipoViagem()
            {
                var tipo="apenas_ida";
                for (var i=0; i< viagem.elements.length; i++)
                    if ( viagem.elements[i].name == 'select_volta' )
                        tipo = "ida_volta";
                
                var conteudo = document.getElementById("tIda").rows[1].cells.item(0).innerHTML;
                document.getElementById("tIda").rows[1].cells.item(0).innerHTML = conteudo.replace(">", " required>");
                
                if ( tipo == "ida_volta" ){
                    conteudo = document.getElementById("tVolta").rows[1].cells.item(0).innerHTML;
                    document.getElementById("tVolta").rows[1].cells.item(0).innerHTML = conteudo.replace(">", " required>");
                }
            }
            
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

        <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/viagem/capa.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="display-t">
                            <div class="display-tc animate-box" data-animate-effect="fadeIn">
                                <h1>Sua Viagem</h1>
                                <h2>Viajando a negócios? Encontre aqui sua passagem por um preço justo.</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        
        <div id="fh5co-contact">
            <div class="container">
                <div class="row">

                    <!-- INÍCIO - Coluna da Esquerda -->
                    <div class="col-md-5 col-md-push-1 animate-box">
                        <div class="fh5co-contact-info">
                            <h3>Sua Viagem</h3>
                            <ul>
                                <li class="cidOrigem"> <b>Origem: </b><%=cOrigem %></li>
                                <li class="cidDestino"> <b>Destino: </b><%=cDestino %></li>
                                <li class="tipoPassagem"> <b>Tipo: </b><% if (TipoViagem==1) out.print("Ida & Volta"); else out.print("Apenas Ida"); %></li>
                                <li class="dataHora"> <b>Data da Ida: </b><%=dataIda %></li>
                                
                                <% if ( TipoViagem == 1 ) {%>
                                <li class="dataHora"> <b>Data da Volta: </b><%=dataVolta %></li>
                                <% } %>
                                
                                <li class="cabine"> <b>Cabine:</b> <% if (Cabine==1) out.print("Econômica"); else out.print("Primeira Classe"); %></li>
                            </ul>
                        </div>
                    </div>
                    <!-- FINAL - Coluna da Esquerda -->

                    <!-- INÍCIO - Coluna da Direita -->
                    <div class="col-md-7 animate-box">
                        <form method="post" action="CompraPassagem" name="viagem">
                            
                            <!-- INÍCIO - Passagens de Ida -->
                            <h3>Viagens Disponíveis (Ida)</h3>
                            <table class="responstable" id="tIda">
                                <col width="30px">
                                <col width="200px">
                                <col width="200px">
                                <col width="130px">
                                <col width="100px">
                                
                                <tr>
                                    <th>Select</th>
                                    <th>Origem</th>
                                    <th>Destino</th>
                                    <th>Data</th>
                                    <th>Valor</th>
                                </tr>

                                <% if (tIda.size() > 0) for (int i=0; i< tIda.size(); i++) { %>
                                <tr onClick="selectLinha('tIda', <%=i+1 %>)">
                                    <td><input type="radio" value="<%=tIda.get(i)[0] %>" name="select_ida"></td>
                                    <td><%=tIda.get(i)[1] %></td>
                                    <td><%=tIda.get(i)[2] %></td>
                                    <td><%=tIda.get(i)[3] %></td>
                                    <td><script>document.write(numberToReal(<%=tIda.get(i)[4] %>))</script></td>
                                </tr>
                                <% } else { %>
                                <tr>
                                    <td colspan="5">
                                        <i>Nenhuma passagem foi encontrada para este periodo.</i>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                            <!-- FINAL - Passagens de Ida -->
                            
                            <!-- INÍCIO - Passagens de Volta -->
                            <% if ( TipoViagem == 1 ) { %>
                            <br>
                            <h3>Viagens Disponíveis (Volta)</h3>
                            <table class="responstable" id="tVolta">
                                <col width="30px">
                                <col width="200px">
                                <col width="200px">
                                <col width="130px">
                                <col width="100px">
                                
                                <tr>
                                    <th>Select</th>
                                    <th>Origem</th>
                                    <th>Destino</th>
                                    <th>Data</th>
                                    <th>Valor</th>
                                </tr>

                                <% if (tVolta.size() > 0) for (int i=0; i< tVolta.size(); i++){ %>
                                <tr onClick="selectLinha('tVolta', <%=i+1 %>)">
                                    <td><input type="radio" value="<%=tVolta.get(i)[0] %>" name="select_volta"></td>
                                    <td><%=tVolta.get(i)[1] %></td>
                                    <td><%=tVolta.get(i)[2] %></td>
                                    <td><%=tVolta.get(i)[3] %></td>
                                    <td><script>document.write(numberToReal(<%=tVolta.get(i)[4] %>))</script></td>
                                </tr>
                                <% } else { %>
                                <tr>
                                    <td colspan="5">
                                        <i>Nenhuma passagem foi encontrada para este periodo.</i>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                            <% } %>
                            <!-- FINAL - Passagens de Volta -->

                            <% if ( tIda.size()>0 ) { %>
                            <div class="form-group" style="margin-top:25px; margin-right:20px;">
                                <center>
                                    <input 
                                        type="submit" 
                                        value="Comprar Viagem" 
                                        class="btn btn-primary"  
                                        style="
                                            background-color:#024457; 
                                            border: 1px solid #024457;
                                            font-family:Verdana;
                                        " 
                                    enabled>
                                </center>
                            </div>
                            <% } %>
                        </form>		
                    </div>
                    <!-- FINAL - Coluna da Direita -->

                </div>  <!-- fim: <div class="row"> -->
            </div>      <!-- fim: <div class="container"> -->
        </div>          <!-- fim: <div id="fh5co-contact"> -->
		
        <div id="fh5co-started">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Desistiu da Viagem?</h2>
                        <p>Comprou uma passagem mas desistiu da viagem? Para fazer o <b style="color:#dfdfdf">Cancelamento</b>, siga para sua página de perfil. Consulte as condições de cancelamento.</p>
                    </div>
                </div>
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="col-md-6 col-md-offset-3 col-sm-6">
                            <button type="button" class="btn btn-default btn-block" onClick="toPageLogin()">Ir para Meu Perfil</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="include/footer.jsp" %>
    </div>
        
    <script>
        defineTipoViagem();      
    </script>
    <%@include file="include/footscripts.jsp" %>
    </body>
</html>