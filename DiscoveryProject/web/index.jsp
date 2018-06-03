<%@page import="controller.Index"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Carregar lista de cidades cadastradas.
    Object[] lst = Index.carregarListaCidades();
    
    // Extrair elementos do objeto.
    int[] id        = (int[]) lst[0];
    String[] cidade = (String[]) lst[1];
%>

<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>
        
        <script type="text/javascript">
            function pegouFoco(campo)
            {
                campo.style.opacity = 1;
            }
            
            function perdeuFoco(campo)
            {
                campo.style.opacity = 0.8;
            }
            
            function validaPesquisa()
            {
                if ( pesquisavoo.origem.value == pesquisavoo.destino.value )
                {
                    alert("FALHA!\nVocê deve selecionar cidades diferentes.");
                    return( false );
                }
                
                return( true );
            }
            
            function validaTipoViagem()
            {
                if ( pesquisavoo.tipo.value == "2" )
                {
                    pesquisavoo.data_volta.disabled = true;
                    pesquisavoo.data_volta.required = false;
                }
                else
                {
                    pesquisavoo.data_volta.disabled = false;
                    pesquisavoo.data_volta.required = true;
                }                    
            }
        </script>
        
        <style type="text/css">
            select {
                opacity: 0.8;
            }
                       
            input[type="date"] {
                opacity: 0.8;
            }
            
            input[type="date"]:disabled{
                opacity: 0.8;
            }
            
            input[type="radio"] {
                border: 0px;
                width: 80%;
                height:20px;
            }
            
            label {
                color:#1c1c1c;
                font-size:11px;
            }
            
            #painel_pesquisavoo {
                background-color:rgba(41, 173, 196, 0.7); 
                padding: 20px 5px 20px 5px;
            }
        </style>
    </head>
    
    <body>
    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="include/navbar.jsp" %>

        <header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/index/capa.png);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="display-t" style="margin-top:-50px;" >
                            <div class="display-tc animate-box" data-animate-effect="fadeIn">
                                <h1 style="font-size:44px;">Embarque em uma Aventura</h1>
                                <h2>Suas ferias esperam por você!</h2>
                                
                                <div class="row" id="painel_pesquisavoo">
                                    <form action="IndexPesquisaVoo" OnSubmit="return validaPesquisa()" method="post" name="pesquisavoo" class="form-inline" >
                                        <div class="row form-group">
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Cidade de Origem</label>
                                                <select 
                                                    class="form-control" 
                                                    onfocusin="pegouFoco(this)" 
                                                    onfocusout="perdeuFoco(this)" 
                                                    name="origem"
                                                    required
                                                enabled>
                                                    <option value="">Escolher...</option>
                                                    <% for (int i=0; i< id.length; i++ ){ %>
                                                    <option value="<%=id[i] %>"><%=cidade[i] %></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Cidade de Destino</label>
                                                <select 
                                                    class="form-control" 
                                                    onfocusin="pegouFoco(this)" 
                                                    onfocusout="perdeuFoco(this)" 
                                                    name="destino"
                                                    required
                                                enabled>
                                                    <option value="">Escolher...</option>
                                                    <% for (int i=0; i< id.length; i++ ){ %>
                                                    <option value="<%=id[i] %>"><%=cidade[i] %></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="row form-group">
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Tipo de Viagem</label>
                                                <table>
                                                    <col width="35px">
                                                    <col width="115px">
                                                    <col width="35px">
                                                    <col width="115px">
                                                    
                                                    <tr height="50px">
                                                        <td>
                                                            <input 
                                                                type="radio" 
                                                                name="tipo" 
                                                                id="ida_volta"
                                                                OnChange="validaTipoViagem()"
                                                                value="1"
                                                                checked
                                                            enabled>
                                                        </td>
                                                        <td>
                                                            <label style="font-size:14px;color:#222222;" for="ida_volta">Ida & Volta</label>
                                                        </td>
                                                        <td>
                                                            <input 
                                                                type="radio" 
                                                                name="tipo" 
                                                                id="apenas_ida"
                                                                OnChange="validaTipoViagem()"
                                                                value="2"
                                                            enabled>
                                                        </td>
                                                        <td>
                                                            <label style="font-size:14px;color:#222222;" for="apenas_ida">Apenas Ida</label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Cabine do Avião</label>
                                                <select 
                                                    class="form-control" 
                                                    onfocusin="pegouFoco(this)" 
                                                    onfocusout="perdeuFoco(this)" 
                                                    name="cabine"
                                                    required
                                                enabled>
                                                    <option value="">Escolher...</option>
                                                    <option value="1">Econômica</option>
                                                    <option value="2">Primeira Classe</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="row form-group">
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Data de Ida</label>
                                                <input 
                                                    type="date" 
                                                    name="data_ida" 
                                                    class="form-control"
                                                    onfocusin="pegouFoco(this)" 
                                                    onfocusout="perdeuFoco(this)"
                                                    required
                                                enabled>
                                            </div>
                                            
                                            <div class="col-md-6" style="text-align:left;">
                                                <label>Data da Volta</label>
                                                <input 
                                                    type="date" 
                                                    name="data_volta" 
                                                    class="form-control"
                                                    onfocusin="pegouFoco(this)" 
                                                    onfocusout="perdeuFoco(this)"
                                                    required
                                                enabled>
                                            </div>
                                        </div>
                                            
                                        <button 
                                            type="submit" 
                                            class="btn btn-default"
                                        enabled>
                                            <i class="icon-search"></i> Buscar Voo
                                        </button>
                                    </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div id="fh5co-services" class="fh5co-bg-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="feature-center animate-box" data-animate-effect="fadeIn">
                            <span class="icon">
                                <i class="icon-rocket"></i>
                            </span>
                            <h3>Rapidez</h3>
                            <p>Vá mais rápido viajando conosco. Nossos vôos não realizam paradas durante o percurso.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="feature-center animate-box" data-animate-effect="fadeIn">
                            <span class="icon">
                                <i class="icon-mobile"></i>
                            </span>
                            <h3>Conforto</h3>
                            <p>Conosco você viaja com o total conforto de aeronaves modernas, dispondo de hotspots de altíssimas velocidades.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 text-center">
                        <div class="feature-center animate-box" data-animate-effect="fadeIn">
                            <span class="icon">
                                <i class="icon-price-tag"></i>
                            </span>
                            <h3>Preço</h3>
                            <p><i>"A melhor opção em relação de custo/benéficio em viagens nacionais no ano de 2037."</i> <b>UOL Viagem, 2038.</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="fh5co-project">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <span>Gostaria de viver experiências inesquecíveis?</span>
                        <h2>Conheça as Praias do Nordeste do Brasil</h2>
                        <p>Expiremente, Vivencie, Conheça. Agora é tempo.</p>
                    </div>
                </div>
            </div>
            <div class="project-content">
                <div class="col-half">
                    <div class="project animate-box" style="background-image:url(images/index/promo_1_bahia.png);">
                        <div class="desc">
                            <span>Bahia</span>
                            <h3>Morro de São Paulo</h3>
                        </div>
                    </div>
                </div>
                <div class="col-half">
                    <div class="project-grid animate-box" style="background-image:url(images/index/promo_2_ceara.png);">
                        <div class="desc">
                            <span>Ceará</span>
                            <h3>Jijoca de Jericoacoara</h3>
                        </div>
                    </div>
                    <div class="project-grid animate-box" style="background-image:url(images/index/promo_3_pernambuco.png);">
                        <div class="desc">
                            <span>Pernambuco</span>
                            <h3>Olinda</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/footscripts.jsp" %>
    </body>
</html>


