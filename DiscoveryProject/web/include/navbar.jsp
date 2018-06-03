<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String filename = this.getClass().getSimpleName().replaceAll("_", ".");
%>
<!-- include/navbar.jsp: INÍCIO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<nav class="fh5co-nav" role="navigation">
    <div class="container">
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

                    <li class="btn-cta"><a href="login.jsp"><span>Fazer login</span></a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- include/navbar.jsp: FINAL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
