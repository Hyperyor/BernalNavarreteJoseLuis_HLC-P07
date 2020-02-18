<%--
    Document   : navbar
    Created on : 18-feb-2020, 0:33:40
    Author     : Hyperior
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/nav.css">
        
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg fixed-top ">
                <a class="navbar-brand" href="home.jsp" >Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">     <ul class="navbar-nav mr-4">
                        <li class="nav-item">
                            <a class="nav-link" data-value="biblioteca" href="consultaLibros?=anio=0">Biblioteca</a>        </li>
                        <li class="nav-item">
                            <a class="nav-link " data-value="manual"href="">Manual hibernate</a>
                        </li>
                        <li class="nav-item">
                            
                            <a class="nav-link " data-value="logout"href="logout">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>
