<%-- 
    Document   : eliminarmedico
    Created on : Nov 28, 2021, 11:19:51 AM
    Author     : wfran
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Agenda tu cita</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        
                
        <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("log")== null || !sesion.getAttribute("rol").equals("administrador") ){
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">Administración</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link">Admin</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- consulta de citas-->
        <%
            Connection conexion = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-lg-5">
            <div class="row">
                <div class="col-sm">

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID Medico</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Documento</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                                    st = conexion.createStatement();
                                    rs = st.executeQuery("SELECT * FROM medico;");

                                    while (rs.next()) {

                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td><%= rs.getString(6)%></td>
                                <td>
                                    
                                    <a href="deletemedico.jsp?idmedico=<%= rs.getString(1)%>" class="btn btn-danger">Eliminar</a>
                                
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("Error: " + e);
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                            <div class="container mt-lg-5"><a class="btn btn-danger" href="administracion.jsp">Home administracion</a></div> 
 </body>
</html>
