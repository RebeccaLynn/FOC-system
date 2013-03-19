/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package usermodel;
import java.sql.*;
/**
 *
 * @author Rebecca
 */
public class Main {

    /**
     * @param args the command line arguments
     */
     static Statement stmt = null;
     static ResultSet rs = null;
    
    public static void main(String[] args) {
        // TODO code application logic here
         try {
             Connect conn = new Connect();
             System.out.println("Connection established");
             stmt = conn.conn.createStatement();
             rs = stmt.executeQuery("SELECT * FROM members");

    // or alternatively, if you don't know ahead of time that
    // the query will be a SELECT...

           if (stmt.execute("SELECT * FROM members")) {
               rs = stmt.getResultSet();
               while ( rs.next() ){
                   System.out.println(rs.getString("fname") + " " + rs.getString("lname"));
               } 
				
            }       
         }
         catch (SQLException e) {
             e.printStackTrace();
             System.err.println("Connection Failure");
         }  
        
    }
    
}