/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package usermodel;
import com.mysql.jdbc.Driver;
import java.sql.*;
/**
 *
 * @author KBrown
 */
public class Connect {
  
    public Connect() throws SQLException{
        makeConnection();
    } 

    public Connection conn;  

     public  Connection makeConnection() throws SQLException {
        if (conn == null) {
             new Driver();
            // buat koneksi
             conn = DriverManager.getConnection(
                       "jdbc:mysql://localhost/FOC_PLANNER",
                       "root",null);
         }
         return conn;
     }  
  
}
