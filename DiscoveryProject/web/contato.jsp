<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Contato: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function conectar() {
                location.href = "login.html";
            }
        </script>
    </head>
    
    <body>
    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="include/navbar.jsp" %>

        <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/contato/capa.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="display-t">
                            <div class="display-tc animate-box" data-animate-effect="fadeIn">
                                <h1>Contato</h1>
                                <h2>Dúvidas? Fale conosco.</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div id="fh5co-contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-md-push-1 animate-box">
                        <div class="fh5co-contact-info">
                            <h3>Informações de Contato</h3>
                            <ul>
                                <li class="address"> 198 West 21th Street, <br> Suite 721 New York NY 10016</li>
                                <li class="phone"><a href="tel://1234567920">+ 1235 2355 98</a></li>
                                <li class="email"><a href="mailto:info@yoursite.com">contato@discovery.com</a></li>
                                <li class="url"><a href="http://discovery.com">discovery.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 animate-box">
                        <h3>Entrar em Contato</h3>
                        <form action="#">
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <input type="text" id="fname" class="form-control" placeholder="Nome">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" id="lname" class="form-control" placeholder="Sobrenome">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <input type="text" id="email" class="form-control" placeholder="Email (exemplo@gmail.com)">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <input type="text" id="subject" class="form-control" placeholder="Assunto">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                        <textarea name="message" id="message" cols="30" rows="10" class="form-control" placeholder="Diga-nos o que esta pensado."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Enviar Mensagem" class="btn btn-primary">
                            </div>
                        </form>		
                    </div>
                </div>
            </div>
        </div>

        <div id="fh5co-started">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Problemas no Vôo?</h2>
                        <p>Caso tenha ocorrido algum inconveniente durante sua viagem você poderá solicitar um <b style="color:#dfdfdf">Atendimento</b> na sua página de perfil.</p>
                    </div>
                </div>
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2">
                        <form class="form-inline">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <button type="button" class="btn btn-default btn-block" onClick="conectar()">Ir para Meu Perfil</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/footscripts.jsp" %>
    </body>
</html>
