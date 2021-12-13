<%-- 
    Document   : logout
    Created on : Nov 28, 2021, 1:48:16 PM
    Author     : wfran
--%>

<%@page import="com.mycompany.adj_willianfranco.logRegister"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             HttpSession sesion=request.getSession();
             logRegister.registrar("se cierra la sesion de usuario", Integer.parseInt(sesion.getAttribute("id").toString()));
             sesion.invalidate();
             response.sendRedirect("login.jsp");
             

        %>
    </body>
</html>
