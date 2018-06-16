<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String filename = this.getClass().getSimpleName().replaceAll("_", ".");
%>
<!-- include/navbar.jsp: INÍCIO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<% if ( !filename.equals("index.jsp")
        && !filename.equals("viagem.jsp")
        && !filename.equals("contato.jsp")
        && !filename.equals("sobre.jsp") ) { %>
<nav class="fh5co-nav" style="background-color:#0c9cee;height:50px;" role="navigation">
    <div class="container" style="margin-top:-15px;">
<% } else { %>
<nav class="fh5co-nav" role="navigation">
    <div class="container">
<% } %>
        <div class="row">
            <div class="col-xs-2">
                <!--
                <div id="fh5co-logo"><a href="index.html"><img src="images/method-draw-image.png" style="height:60px;width:88px;"></a></div>
                -->
            </div>
            <div class="col-xs-10 text-right menu-1">
                <ul>
                    <% if (filename.equals("index.jsp")){out.print("<li class=\"active\">");}else{out.print("<li>");}%>
                        <a href="index.jsp">Início</a>
                    </li>

                    <% if (filename.equals("contato.jsp")){out.print("<li class=\"active\">");}else{out.print("<li>");}%>
                        <a href="contato.jsp">Contato</a>
                    </li>

                    <% if (filename.equals("sobre.jsp")){out.print("<li class=\"active\">");}else{out.print("<li>");}%>
                        <a href="sobre.jsp">Sobre</a>
                    </li>

                    <% if (request.getSession().getAttribute("cliente") == null) { %>
                    <li class="btn-cta"><a href="login.jsp"><span>Fazer login</span></a></li>
                    <% } else { %>
                    <li class="has-dropdown">
                        <a href="#">Meu Perfil</a>                        
                        <ul class="dropdown">
                            <li><a href="meuperfil.jsp" <% if (filename.equals("meuperfil.jsp")){out.print("style='color:#0c9cee'");} %> >Painel</a></li>
                            <li><a href="minhasviagens.jsp" <% if (filename.equals("minhasviagens.jsp")){out.print("style='color:#0c9cee'");} %> >Viagens</a></li>
                            <li><a href="minhasreclamacoes.jsp" <% if (filename.equals("minhasreclamacoes.jsp")){out.print("style='color:#0c9cee'");} %> >Reclamações</a></li>
                            <li><a href="DesconectaCliente?q=true">Sair</a></li>
                        </ul>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- include/navbar.jsp: FINAL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
