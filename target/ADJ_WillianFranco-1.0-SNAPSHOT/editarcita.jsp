<%-- 
    Document   : editarcita
    Created on : Nov 28, 2021, 12:17:39 PM
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
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        
        <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("log")== null || !sesion.getAttribute("rol").equals("administrador") ){
                response.sendRedirect("login.jsp");
            }
        %>

        <%
            String idcita = request.getParameter("idcita");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String idusuario = request.getParameter("idusuario");
            String idmedico = request.getParameter("idmedico");

        %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">

                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="btn btn-primary" href="administracion.jsp">Inicio</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- creacion de Medicos-->
        <section class="signup-section" id="crearMedico">
            <div class="container px-1 px-lg-1">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <h2 class="text-white mb-1">Editar cita</h2>
                        <form class="form-signup" id="contactForm" action="editarcita.jsp" method="get">
                            <div class="mb-3">
                                <label for="fecha" class="form-label">Fecha cita</label>
                                <input type="text" class="form-control" id="fecha" name="fecha" value="<%= fecha%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="hora" class="form-label">Hora Cita</label>
                                <input type="text" class="form-control" id="hora" name="hora" value="<%= hora%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="idusuario" class="form-label">Usuario</label>
                                <input type="text" class="form-control" id="idusuario" name="idusuario" value="<%= idusuario%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="idmedico" class="form-label">Medico</label>
                                <input type="text" class="form-control" id="idmedico" name="idmedico" value="<%= idmedico%>" required>
                            </div>

                            <button type="submit" class="btn btn-primary" name="modificar">Modificar</button>
                            <input type="hidden" name="idcita" value="<%= idcita%>">
                        </form>
                    </div>
                </div>
            </div>
            <%
                if (request.getParameter("modificar") != null) {

                    try {
                        Connection conexion = null;
                        PreparedStatement st = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                        String sql="UPDATE cita SET fecha=?,hora=?,idmedico=? WHERE idcita=?;";
                        st = conexion.prepareStatement(sql);
                        st.setString(1, fecha);
                        st.setString(2, hora);
                        st.setString(3, idmedico);
                        st.setString(4, idcita);
                        
                        st.execute();
                        /*st.executeUpdate("UPDATE cita SET fecha='" + fecha + "' ,hora='" + hora + "',idmedico='" + idmedico + "' WHERE idcita='" + idcita + "';");*/
                        logRegister.registrar("se actualiza la cita '"+idcita+" fecha: '"+fecha+"' hora: '"+hora+"' '"+idmedico+"'en BBDD", Integer.parseInt(sesion.getAttribute("id").toString()));
                        request.getRequestDispatcher("consultarcitas.jsp").forward(request, response);
                        conexion.close();
                    } catch (Exception e) {
                        out.print("Error: " + e);
                    }
                }
            %>

        </section>

        <!-- Contact-->

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