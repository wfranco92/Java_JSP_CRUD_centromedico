<%-- 
    Document   : registrarmedico
    Created on : Nov 28, 2021, 10:56:40 AM
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
                <a class="navbar-brand" href="administracion.jsp">Administración</a>
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
<!-- creacion de Medicos-->
        <section class="signup-section" id="crearMedico">
            <div class="container px-1 px-lg-1">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <h2 class="text-white mb-1">Creacion de medicos</h2>
                            <form class="form-signup" id="contactForm">
                                    <div class="mb-3">
                                      <label for="nombreMedico" class="form-label">Nombre</label>
                                      <input type="text" class="form-control" id="nombreMedico" name="nombremedico" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="apellidoMedico" class="form-label">Apellido</label>
                                      <input type="text" class="form-control" id="apellidoMedico" name="apellidoMedico" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="NITMedico" class="form-label">Numero de Identificación</label>
                                      <input type="text" class="form-control" id="NITMedico" name="NITMedico" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="telefonoMedico" class="form-label">Telefono</label>
                                      <input type="text" class="form-control" id="telefonoMedico" name="telefonoMedico" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="estado" class="form-label">Estado</label>
                                      <select id="estado" name="estado" class="form-control">
                                          <option >seleccione estado</option>
                                          <option value="activo" name="activo">Activo</option>
                                          <option value="inactivo" name="inactivo">Inactivo</option>
                                      </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary" name="registrarMedico">Ingresar</button>
                            </form>
                    </div>
                </div>
            </div>
        </section>

<%
            if(request.getParameter("registrarMedico")!=null){
                String nombremedico=request.getParameter("nombremedico");
                String apellidoMedico=request.getParameter("apellidoMedico");
                String NITMedico=request.getParameter("NITMedico");
                String telefonoMedico=request.getParameter("telefonoMedico");
                String estado=request.getParameter("estado");
                                
                out.print(estado);
                try{
                    Connection conexion=null;
                    Statement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                    st=conexion.createStatement();
                    st.executeUpdate("INSERT INTO medico (nombre, apellido, documento, telefono, estado) "
                            + "VALUES('"+nombremedico+"','"+apellidoMedico+"', '"+NITMedico+"', '"+telefonoMedico+"','"+estado+"')");
                    logRegister.registrar("se crea nuevo profesional medico en BBDD nombre: '"+nombremedico+"' '"+apellidoMedico+"'", Integer.parseInt(sesion.getAttribute("id").toString()));
                    request.getRequestDispatcher("administracion.jsp").forward(request, response);
                    conexion.close();
                }catch(Exception e){
                 out.print("Error: "+e);
                }
            }
        %>
        
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
