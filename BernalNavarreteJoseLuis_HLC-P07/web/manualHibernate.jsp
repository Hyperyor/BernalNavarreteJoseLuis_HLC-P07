<%-- 
    Document   : manualHibernate
    Created on : 21-feb-2020, 16:23:21
    Author     : alumno
--%>

<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.stream.JsonReader"%>
<%@page import="com.google.gson.stream.JsonReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
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
        <link rel="stylesheet" type="text/css" href="css/hibernate.css">
        <title>Manual hibernate</title>
    </head>
    <body ng-controller="primerControlador">
    
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
        <%!
            JsonArray lista;
            %>
        <%
            URLConnection conexion= new URL("https://my-json-server.typicode.com/Hyperyor/hibernate/db").openConnection();

            JsonReader lector=new JsonReader(new InputStreamReader(conexion.getInputStream()));

            JsonParser parseador=new JsonParser();
            JsonElement raiz=parseador.parse(lector);

            Gson json=new Gson();


            JsonObject objeto=raiz.getAsJsonObject();
            lista=(JsonArray) objeto.get("compatibilidad");

        %>
        <section class="container">
            
            <article class="manual ">

                <!-- Title -->
                <h1 class="mt-4">Configuración de Hibernate para Netbeans</h1>

                <!-- Author -->
                <p class="lead">
                por
                <a href="#">Jose Luis Bernal Navarrete</a>
                </p>

                <hr>

                <!-- Date/Time -->
                <p>23/02/2020</p>

                <hr>

                <!-- Preview Image -->
                <img class="img-fluid rounded" src="imagenes/Hibernate_logo.png" alt="Hibernate">

                <br/>
                <hr>

                    <!-- Post Content -->
                    <p class="lead">¿Qué necesito para usar Hibernate? ¿Cómo lo uso? ¿Qué pasos hay que seguir?</p>

                    <p>Hibernate se ha convertido en uno de los frameworks más usados para persistencia de datos
                        en entornos web, y de forma muy merecida, ya que facilita en gran medida las
                        transacciones en las bases de datos de la servidor. En esta pequeña guía veremos
                        paso a paso cómo configurar hibernate en netbeans y un ejemplo de consulta.</p>

                    <br/>
                    <h3>Creación del proyecto</h3>

                    <p>En este primer paso, crearemos un proyecto web de java y, en la sección de frameworks disponibles seleccionaremos Hibernate,
                        junto al driver de la base de datos que deseemos usar (previamente creado).</p>
                    
                    <img class="img-fluid rounded " src="imagenes/paso1.jpg" alt="Creación de proyecto">
                    
                    <p>Una vez se termine de crear el proyecto, se nos abrirá una ventana de configuración de hibernate.
                        Comprobaremos que los datos de conexión a la base de datos son correctos y, en la sección
                        "Miscellaneous properties" añadimos un elemento "thread".</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso2.jpg" alt="Property">

                    <h3>Creación de las clases basadas en el modelos de la BD</h3>
                    
                    <p>A continuación crearemos un paquete y, dentro del paquete crearemos un elemento "Hibernate Reverse Engineering Wizard".</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso3.jpg" alt="Reverse Engineering">
                    
                    <p>En uno de los pasos para la creación de este archivo, nos aparecerán las tablas de la base de datos
                        con las que deseamos trabajar. Seleccionamos las tablas deseadas y continuamos.</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso4.jpg" alt="Tablas">
                    
                    <p>Por último, creamos un archivo "Hibernate Mapping files an POJO's from database". Se nos abrirá una 
                        ventana en la que debemos seleccionar "JDK 5 Language Features" y seleccionaremos finalizar.</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso5.jpg" alt="Creación clases">
                    
                    <p>Con esto, hibernate no creará clases en Java y archivos XML asociados con su estructura
                        en base a cada tabla seleccionada anteriormente de la BD.</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso6.jpg" alt="Clases">
                    
                    <br/>
                    
                    <h3>Acceso a la BD</h3>
                    
                    <p>Para poder acceder a las Bases de Datos mediante consultas, primero debemos crear un archivo "Hibernate Util".</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso7.jpg" alt="Hibernate Util">
                    
                    <h3>Consulta a BD</h3>
                    
                    <p>Una vez tenemos nuestro Hibernate Util creado, debemos crear una clase que tome la sesión actual
                        de Hibernate y posea un método que ejecute una consulta y devuelva los datos recibidos.</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso8.jpg" alt="Consulta">
                    
                    <p>Por último, creamos un servlet que nos sirva de intermediario entre la vista y los datos, es decir,
                        un servlet que será llamado por un archivo ".jsp", que creará una instancia de la clase creada
                        en el punto anterior, que llamará al método que ejecuta la consulta a la base de datos y que, por último,
                        enviará los datos a la vista para que puedan ser mostrados al cliente.</p>
                    
                    <img class="img-fluid rounded" src="imagenes/paso9.jpg" alt="Consulta">
                    
                    <p>Y con esto la configuración de Hibernate estará terminada.</p>
                    
                    <br/>
                    
                    <p>Si deseas seguir el video tutorial en el que se basa este manual, puedes hacer click <a href="https://www.youtube.com/watch?v=hHMEWUTnOaU">aquí</a>.</p>
                    
                    <br/>
                    
                    <p>A continuación se incluye una tabla de compatibilidades de Hibernate con Java:</p>
                    
                <hr>  
            
            </article>
            
            
            <article class="datosJson">
                
                <h2>Listado de compatibilidades de Hibernate</h2>
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
                            <!--<tr ng-repeat="obj in listaJson">
                                <th scope="row">{{obj.tecnologia}}</th>
                                <th scope="row">{{obj.version60}}</th>
                                <th scope="row">{{obj.version54}}</th>
                                <th scope="row">{{obj.version53}}</th>
                                <th scope="row">{{obj.version52}}</th>
                                <th scope="row">{{obj.version51}}</th>
                                <th scope="row">{{obj.version50}}</th>
                            </tr>-->

                                <%
                                for (int i = 0; i < lista.size(); i++) {
                                    JsonObject obj = lista.get(i).getAsJsonObject();

                                    %>
                            <tr>
                                <th scope="row"><%= obj.get("tecnologia").getAsString() %></th>
                                <th scope="row"><%= obj.get("version60").getAsString() %></th>
                                <th scope="row"><%= obj.get("version54").getAsString() %></th>
                                <th scope="row"><%= obj.get("version53").getAsString() %></th>
                                <th scope="row"><%= obj.get("version52").getAsString() %></th>
                                <th scope="row"><%= obj.get("version52").getAsString() %></th>
                                <th scope="row"><%= obj.get("version50").getAsString() %></th>
                            </tr>
                                    <%

                                    }
                                %>


                        </tbody>
                    </table>
                </div>
            </article>
        </section>
    </body>
</html>
