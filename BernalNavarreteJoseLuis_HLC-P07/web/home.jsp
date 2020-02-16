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
        <title>JSP Page</title>
    </head>
    <body>
        <a href="logout">Logout</a>
        <%
            Cuenta user = (Cuenta) session.getAttribute("user");
        %>
        <h1>Bienvenido <%= user.getUsuario() %></h1>
    </body>
</html>
