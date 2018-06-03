<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Minhas Reclamações: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

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
    <meta name="viewport" content="width=device-width, initial-scale=1">


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

    <!-- Minhas Folhas de Estilos -->
    <link rel="stylesheet" href="css/tabelas-responsive.css">

    <!-- Meus JavaScripts -->
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
<!-- INÍCIO ~ Painel Superior ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
            <nav class="fh5co-nav" style="background-color:#0c9cee;height:50px;" role="navigation">
                    <div class="container" style="margin-top:-15px;">
                            <div class="row">
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-10 text-right menu-1">
                                            <ul>
                                                    <li><a href="index.html">Início</a></li>
                                                    <li><a href="viagem.html">Sua Viagem</a></li>
                                                    <li><a href="contato.html">Contato</a></li>
                                                    <li><a href="sobre.html">Sobre</a></li>
                                                    <li class="has-dropdown">
                                                            <a href="services.html" style="color:#ffffff;">Meu Perfil</a>
                                                            <ul class="dropdown">
                                                                    <li><a href="minhasviagens.html">Viagens</a></li>
                                                                    <li><a href="minhasreclamacoes.html" style="color:#0c9cee">Reclamações</a></li>
                                                                    <li><a href="index.html">Sair</a></li>
                                                            </ul>
                                                    </li>
                                            </ul>
                                    </div>
                            </div>
                    </div>
            </nav>
<!-- FINAL ~ Painel Superior ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

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
    </div>


            <!--
            ******************************************************************
            ÁREA DO RODAPÉ - INÍCIO
            ******************************************************************
            -->
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
                                                    <li><a href="index.html">Index</a></li>
                                                    <li><a href="viagem.html">Sua Viagem</a></li>
                                                    <li><a href="contato.html">Contato</a></li>
                                                    <li><a href="sobre.html">Sobre</a></li>
                                                    <li><a href="login.html">Login</a></li>
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
            <!--
            ******************************************************************
            ÁREA DO RODAPÉ - FINAL
            ******************************************************************
            -->	
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