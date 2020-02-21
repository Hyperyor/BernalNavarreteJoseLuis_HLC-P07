<%-- 
    Document   : escritores
    Created on : 19-feb-2020, 18:46:11
    Author     : alumno
--%>

<%@page import="entidades.Autor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/autores.css">
        <title>Escritores</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
        
        <section class="container">

            <section id="Datos">
                <div class="table-responsive">
                    <table class="table table-hover table-dark">
                        <thead>
                            <tr>
                                <th scope="col">ISBN</th>
                                <th scope="col">Código autor</th>
                                <th scope="col">Número de autor del libro</th>
                                <th scope="col">Beneficio del autor</th>
                                <th scope="col">Información del autor</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%!
                                JsonObject id;
                                JsonObject autor;
                                String url;
                                String urlInsertar;
                                List<Autor> listadoNoParticipantes;
                                String isbn;
                                int cont = 0;
                                String insercion = "";
                                %>
                            <%
                                cont = 0;
                                 if(request.getAttribute("insercion") != null)
                                {
                                    insercion = request.getAttribute("insercion").toString();

                                }
                                
                                listadoNoParticipantes = (List<Autor>) request.getAttribute("noParticipantes");
                                JsonArray listaEscritores = (JsonArray)request.getAttribute("autores");
                                
                                for (int i = 0; i < listaEscritores.size(); i++) {
                                        autor = listaEscritores.get(i).getAsJsonObject();

                                        id = autor.get("id").getAsJsonObject();
                                        cont++;
                                        isbn = id.get("isbn").getAsString();
                                        url = "consultaAutor?codigo=" + id.get("codigoAutor").getAsString() + "&update=no" + "&isbn=" + id.get("isbn").getAsString();
                                        //System.out.println("\n" + id.get("codigoAutor").getAsString());
                                        //urlInsertar = "prepararInsercion?isbn=" + id.get("isbn").getAsString() + "&autores=" + request.getAttribute("autores");
                            %>
                            <tr>
                                <th scope="row"><%= id.get("isbn").getAsString() %></th>
                                <td><%= id.get("codigoAutor").getAsString() %></td>
                                <td><%= id.get("numero").getAsString() %></td>
                                <td><%= autor.get("beneficioAutor").getAsString() %></td>
                                <td><a href="<%= url %>">Ver datos autor</a></td>
                            <tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                        
                <a class="btn btn-primary" href="consultaLibros" > <-- Volver </a>
            </section>
        
            
            <%
                if(!listadoNoParticipantes.isEmpty())
                {
                    urlInsertar = "insertarAutor?isbn=" + isbn + "&cantidad=" + (cont + 1);
                    %>
                <section id="formulario">

                    <div class="row">
                        <!-- Grid column -->
                        <div class="mx-auto">
                            <div class="card">
                                <div class="card-body">
                                    <!-- Form contact -->
                                    <form method="post" action=<%= urlInsertar %>>
                                        <h2 class="text-center py-4 font-bold font-up danger-text">Añadir autor</h2>

                                        <div class="md-form">

                                            <h5 class="text-center" >ISBN</h5>
                                            
                                            <input type="text" name="isbnLibro" value="<%= isbn %>" class="form-control" disabled="disabled">

                                        </div>
                                        <div class="md-form">
                                            <br/>
                                            <h5 class="text-center" >Código del autor</h5>
                                            
                                            <select  name="codigo" class="btn btn-secondary dropdown-toggle dropdown-toggle-split form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" >
                                                <option disabled selected>Selecciona una opción</option>
                                                <%
                                                    for (int i = 0; i < listadoNoParticipantes.size(); i++) {
                                                        Autor t = listadoNoParticipantes.get(i);
                                                        %>
                                                        <option> <%= t.getCodigo() %> </option>
                                                        <%
                                                            
                                                        }
                                                    %>
    
                                            </select>
                                           

                                        </div>
                                        <div class="md-form">
                                            <br/>
                                            <h5 class="text-center" >Beneficio del autor</h5>
                                            
                                            <input type="text" id="beneficio" name="beneficio" value="" class="form-control ">

                                        </div>
                                             <br/>
                                             <input class="btn btn-danger form-control" type="submit" value="Insertar">  
                                             
                                             <%
                                                 if(!insercion.equals(""))
                                                 {
                                                     if(insercion.equals("correcta"))
                                                     {
                                                         %>
                                                         <br/>
                                                         <h6 class="text-center font-bold font-up danger-text" >Inserción realizada con éxito</h6>
                                                         <%
                                                     }
                                                     else
                                                     {
                                                         %>
                                                         <br/>
                                                         <h6 class="text-center font-bold font-up danger-text" >Inserción incorrecta</h6>
                                                         <%
                                                     }
                                                 }
                                                 %>

                                    </form>
                                    <!-- Form contact -->


                                </div>
                                
                            </div>              
                        </div>

                    </div>


                </section>
                    <%
                }
            %>
            
            
  
        </section>
        
    </body>
</html>
