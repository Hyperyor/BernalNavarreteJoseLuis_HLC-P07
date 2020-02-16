<%--
    Document   : login
    Created on : 16-feb-2020, 1:06:31
    Author     : Hyperior
--%>

<%@page import="java.util.List"%>
<%@page import="entidades.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/alta.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%! int correcto;%>
        <%
            if (session.getAttribute("inicio") != null) {
                correcto = Integer.parseInt(session.getAttribute("inicio").toString());

                if (correcto == 0) {

        %>
        <h1>Datos de usuario incorrectos</h1>
        <%                            }
            }
        %>

        <section id="formulario">
            <div class="row">
                <!-- Grid column -->
                <div class="mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <!-- Form contact -->
                            <form method="post" action="consultaLogin">
                                <h2 class="text-center py-4 font-bold font-up danger-text">Login</h2>

                                <div class="md-form">
                                    <i class="fa fa-user prefix grey-text"></i>
                                    <input id="user" type="text" name="user" class="form-control" placeholder="usuario">

                                </div>
                                <div class="md-form">
                                    <i class="fa fa-id-card prefix grey-text"></i>
                                    <input id="pass" type="text" name="pass" class="form-control" placeholder="contraseña">

                                </div>

                                <div class="text-center">
                                    <input type="submit" value="Consultar" class="btn btn-primary"
                                           <!--<a href="#" class="enlaceboton" onClick="comprobacion()">Enviar</a>
                                           <!--<button class="btn btn-outline-danger btn-lg">Send</button>-->
                                </div>
                            </form>
                            <!-- Form contact -->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
            List<Cuenta> data = (List<Cuenta>) session.getAttribute("resultado");

            if (data != null) {
                for (int i = 0; i < data.size(); i++) {

                    Cuenta c = (Cuenta) data.get(i);
                    System.out.println("\n" + c.getUsuario());
                    System.out.println("\n" + c.getPassword());
                }

            } else {

                System.out.println("\nEs nulo");
            }


        %>
    </body>
</html>
