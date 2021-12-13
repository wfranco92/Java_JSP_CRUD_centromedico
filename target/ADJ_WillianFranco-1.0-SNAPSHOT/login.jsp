<%-- 
    Document   : login
    Created on : Nov 28, 2021, 1:33:38 PM
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

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Home Agenda Tu Cita</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="registro.jsp">Registrarse</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->


        <!-- login-->
        <section class="signup-section" id="signup">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">

                        <h2 class="text-white mb-5">Inicio de Sesión</h2>

                        <form class="form-signup" id="contactForm" action="login.jsp" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Correo Electronico</label>
                                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"  placeholder="usuario@ejemplo.com" required>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" required>
                            </div>

                            <button type="submit" class="btn btn-primary" name="ingreso">Ingresar</button>
                        </form>
                    </div>
                </div>
            </div>

            <%  
                Connection conexion = null;
                PreparedStatement st = null;
                ResultSet rs = null;
                
                if (request.getParameter("ingreso") != null) {
                    String email = request.getParameter("email");
                    String pass = request.getParameter("pass");
                    HttpSession sesion = request.getSession();
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                        String sql="SELECT * FROM Usuario WHERE correo=? and password=?";
                        st = conexion.prepareStatement(sql);
                        st.setString(1, email);
                        st.setString(2, pass);
                        rs = st.executeQuery();
                        while(rs.next()){
                            sesion.setAttribute("log", "ok");
                            sesion.setAttribute("id", rs.getString(1));
                            sesion.setAttribute("nombre", rs.getString(2));
                            sesion.setAttribute("rol", rs.getString(11));
                            
                            if(rs.getString(11).equals("usuario")){
                                response.sendRedirect("usuario.jsp");
                            }else{response.sendRedirect("administracion.jsp");}
                        }
                        
                        logRegister.registrar("Ingreso al sistema (inicio de sesion)", Integer.parseInt(sesion.getAttribute("id").toString()));
                                                
                    } catch (Exception e) {
                        out.print("Error: " + e);
                    }finally{
                        conexion.close();
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