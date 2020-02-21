<%--
    Document   : home
    Created on : 16-feb-2020, 22:59:58
    Author     : Hyperior
--%>

<%@page import="entidades.Cuenta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Home</title>
    </head>
    <body>

        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
        </header>
        
        <jsp:useBean id="control" class="beans.controlSesion" />
        
            <%
                System.out.println("\n" + control.getId());
                System.out.println("\n" + session.getId());
                if(control.getId() != session.getId())
                {
                    %>
                    <jsp:forward page="logout"/>
                    <%
                }
                %>

        <section class="content">
            
            <jsp:useBean id="clock" class="beans.JspCalendar" />

            <%
                //Calendar fecha = Calendar.getInstance();
                int dia = clock.getDayOfMonth();
                int mes = clock.getMonthInt();
                int anio = clock.getYear();
            %>
            
            <div class="overlay"></div>
            <div class="container">
                <div class="description ">
                     
                    <%
                        Cuenta user = (Cuenta) session.getAttribute("user");
                    %>
                    <h1>¡Hola <%= user.getUsuario()%>!</h1>
                    <br/>
                    <h2>    Bienvenido a la práctica 7 de Jose Luis Bernal
                      <p>   En esta ocasión, mezclaremos un poco de jsp y
                            servlet, usando hibernate y derby para la persistencia
                            de datos de tu biblioteca personal.
                      </p>

                    </h2>  
                    <br/>
                    <br/>
                    <h5 class="text-center py-4 font-bold font-up danger-text">Hoy es <%= dia%> del <%= mes%> de <%= anio%></h5>
                </div>
            </div>
            
            

           

            


            <!--<a href="logout">Logout</a>-->
            

        </section>
    </body>
</html>
