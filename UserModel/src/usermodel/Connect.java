/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package usermodel;
import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author KBrown
 */
public class Connect {
    //hellow now
    //hello work for me.!!!
    public static Connection conn;
    public static Connection conn1;
    public ArrayList<String> resultList = new ArrayList<String>();
    public String dbURL = "jdbc:mysql://localhost:3306/FOC_DB";
  
    public Connect() {
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();    
        }
        catch (Exception e) {
            throw new RuntimeException("Can't register driver!");
        }
    } 

        
     public ArrayList getAllCommittes(){
            
            resultList.clear();
        System.out.println("ksks");
             try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select * from committiees");
                while(rs.next()){
                    
                    resultList.add(rs.getString("cName"));
                }    
            }
            catch(Exception e){
                System.out.println("can't show profile");
            }        
     return resultList;
     
     }
  
}
