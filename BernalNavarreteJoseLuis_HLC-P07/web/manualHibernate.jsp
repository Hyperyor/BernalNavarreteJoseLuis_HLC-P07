<%-- 
    Document   : manualHibernate
    Created on : 21-feb-2020, 16:23:21
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="appManual">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
        <script src="js/jsonexterno.js"></script>
        <title>JSP Page</title>
    </head>
    <body ng-controller="primerControlador">
    
            
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
        
        <section class=""container">
            <div class="table-responsive">
                <table class="table table-hover table-dark">
                    <thead>
                        <tr>
                        <th scope="col">Tecnologia</th>
                        <th scope="col">Version 6.0</th>
                        <th scope="col">Version 5.4</th>
                        <th scope="col">Version 5.3</th>
                        <th scope="col">Version 5.2</th>
                        <th scope="col">Version 5.1</th>
                        <th scope="col">Version 5.0</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="obj in listaJson">
                            <th scope="row">{{obj.tecnologia}}</th>
                            <th scope="row">{{obj.version60}}</th>
                            <th scope="row">{{obj.version54}}</th>
                            <th scope="row">{{obj.version53}}</th>
                            <th scope="row">{{obj.version52}}</th>
                            <th scope="row">{{obj.version51}}</th>
                            <th scope="row">{{obj.version50}}</th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
