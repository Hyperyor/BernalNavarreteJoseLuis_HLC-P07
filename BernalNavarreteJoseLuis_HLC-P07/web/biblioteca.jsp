<%-- 
    Document   : biblioteca
    Created on : 18-feb-2020, 1:08:35
    Author     : Hyperior
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/biblioteca.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Biblioteca</title>
    </head>
    <body >
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
        <section class="contenedor">
            <br/>
            <br/>
            <br/>
            <br/>

            <form method="post" action="consultaLibros">
                <div class="container">
                    <div class="row searchFilter" >
                       <div class="col-sm-12" >
                        <div class="input-group" >
                            <input id="table_filter" type="text" id="anio" name="anio" class="form-control" aria-label="Text input with segmented button dropdown" placeholder="Año por el que desea filtrar" >
                         <div class="input-group-btn" >
                          <select  name="orden" type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                <option disabled selected>Selecciona una opción</option>
                                <option>Ascendente</option>
                                <option>Descendente</option></select>
                          <button id="searchBtn" type="submit" class="btn btn-secondary btn-search" ><span class="fa fa-search" >&nbsp;</span> <span class="label-icon" >Buscar</span></button>
                         </div>
                        </div>
                       </div>
                    </div>
                </div>
            </form>

            <section id="imagenes">
                <%
                    List<Libro> libros = (List<Libro>) request.getAttribute("libros");

                    String filtro = request.getAttribute("filtro").toString();


                    if(filtro.equals("no")) //si no mostramos datos filtrados
                    {

                        %>
                        <!-------------------------------------------Clásicos------------------------------------------>
                        <section class="team">
                            <h1 class="text-center">Clásicos</h1> 
                            <div class="row  h-100 justify-content-center align-items-center"> 
                                <article class="container">
                        <%! int cont = 0; %>
                        <%

                        for (int i = 0; i < libros.size(); i++) {

                            LocalDate date =  LocalDate.parse(libros.get(i).getFechaPublicacion().toString());

                            if(date.getYear() < 2000)
                            {
                                String url = "consultasEscribe?isbn=" + libros.get(i).getIsbn();
                                cont++;
                                %>
                                <article>
                                    <div class="item">
                                        <img src="<%= libros.get(i).getPortada()%>" class="img-fluid rounded mx-auto d-block w-50 p-3" alt="<%= libros.get(i).getTitulo() %>">
                                        <div class="des">
                                            <a href=<%= url %>><%= libros.get(i).getTitulo() %></a>
                                            <span class="font-weight-bold"> <%= date.getYear() %> </span>
                                        </div>

                                    </div>
                                </article>

                                    <br/>
                                    <br/>
                                <%
                            }
                        }

                        if(cont == 0)
                        {
                            %>
                            <h2 class="text-center py-4 font-bold font-up danger-text">No existen libros en esta categoría para este usuario</h2>
                            <%

                        }

                        %>
                                </article>
                            </div>
                        </section>
                                
                        <!-------------------------------------------Modernos------------------------------------------>

                        <section class="team">
                            <h1 class="text-center">Modernos</h1> 
                            <div class="row h-100 justify-content-center align-items-center"> 
                                <article class="container">
                        <%

                            cont = 0;

                        for (int i = 0; i < libros.size(); i++) {

                            LocalDate date =  LocalDate.parse(libros.get(i).getFechaPublicacion().toString());

                            if(date.getYear() >= 2000)
                            {
                                String url = "consultasEscribe?isbn=" + libros.get(i).getIsbn();
                                cont++;
                                %>
                                <article>

                                    <div class=" item">
                                        <img src="<%= libros.get(i).getPortada()%>" class="img-fluid rounded mx-auto d-block w-50 p-3" alt="<%= libros.get(i).getTitulo() %>" >
                                        <div class="des">
                                            <a href=<%= url %>> <%= libros.get(i).getTitulo() %></a>
                                            <span class="font-weight-bold"> <%= date.getYear() %> </span>
                                        </div>

                                    </div>

                                </article>
                                <%
                            }
                        }

                        if(cont == 0)
                        {
                            %>
                            <h2 class="text-center py-4 font-bold font-up danger-text">No existen libros en esta categoría para este usuario</h2>
                            <%

                        }

                        %>
                                </article>
                            </div>
                        </section>


                        <!-------------------------------------------Filtrados------------------------------------------>
                        <%
                    }
                    else //si estamos mostrando datos filtrados (de un unico año)
                    {
                        if(libros.isEmpty())
                        {
                            %>
                            <h2 class="text-center py-4 font-bold font-up danger-text">No existen libros en esta categoría para este usuario</h2>
                            <%
                        }
                        else
                        {
                            LocalDate date = LocalDate.parse(libros.get(0).getFechaPublicacion().toString());
                            %>
                            <section class="team">
                                <h1 class="text-center"> <%= date.getYear() %> </h1> 
                                <div class="row  h-100 justify-content-center align-items-center"> 
                                    <article class="container">
                            <%
                                for (int i = 0; i < libros.size(); i++) {
                                    String url = "consultasEscribe?isbn=" + libros.get(i).getIsbn();
                                    %>
                                    <article>

                                        <div class=" item">
                                            <img src="<%= libros.get(i).getPortada()%>" class="img-fluid rounded mx-auto d-block w-50 p-3" alt="<%= libros.get(i).getTitulo() %>" >
                                            <div class="des">
                                                <a href=<%= url %>><%= libros.get(i).getTitulo() %></a>
                                                <span class="font-weight-bold"> <%= date.getYear() %> </span>
                                            </div>

                                        </div>

                                    </article>
                                        <%
                                    }
                                }

                                %>
                                    </article>
                                </div>
                            </section>
                                <%  
                        }


                %>
            </section>
        </section>
        </section>
    </body>
</html>
