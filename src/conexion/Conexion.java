/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author VSPC-ETERNALSTORM2V5
 */
public class Conexion {
    public void initDb() throws SQLException {
        //String urlConUsuario = "jdbc:mysql://localhost/controlhorario?user=root&password=1234";
        String urlConUsuario = "jdbc:mysql://localhost/controlhorario?autoReconnect=true&useSSL=false";
        //String urlSinUsuario = "jdbc:mysql://localhost/controlhorario?useJDBCCompliantTimezoneShift=true&LegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        Connection conn = DriverManager.getConnection(urlConUsuario, user, password);
        //conn = DriverManager.getConnection("jdbc:mysql://localhost/controlhorario", "root", "1234");
 
        }
}
