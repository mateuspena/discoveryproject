<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <%@include file="include/header.jsp" %>
        <title>Login: Discovery Linhas Aéreas &mdash; Viaje com rápidez, conforto e preço!</title>

        <script type="text/javascript">
            function validarLogin(){
                if ( login.cpf.value=="" || login.senha.value=="" )
                {
                    alert("Por favor, preencha todos os campos obrigatórios!");
                    return( false );
                }

                return( true );
            }
        </script>

        <style>
            #mylink {
                color: #dddddd;
            }

            #mylink:hover {
                color: #ffffff;
                text-decoration: underline;
            }
        </style>
    </head>
    
    <body>
    <div class="fh5co-loader"></div>

    <div id="page">
        <div id="fh5co-started">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Conecte-se!</h2>
                    </div>
                </div>

                <div class="row animate-box">
                    <!-- INÍCIO - Formulário de Login -->
                    <form name="login" method="post" OnSubmit="return validarLogin()" action="AcessoPerfil" class="form-inline">
                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="cpf" style="color:#efefef">CPF</label>

                                <!-- Campo CPF -->
                                <input 
                                    type="text" 
                                    name="cpf" 
                                    id="cpf" 
                                    class="form-control" 
                                    OnKeyDown="fMasc(this, mCPF)"
                                    placeholder="Cpf (Ex.: 999.999.999-99)"
                                    required
                                enabled>
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-2" style="margin-bottom:15px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <label for="senha" style="color:#efefef">Senha</label>

                                <!-- Campo Senha -->
                                <input 
                                    type="Password" 
                                    name="senha" 
                                    id="senha" 
                                    class="form-control" 
                                    placeholder="●●●●●●●●"
                                    required
                                enabled>
                            </div>
                        </div>

                        <div class="col-md-8 col-md-offset-2">
                            <div class="col-md-6 col-md-offset-3 col-sm-6">
                                <p><input type="submit" class="btn btn-default btn-block">Login</p>
                                <p>
                                    <a href="#" onClick="toPageCadastrar()" id="mylink">Criar meu cadastro.</a>
                                </p>
                            </div>
                        </div>
                    </form>
                    <!-- FINAL - Formulário de Login -->
                </div>
            </div>
        </div>
<!-- FINAL ~ Conteiner Formulário ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
        <%@include file="include/footer.jsp" %>
    </div>

    <%@include file="include/footscripts.jsp" %>
    </body>
</html>