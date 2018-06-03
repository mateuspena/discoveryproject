<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Comprar Viagem: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

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
        </style>

        <script type="text/javascript">
            function cancelar()
            {
                window.location.href = "index.jsp";
            }
            
            function validaCompra()
            {
                if ( formulario.vencimento.value=="" )
                {
                    alert("Por favor, preencha todos os campos obrigatórios!");
                    return( false );
                }

                return( true );
            }          

            function validaFormaPagamento()
            {
                if ( formulario.formapag.value == "p" )
                {
                    formulario.qtdparcelas.disabled = false;
                }
                else
                {
                    formulario.qtdparcelas.value = 1;
                    formulario.valparcelas.value = formulario.valor.value;
                    formulario.qtdparcelas.disabled = true;
                }
            }

            function validaParcela()
            {
                var qtdparcelas = formulario.qtdparcelas.value;
        
                if (qtdparcelas == "")
                    formulario.qtdparcelas.value = 1;
                else if ( qtdparcelas > 10 || qtdparcelas == 0 )
                    formulario.qtdparcelas.value = 1;
                else if ( qtdparcelas > -1 && qtdparcelas < 1 )
                    formulario.qtdparcelas.value = 1;
                else
                {
                    // é ponto flutuante?
                    if ( qtdparcelas != parseFloat(qtdparcelas).toFixed(0) )
                        qtdparcelas = parseFloat(qtdparcelas).toFixed(0);
                    
                    if ( qtdparcelas < 0 )
                        formulario.qtdparcelas.value = qtdparcelas * -1;
                }
                
                var valor = realToNumber( formulario.valor.value );
                formulario.valparcelas.value = numberToReal( valor / formulario.qtdparcelas.value );
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
                                                            <li><a href="#" style="color:#0c9cee">Viagens</a></li>
                                                            <li><a href="#">Reclamações</a></li>
                                                            <li><a href="#">Sair</a></li>
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
                    <div class="fh5co-contact-info">
                        <h3>Sua Viagem</h3>
                        <ul>
                            <li class="cidOrigem"> <b>Origem:</b> Salvador</li>
                            <li class="cidDestino"> <b>Destino:</b> São Paulo </li>
                            <li class="tipoPassagem"> <b>Tipo:</b> Apenas Ida / Ida e Volta</li>
                            <li class="dataHora"> <b>Data:</b> 28/08/2038</li>
                            <li class="cabine"> <b>Cabine:</b> Econômica / Primeira Classe</li>
                        </ul>
                    </div>
                </div>
                <!-- FINAL - Coluna da Esquerda -->

                <!-- INÍCIO - Coluna da Direita -->
                <div class="col-md-6 animate-box">
                    <h3>Detalhes da Transação</h3>
                    <form name="formulario" method="post" OnSubmit="return validaCompra()" action="minhasviagens.html">

                        <!-- INÍCIO - Linha 1 -->
                        <div class="row form-group">
                            <div class="col-md-7">
                                <b>Forma de Pagamento</b>
                                <div style="margin-top:15px">
                                    <input 
                                        type="radio" 
                                        value="p" 
                                        OnChange="validaFormaPagamento()" 
                                        name="formapag" 
                                        id="parcelado" 
                                        checked
                                    enabled>
                                    <label for="parcelado" style="font-weight:normal;">Parcelado</label>

                                    <input 
                                        style="margin-left:15px;" 
                                        type="radio" 
                                        value="av" 
                                        OnChange="validaFormaPagamento()" 
                                        name="formapag" 
                                        id="avista"
                                    enabled>
                                    <label for="avista" style="font-weight:normal;">À Vista</label>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <b>Valor Total</b><br>
                                <input 
                                    type="text" 
                                    name="valor" 
                                    class="form-control"
                                disabled>
                            </div>
                        </div>
                        <!-- FINAL - Linha 1 -->

                        <!-- INÍCIO - Linha 2 -->
                        <div class="row form-group">
                            <div class="col-md-3">
                                <b>Parcelas</b><br>
                                <input 
                                    type="Number" 
                                    name="qtdparcelas" 
                                    id="qtdparcelas" 
                                    OnChange="validaParcela()" 
                                    class="form-control" 
                                    value="1"
                                enabled>
                            </div>

                            <div class="col-md-4">
                                <b>Valor Parcelas</b><br>
                                <input 
                                    type="text" 
                                    name="valparcelas" 
                                    id="valparcelas" 
                                    class="form-control"
                                disabled>
                            </div>

                            <div class="col-md-5">
                                <b>Data Vencimento</b><br>
                                <input 
                                    type="Date" 
                                    name="vencimento"
                                    id="vencimento" 
                                    class="form-control"
                                    required
                                enabled>
                            </div>
                        </div>
                        <!-- FINAL - Linha 2 -->

                        <!-- INÍCIO - Linha 3 -->
                        <div class="form-group" style="margin-top:30px;">
                            <center>
                                <!-- Botão Confirmar -->
                                <input 
                                    type="submit" 
                                    value="Confirmar Compra" 
                                    class="btn btn-primary"
                                enabled>

                                <!-- Botão Cancelar -->
                                <input 
                                    type="button" 
                                    value="Cancelar" 
                                    class="btn btn-primary" 
                                    OnClick="cancelar()"
                                enabled>
                            </center>
                        </div>
                        <!-- FINAL - Linha 3 -->
                    </form>		
                </div>
                <!-- FINAL - Coluna da Direita -->

            </div>

        </div>
    </div>
<!-- FINAL ~ Conteúdo do Corpo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

        <%@include file="include/footer.jsp" %>
    </div>
    
    <script type="text/javascript">
        formulario.valor.value = numberToReal("308");
        formulario.valparcelas.value = formulario.valor.value;
    </script>
    
    <%@include file="include/footscripts.jsp" %>
    </body>
</html>