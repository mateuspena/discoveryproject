<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else if ( request.getSession().getAttribute("COMPRA")==null) { %>
<script>location.href = "index.jsp";</script>
<% } else { %>
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
                if ( formulario.vencimento.value == "" )
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
            
            function validaDigito(obj)
            {
                if ( obj.value <= 0 || obj.value > 999 ) 
                {
                    alert("ATENÇÃO!\n\nO dígito verificador do cartão informado é inválido.");
                    obj.value = "";
                }
                else if ( obj.value < 10 ) obj.value = "00" + parseInt(obj.value);
                else if ( obj.value < 100 ) obj.value = "0" + parseInt(obj.value);
                else obj.value = parseInt(obj.value);
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
                                    <b>Número Cartão</b>
                                    <input 
                                        type="text" 
                                        OnKeyPress="formatarCartao(this)"
                                        name="cardnum" 
                                        class="form-control"
                                        maxlength="19"
                                        required
                                    enabled>
                                </div>
                                
                                <div class="col-md-5">
                                    <b>Dígito Cartão</b><br>
                                    <input 
                                        type="Number" 
                                        name="carddig" 
                                        onFocusOut="validaDigito(this)"
                                        class="form-control"
                                        min="1"
                                        max="999"
                                        required
                                    enabled>
                                </div>
                            </div>
                            <!-- FINAL - Linha 1 -->                           
                            
                            <!-- INÍCIO - Linha 2 -->
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
                            <!-- FINAL - Linha 2 -->

                            <!-- INÍCIO - Linha 3 -->
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
                            <!-- FINAL - Linha 3 -->

                            <!-- INÍCIO - Linha 4 -->
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
                            <!-- FINAL - Linha 4 -->
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

<% } %>