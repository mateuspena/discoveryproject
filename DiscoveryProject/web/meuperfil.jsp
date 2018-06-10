<%@page import="negocio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Nova Reclamação: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <script type="text/javascript">
            function editaInformacao(){
                    location.href = ""//direciona p uma pagina para editar info
            </script>

    <script type="text/javascript">
            function excluirConta(){
                    //excluir conta
            }
    </script>

    <!-- Minhas personalizações - Modelo em "style.css" -->
            <style>
                    .fh5co-contact-info ul li.nomeCliente:before {
                      font-size: 23px;
                      content: "\e9d2";
                    }

                    .fh5co-contact-info ul li.cpfCliente:before {
                      font-size: 23px;
                      content: "\e070";
                    }

                    .fh5co-contact-info ul li.emailCliente:before {
                      font-size: 23px;
                      content: "\ea20";
                    }

                    .fh5co-contact-info ul li.dataNascimento:before {
                      font-size: 23px;
                      content: "\e979";
                    }


            </style>


    </head>

    <body>

    <div class="fh5co-loader"></div>

    <div id="page">

<!-- INÍCIO ~ Painel Superior ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <nav class="fh5co-nav" style="background-color:#0c9cee;height:50px;" role="navigation">
                    <div class="container" style="margin-top:-15px;">
                            <div class="row">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-10 text-right menu-1">
                                            <ul>
                                                    <li><a href="index.jsp
                                                           ">Início</a></li>
                                                    <li><a href="minhasviagens.jsp">Sua Viagem</a></li>
                                                    <li><a href="contato.jsp">Contato</a></li>
                                                    <li><a href="sobre.jsp">Sobre</a></li>
                                                    <li class="has-dropdown">
                                                            <a href="#" style="color:#ffffff;">Meu Perfil</a>
                                                            <ul class="dropdown">
                                                                    <li><a href="minhasviagens.jsp">Viagens</a></li>
                                                                    <li><a href="minhasreclamacoes.jsp" style="color:#0c9cee">Reclamações</a></li>
                                                                    <li><a href="index.jsp">Sair</a></li>
                                                            </ul>
                                                    </li>
                                            </ul>
                                    </div>
                            </div>
                    </div>
            </nav>
<!-- FINAL ~ Painel Superior ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- INÍCIO ~ Conteúdo do Corpo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <div id="fh5co-contact" style="margin-top:50px">
                    <div class="container">
                            <div class="row">

                                    <!-- INÍCIO - Coluna da Esquerda -->
                                    <div class="col-md-5 col-md-push-1 animate-box">
                                        <%
                                        Cliente cliente = new Cliente();
                                        cliente = (Cliente)request.getSession().getAttribute("cliente");
                                        %>
                                            <div class="fh5co-contact-info">
                                                    <h3>MEU PERFIL</h3>
                                                    <ul>
                                                            <li class="nomeCliente"> <b>Nome: </b><%= cliente.getNome()%></li>
                                                            <li class="cpfCliente"> <b>Cpf: </b> <%= cliente.getCpf()%> </li>
                                                            <li class="emailCliente"> <b>Email: </b> <%= cliente.getEmail()%></li>
                                                            <li class="dataNascimento"> <b>Data de Nascimento: </b> <%=  cliente.getNascimento()%></li>
                                                    </ul>
                                            </div>
                                    </div>
                                    <!-- FINAL - Coluna da Esquerda -->

                                    <!-- INÍCIO - Coluna da Direita -->


                                                    <!-- INÍCIO - Linha 3 -->
                                                    <form action="AlterarCadastro" method="post">
                                                            <input name="cpfAlterar" type="hidden" value="<%= cliente.getCpf()%>">
                                                            <div class="form-group" style="margin-top:10px;">
                                                            <center>
                                                                    <!-- Botão Editar -->
                                                                    <input 
                                                                            type="submit"
                                                                            name="modificar"                                                                            
                                                                            value="Editar" 
                                                                            class="btn btn-primary"
                                                                    enabled>
                                                            
                                                            </center>
                                                            </div>
                                                            
                                                    </form>
                                                    
                                                            
                                                    <form action="ExcluirCliente" method="post" >
                                                        <input name="cpfExcluir" type="hidden" value="<%= cliente.getCpf()%>">
                                                        <div class="form-group" style="margin-top:10px;">
                                                            <center>
                                                                    <!-- Botão Exclusão -->
                                                                    <input 
                                                                            type="submit" 
                                                                            value="Excluir minha conta" 
                                                                            class="btn btn-primary"
                                                                    enabled>
                                                            </center>
                                                            </div>
                                                        </form>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    <!-- FINAL - Linha 3 -->
                                            </form>		
                                    </div>
                                    <!-- FINAL - Coluna da Direita -->

                            </div>

                    </div>
            </div>
<!-- FINAL ~ Conteúdo do Corpo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- INÍCIO ~ Rodapé ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <footer id="fh5co-footer" role="contentinfo">
                    <div class="container">
                            <div class="row row-pb-md">
                                    <div class="col-md-4 fh5co-widget">
                                            <h3>Viaje mais!</h3>
                                            <p>Pensando em você, passageiro frequente da Discovery Linhas Aéreas, e na relação próxima que desenvolvemos ao longo do tempo criamos o AMIGO – nosso programa de fidelização.</p>
                                            <p><a href="#">Saiba mais</a></p>
                                    </div>
                                    <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                                            <ul class="fh5co-footer-links">
                                                    <li><a href="index.jsp">Index</a></li>
                                                    <li><a href="viagem.jsp">Sua Viagem</a></li>
                                                    <li><a href="contato.jsp">Contato</a></li>
                                                    <li><a href="sobre.jsp">Sobre</a></li>
                                                    <li><a href="login.jsp">Login</a></li>
                                            </ul>
                                    </div>

                                    <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                                            <ul class="fh5co-footer-links">
                                                    <li><a href="#">Facebook</a></li>
                                                    <li><a href="#">Twitter</a></li>
                                                    <li><a href="#">Instagram</a></li>
                                            </ul>
                                    </div>

                                    <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                                            <ul class="fh5co-footer-links">
                                                    <li><a href="https://dribbble.com/">Dribbble</a></li>
                                                    <li><a href="http://www.free-css.com">Free CSS</a></li>
                                                    <li><a href="http://freehtml5.co/">Free HTML5</a></li>
                                                    <li><a href="http://unsplash.com/">Unsplash</a></li>
                                            </ul>
                                    </div>
                            </div>

                            <div class="row copyright">
                                    <div class="col-md-12 text-center">
                                            <p>
                                                    <small class="block">&copy; 2016 Free HTML5. Todos os Direitos Reservados.</small> 
                                                    <small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
                                            </p>
                                            <p>
                                                    <ul class="fh5co-social-icons">
                                                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                                                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                                                            <li><a href="#"><i class="icon-linkedin"></i></a></li>
                                                            <li><a href="#"><i class="icon-dribbble"></i></a></li>
                                                    </ul>
                                            </p>
                                    </div>
                            </div>

                    </div>
            </footer>
<!-- FINAL ~ Rodapé ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    </div>

    <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Main -->
    <script src="js/main.js"></script>

    </body>
</html>