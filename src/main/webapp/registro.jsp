<%-- 
    Document   : registro
    Created on : Nov 27, 2021, 3:32:09 PM
    Author     : wfran
--%>
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
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        
        <section class="signup-section" id="signup">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <h2 style="color:black; font-weight: bold">Registrate</h2>
                            <form class="form-signup" id="contactForm" method="post" action="registro.jsp">
                                    <div class="mb-1">
                                      <label for="nombre" class="form-label">Nombre</label>
                                      <input type="text" class="form-control" id="nombre" name="nombre"  required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="apellido" class="form-label">Apellido</label>
                                      <input type="text" class="form-control" id="apellido" name="apellido" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="NITUsuario" class="form-label">Numero de Identificación</label>
                                      <input type="number" class="form-control" id="NITUsuario" name="NITUsuario" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="telefono" class="form-label">Telefono</label>
                                      <input type="number" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="direccion" class="form-label">Dirección</label>
                                      <input type="text" class="form-control" id="direccion" name="direccion" required>
                                    </div>
                                    <div class="mb-3">
                                      <label for="email" class="form-label">Correo Electronico</label>
                                      <input type="email" class="form-control" id="email" name="email" required aria-describedby="emailHelp">
                                    </div>
                                     <div class="mb-3">
                                      <label for="pass" class="form-label">Contraseña</label>
                                      <input type="password" class="form-control" id="pass" name="pass" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary" name="registrar">Registrar</button>
                        </form>
                    </div>
                </div>
            </div>
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
        
        <%
            if(request.getParameter("registrar")!=null){
                String nombre=request.getParameter("nombre");
                String apellido=request.getParameter("apellido");
                String NITUsuario=request.getParameter("NITUsuario");
                String telefono=request.getParameter("telefono");
                String direccion=request.getParameter("direccion");
                String email=request.getParameter("email");
                String pass=request.getParameter("pass");
                String rol="usuario";
                
                out.print(NITUsuario);
                try{
                    Connection conexion=null;
                    PreparedStatement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                    String sql="INSERT INTO usuario (nombre, apellido, documento, correo, password, telefono, direccion, rol) "
                            + "VALUES(?,?,?,?,?,?,?,?)";
                    
                    /*String sql="INSERT INTO usuario (nombre, apellido, documento, correo, password, telefono, direccion, rol) "
                            + "VALUES('"+nombre+"','"+apellido+"', '"+NITUsuario+"', '"+email+"', '"+pass+"', '"+telefono+"', '"+direccion+"', '"+rol+"')";*/
                    
                    
                    st=conexion.prepareStatement(sql);
                    st.setString(1, nombre);
                    st.setString(2, apellido);
                    st.setString(3, NITUsuario);
                    st.setString(4, email);
                    st.setString(5, pass);
                    st.setString(6, telefono);
                    st.setString(7, direccion);
                    st.setString(8, rol);
                    
                    st.execute();
                    out.println("<script type='text/javascript'>alert('se ha registrado con exito, por favor inicie su sesion')</script>");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    conexion.close();
                }catch(Exception e){
                 out.print("Error: "+e);
                }
            }
        %>
    </body>
</html>