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

        
     public ArrayList getAllCommittees(){
            
            resultList.clear();
        System.out.println("ksks");
             try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select * from committees");
                while(rs.next()){
                    
                    resultList.add(rs.getString("cName"));
                }    
            }
            catch(Exception e){
                System.out.println("can't show profile");
            }        
     return resultList;
     
     }
     public ArrayList getAllFaculty(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select fName,lName from members");
                while(rs.next()){
                    resultList.add(rs.getString("fName")+ " " + rs.getString("lName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }
     
     
     public boolean insertFaculty(String first, String last, String department, String position){
       try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                PreparedStatement statement = conn1.prepareStatement("INSERT INTO members (fName,lName,department,position) VALUES ( ?, ?,?,?)");
                statement.setString(1, first);
                statement.setString(2, last);
                statement.setString(3, department);
                statement.setString(4, position);
                statement.execute();
               return true;          
                
       }      
       catch(Exception e){
                System.out.println(e);
                return false;
            }        
     }
  
     
}
