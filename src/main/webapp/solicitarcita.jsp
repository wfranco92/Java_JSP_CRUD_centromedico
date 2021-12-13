<%-- 
    Document   : solicitarcita
    Created on : Nov 28, 2021, 1:20:38 PM
    Author     : wfran
--%>
<%@page import="com.mycompany.adj_willianfranco.logRegister"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body id="page-top">
        
           <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("log")== null || !sesion.getAttribute("rol").equals("usuario") ){
                response.sendRedirect("login.jsp");
            }
        %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">Citas</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="#solicitarCita">Solicitar Nueva Cita</a></li>
                        <li class="nav-item"><a class="nav-link" ><%= sesion.getAttribute("nombre") %></a></li>
                        
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        
                    </div>
                </div>
            </div>
        </header>
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
                                <th scope="col">Medico</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                                    st = conexion.createStatement();
                                    rs = st.executeQuery("select cita.idcita, cita.fecha, cita.hora, medico.nombre, medico.apellido "
                                            + "FROM cita INNER JOIN medico WHERE cita.idmedico=medico.idmedico and cita.idusuario is null;");
                                    
                                    while (rs.next()) {

                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)+" "+rs.getString(5)%></td>
                                <td>
                                    
                                    <a href="agendarcita.jsp?idcita=<%= rs.getString(1)%>&idusuario=<%= sesion.getAttribute("id") %>" class="btn btn-primary">Agendar</a>
                                
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
            <div class="container mt-lg-5"><a class="btn btn-danger" href="usuario.jsp">Home Usuario</a></div>
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



