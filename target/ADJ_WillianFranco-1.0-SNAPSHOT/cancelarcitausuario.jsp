<%-- 
    Document   : cancelarcitausuario
    Created on : Nov 28, 2021, 3:05:56 PM
    Author     : wfran
--%>

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
            try {

                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
                st=conexion.createStatement();
                st.executeUpdate("UPDATE cita SET idusuario=null WHERE idcita='"+request.getParameter("idcita")+"';");
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                conexion.close();
            } catch (Exception e) {
                out.print("Error: " + e);
            }

        %>

    </body>
</html>
