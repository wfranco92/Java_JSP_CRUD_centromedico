<%-- 
    Document   : consultarcitas
    Created on : Nov 28, 2021, 11:28:03 AM
    Author     : wfran
--%>
<%@page import="com.mycompany.adj_willianfranco.logRegister"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->

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
                                <th scope="col">ID Cita</th>
                                <th scope="col">Fecha Cita</th>
                                <th scope="col">Hora Cita</th>
                                <th scope="col">Usuario</th>
                                <th scope="col">Medico</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                                    st = conexion.createStatement();
                                    rs = st.executeQuery("SELECT * FROM cita;");
                                    logRegister.registrar("se hace consulta a la tabla 'cita' en BBDD", Integer.parseInt(sesion.getAttribute("id").toString()));
                                    while (rs.next()) {

                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td>
                                    <a href="editarcita.jsp?idcita=<%= rs.getString(1)%>&fecha=<%= rs.getString(2)%>&hora=<%= rs.getString(3)%>&idusuario=<%= rs.getString(4)%>&idmedico=<%= rs.getString(5)%>" class="btn btn-primary">Editar</a>
                                    <a href="eliminarcita.jsp?idcita=<%= rs.getString(1)%>" class="btn btn-danger">Eliminar</a>
                                
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

        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5"></div></footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
