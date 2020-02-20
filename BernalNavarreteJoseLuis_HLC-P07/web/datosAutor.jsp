<%-- 
    Document   : datosAutor
    Created on : 20-feb-2020, 1:36:58
    Author     : Hyperior
--%>

<%@page import="entidades.Autor"%>
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
        
        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
            
            
        </header>
        
        <div class="overlay"></div>
        
        <%!
            Autor t;
            String urlVovler;
            String urlUpdate;
            String updateCorrecto;
            %>
        <%
            t = (Autor) request.getAttribute("autor");
            urlVovler = "consultasEscribe?isbn=" + request.getAttribute("isbn").toString();
            urlUpdate = "consultaAutor?codigo=" + t.getCodigo() + "&update=si" + "&isbn="+request.getAttribute("isbn").toString();
            
            try
            {
                updateCorrecto = request.getAttribute("updateCorrecto").toString();
            }
            catch(Exception ex)
            {
                updateCorrecto = "no";
            }
            
            if(updateCorrecto.equals("no"))
            {
                %>
                
                <h1>Error al modificar</h1>
                
                <%
                    
            }

            %>
        
        <section id="formulario">
            
            <div class="row">
                <!-- Grid column -->
                <div class="mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <!-- Form contact -->
                            <form method="post" action=<%= urlUpdate %>>
                                <h2 class="text-center py-4 font-bold font-up danger-text">Datos del autor</h2>

                                <div class="md-form">

                                    <h5 class="text-center" >Nombre</h5>
                                    <i class="fa fa-user prefix grey-text"></i>
                                    <input type="text" name="nombre" value="<%= t.getNombre() %>" class="form-control">

                                </div>
                                <div class="md-form">

                                    <h5 class="text-center" >Código</h5>
                                    <i class="fa fa-barcode prefix grey-text"></i>
                                    <input type="text" name="codigo" value="<%= t.getCodigo() %>" class="form-control " disabled="disabled">

                                </div>
                                <div class="md-form">

                                    <h5 class="text-center" >Beneficio</h5>
                                    <i class="fa fa-percent prefix grey-text"></i>
                                    <input type="text" id="beneficio" name="beneficio" value="<%= t.getPorcentajeBeneficio() %>" class="form-control ">

                                </div>
                                    
                                     <input class="btn btn-danger form-control" type="submit" value="Modificar">  

                            </form>
                            <!-- Form contact -->
                          
                            
                        </div>
                        <a class="btn btn-primary" href= <%= urlVovler %> > <-- Volver </a>
                    </div>              
                </div>
                                    
            </div>
                                    

        </section>
    </body>
</html>
