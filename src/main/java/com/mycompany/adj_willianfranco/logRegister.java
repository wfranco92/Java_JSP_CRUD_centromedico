/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.adj_willianfranco;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.jdbc.Driver;
/**
 *
 * @author wfran
 */
public class logRegister {
    
    static Connection conexion = null;
    static PreparedStatement st= null;

    public static void registrar(String desc, int idusuario) throws ClassNotFoundException {

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            conexion=DriverManager.getConnection("jdbc:mysql://localhost/centromedico?user=root&password=Sofia2215");
            String sqlLog = "INSERT INTO logs (descripcion,idusuario) VALUES(?, ?);";
            st = conexion.prepareStatement(sqlLog);
            st.setString(1,desc);
            st.setInt(2,idusuario);
            st.execute();
            System.out.print("Correcto!!");
        } catch (SQLException ex) {
            Logger.getLogger(logRegister.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
