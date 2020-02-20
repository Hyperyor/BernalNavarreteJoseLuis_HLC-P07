<%-- 
    Document   : escritores
    Created on : 19-feb-2020, 18:46:11
    Author     : alumno
--%>

<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/autores.css">
        <title>Escritores</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp"></jsp:include>
        </header>
        
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
                                
                                %>
                            <%
                                JsonArray listaEscritores = (JsonArray)request.getAttribute("autores");

                                for (int i = 0; i < listaEscritores.size(); i++) {
                                        autor = listaEscritores.get(i).getAsJsonObject();

                                        id = autor.get("id").getAsJsonObject();
                                        
                                        url = "consultaAutor?codigo=" + id.get("codigoAutor").getAsString() + "&isbn=" + id.get("isbn").getAsString();
                                        //System.out.println("\n" + id.get("codigoAutor").getAsString());
                                    
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
                        
            
  
        </section>
        
    </body>
</html>
