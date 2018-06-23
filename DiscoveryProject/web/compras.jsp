<%@page import="negocio.Functions.MyDataHora"%>
<%@page import="negocio.Cidade"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if ( request.getSession().getAttribute("cliente")==null ){ %>
<script>location.href = "index.jsp";</script>
<% } else if ( request.getSession().getAttribute("COMPRA")==null) { %>
<script>location.href = "index.jsp";</script>
<% } else { %>
<%
    // Carregar dados da pesquisa.
    HashMap<String, Object> COMPRA = (HashMap<String, Object>) request.getSession().getAttribute("COMPRA");
    
    int TipoViagem  = Integer.parseInt( COMPRA.get("TipoViagem").toString() );
    int Cabine      = Integer.parseInt( COMPRA.get("Cabine").toString() );
    String cOrigem  = ((Cidade) COMPRA.get("CidadeOrigem")).getCidade();
    String cDestino = ((Cidade) COMPRA.get("CidadeDestino")).getCidade();
    String DataIda      = (String) COMPRA.get("DataIda");
    String DataVolta    = (String) COMPRA.get("DataVolta");
    Object[] Ida    = ((Object[]) COMPRA.get("Ida"));
    Object[] Volta  = ((Object[]) COMPRA.get("Volta"));
    
    // Calcular valor total da compra.
    float ValorIda      = Float.parseFloat( Ida[1].toString() );
    float ValorVolta    = ( Volta!=null ) ? Float.parseFloat( Volta[1].toString() ) : 0.0f;
        
    // Formatar dados para exibição.
    DataIda     = MyDataHora.toDateFormat( DataIda );
    DataVolta   = ( DataVolta!=null ) ? MyDataHora.toDateFormat( DataVolta ) : DataVolta;
%>
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
            
            .fh5co-contact-info ul li.valor:before {
              font-size: 23px;
              content: "\e9fb";
            }
        </style>

        <script type="text/javascript">       
            function validaFormaPagamento(flag)
            {
                if ( flag == 1 ) {
                    if ( formulario.Ida_FormaPagamento.value == "p" )
                        formulario.Ida_QtdParcelas.disabled = false;
                    else
                    {
                        formulario.Ida_QtdParcelas.value = 1;
                        formulario.Ida_ValorParcelas.value = formulario.Ida_Valor.value;
                        formulario.Ida_QtdParcelas.disabled = true;
                    }
                }
                else {
                    if ( formulario.Volta_FormaPagamento.value == "p" )
                        formulario.Volta_QtdParcelas.disabled = false;
                    else
                    {
                        formulario.Volta_QtdParcelas.value = 1;
                        formulario.Volta_ValorParcelas.value = formulario.Volta_Valor.value;
                        formulario.Volta_QtdParcelas.disabled = true;
                    }
                }
            }

            function validaParcela(flag)
            {
                if ( flag == 1 ) 
                {
                    var qtdparcelas = formulario.Ida_QtdParcelas.value;
        
                    if (qtdparcelas == "")
                        formulario.Ida_QtdParcelas.value = 1;
                    else if ( qtdparcelas > 10 || qtdparcelas == 0 )
                        formulario.Ida_QtdParcelas.value = 1;
                    else if ( qtdparcelas > -1 && qtdparcelas < 1 )
                        formulario.Ida_QtdParcelas.value = 1;
                    else
                    {
                        // é ponto flutuante?
                        if ( qtdparcelas != parseFloat(qtdparcelas).toFixed(0) )
                            qtdparcelas = parseFloat(qtdparcelas).toFixed(0);

                        if ( qtdparcelas < 0 )
                            formulario.Ida_QtdParcelas.value = qtdparcelas * -1;
                    }

                    var valor = realToNumber( formulario.Ida_Valor.value );
                    formulario.Ida_ValorParcelas.value = numberToReal( valor / formulario.Ida_QtdParcelas.value ); 
                }
                else
                {
                    var qtdparcelas = formulario.Volta_QtdParcelas.value;
        
                    if (qtdparcelas == "")
                        formulario.Volta_QtdParcelas.value = 1;
                    else if ( qtdparcelas > 10 || qtdparcelas == 0 )
                        formulario.Volta_QtdParcelas.value = 1;
                    else if ( qtdparcelas > -1 && qtdparcelas < 1 )
                        formulario.Volta_QtdParcelas.value = 1;
                    else
                    {
                        // é ponto flutuante?
                        if ( qtdparcelas != parseFloat(qtdparcelas).toFixed(0) )
                            qtdparcelas = parseFloat(qtdparcelas).toFixed(0);

                        if ( qtdparcelas < 0 )
                            formulario.Volta_QtdParcelas.value = qtdparcelas * -1;
                    }

                    var valor = realToNumber( formulario.Volta_Valor.value );
                    formulario.Volta_ValorParcelas.value = numberToReal( valor / formulario.Volta_QtdParcelas.value );
                }
                
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
                                <li class="cidOrigem"><b>Origem: </b><%= cOrigem %></li>
                                <li class="cidDestino"><b>Destino: </b><%= cDestino %></li>
                                <li class="tipoPassagem"><b>Tipo: </b><% if (TipoViagem==1) out.print("Ida & Volta"); else out.print("Apenas Ida"); %></li>
                                <li class="cabine"><b>Cabine: </b><% if (Cabine==1) out.print("Econômica"); else out.print("Primeira Classe"); %></li>
                                <li class="dataHora"><b>Data de Ida: </b><%= DataIda %></li>
                                <li class="valor"><b>Valor Ida: </b><script>document.write(numberToReal(<%= ValorIda %>))</script></li>
                                <% if ( TipoViagem == 1 ) {%>
                                <li class="dataHora"> <b>Data da Volta: </b><%=DataVolta %></li>
                                <li class="valor"><b>Valor Volta: </b><script>document.write(numberToReal(<%= ValorVolta %>))</script></li>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                    <!-- FINAL - Coluna da Esquerda -->

                    <!-- INÍCIO - Coluna da Direita -->
                    <div class="col-md-6 animate-box">
                        <h3>Detalhes da Transação</h3>
                        <form name="formulario" method="post" action="ConfirmaCompra">

                            <!-- INÍCIO - Linha 1 -->
                            <div class="row form-group">
                                <div class="col-md-7">
                                    <b>Número Cartão</b>
                                    <input 
                                        type="text" 
                                        OnKeyPress="formatarCartao(this)"
                                        name="NumCartao" 
                                        class="form-control"
                                        maxlength="19"
                                        required
                                    enabled>
                                </div>
                                
                                <div class="col-md-5">
                                    <b>Dígito Cartão</b><br>
                                    <input 
                                        type="Number" 
                                        name="CodCartao" 
                                        onFocusOut="validaDigito(this)"
                                        class="form-control"
                                        min="1"
                                        max="999"
                                        required
                                    enabled>
                                </div>
                            </div>
                            <!-- FINAL - Linha 1 -->                           
                            
                            <div style="background-color:#f9f9f9; padding: 10px 10px 10px 10px;">
                                <!-- INÍCIO - Linha 2 -->
                                <div class="row form-group">
                                    <div class="col-md-7">
                                        <b>Forma de Pagamento <% if( TipoViagem == 1 ){ out.println("(Ida)"); } %></b>
                                        <div style="margin-top:15px">
                                            <input 
                                                type="radio" 
                                                value="p" 
                                                OnChange="validaFormaPagamento(1)" 
                                                name="Ida_FormaPagamento" 
                                                id="Ida_Parcelado" 
                                                checked
                                            enabled>
                                            <label for="Ida_Parcelado" style="font-weight:normal;">Parcelado</label>

                                            <input 
                                                style="margin-left:15px;" 
                                                type="radio" 
                                                value="av" 
                                                OnChange="validaFormaPagamento(1)" 
                                                name="Ida_FormaPagamento" 
                                                id="Ida_Avista"
                                            enabled>
                                            <label for="Ida_Avista" style="font-weight:normal;">À Vista</label>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <b>Data Vencimento</b><br>
                                        <input 
                                            type="Date" 
                                            name="Ida_DataVencimento"
                                            id="Ida_DataVencimento" 
                                            class="form-control"
                                            required
                                        enabled>
                                    </div>
                                </div>
                                <!-- FINAL - Linha 2 -->

                                <!-- INÍCIO - Linha 3 -->
                                <div class="row form-group">
                                    <div class="col-md-3">
                                        <b>Parcelas</b><br>
                                        <input 
                                            type="Number" 
                                            name="Ida_QtdParcelas" 
                                            id="Ida_QtdParcelas" 
                                            OnChange="validaParcela(1)" 
                                            class="form-control" 
                                            value="1"
                                        enabled>
                                    </div>

                                    <div class="col-md-4">
                                        <b>Valor Parcelas</b><br>
                                        <input 
                                            type="text" 
                                            name="Ida_ValorParcelas" 
                                            id="Ida_ValorParcelas" 
                                            class="form-control"
                                        disabled>
                                    </div>


                                    <div class="col-md-5">
                                        <b>Valor Total</b><br>
                                        <input 
                                            type="text" 
                                            name="Ida_Valor" 
                                            class="form-control"
                                        disabled>
                                    </div>
                                </div>
                                <!-- FINAL - Linha 3 -->
                            </div>
                                        
                            
                            <% if ( TipoViagem == 1 ) { %>
                            <div style="margin-top: 10px; background-color:#f9f9f9; padding: 10px 10px 10px 10px;">
                                <!-- INÍCIO - Linha 2b -->
                                <div class="row form-group">
                                    <div class="col-md-7">
                                        <b>Forma de Pagamento <% if( TipoViagem == 1 ){ out.println("(Volta)"); } %></b>
                                        <div style="margin-top:15px">
                                            <input 
                                                type="radio" 
                                                value="p" 
                                                OnChange="validaFormaPagamento(2)" 
                                                name="Volta_FormaPagamento" 
                                                id="Volta_Parcelado" 
                                                checked
                                            enabled>
                                            <label for="Volta_Parcelado" style="font-weight:normal;">Parcelado</label>

                                            <input 
                                                style="margin-left:15px;" 
                                                type="radio" 
                                                value="av" 
                                                OnChange="validaFormaPagamento(2)" 
                                                name="Volta_FormaPagamento" 
                                                id="Volta_Avista"
                                            enabled>
                                            <label for="Volta_Avista" style="font-weight:normal;">À Vista</label>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <b>Data Vencimento</b><br>
                                        <input 
                                            type="Date" 
                                            name="Volta_DataVencimento"
                                            id="Volta_DataVencimento" 
                                            class="form-control"
                                            required
                                        enabled>
                                    </div>
                                </div>
                                <!-- FINAL - Linha 2b -->

                                <!-- INÍCIO - Linha 3b -->
                                <div class="row form-group">
                                    <div class="col-md-3">
                                        <b>Parcelas</b><br>
                                        <input 
                                            type="Number" 
                                            name="Volta_QtdParcelas" 
                                            id="Volta_QtdParcelas" 
                                            OnChange="validaParcela(2)" 
                                            class="form-control" 
                                            value="1"
                                        enabled>
                                    </div>

                                    <div class="col-md-4">
                                        <b>Valor Parcelas</b><br>
                                        <input 
                                            type="text" 
                                            name="Volta_ValorParcelas" 
                                            id="Volta_ValorParcelas" 
                                            class="form-control"
                                        disabled>
                                    </div>


                                    <div class="col-md-5">
                                        <b>Valor Total</b><br>
                                        <input 
                                            type="text" 
                                            name="Volta_Valor" 
                                            class="form-control"
                                        disabled>
                                    </div>
                                </div>
                                <!-- FINAL - Linha 3b -->
                            </div>
                            <% } %>
                                        

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
                                        OnClick="toPageIndex()"
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
        formulario.Ida_Valor.value = numberToReal("<%= ValorIda %>"); 
        formulario.Ida_ValorParcelas.value = formulario.Ida_Valor.value;
        <% if ( TipoViagem == 1 ) { %>
        formulario.Volta_Valor.value = numberToReal("<%= ValorVolta %>"); 
        formulario.Volta_ValorParcelas.value = formulario.Volta_Valor.value;
        <% } %>
    </script>
    
    <%@include file="include/footscripts.jsp" %>
    </body>
</html>

<% } %>