<%-- 
    Document   : eliminarcita
    Created on : Nov 28, 2021, 1:04:28 PM
    Author     : wfran
--%>
<%@page import="com.mycompany.adj_willianfranco.logRegister"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            Connection conexion = null;
            Statement st = null;
            HttpSession sesion=request.getSession();
            try {

                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                st=conexion.createStatement();
                st.executeUpdate("UPDATE cita SET idusuario='"+request.getParameter("idusuario")+"' WHERE idcita='"+request.getParameter("idcita")+"';");
                logRegister.registrar("se agenda la cita medica id: '"+request.getParameter("idcita")+"' ", Integer.parseInt(sesion.getAttribute("id").toString()));
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                conexion.close();
            } catch (Exception e) {
                out.print("Error: " + e);
            }

        %>

        
    </body>
</html>
