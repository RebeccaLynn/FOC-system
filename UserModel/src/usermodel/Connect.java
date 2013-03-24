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
            try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select cName from committees ORDER BY cName");
                while(rs.next()){
                    resultList.add(rs.getString("cName"));
                }    
            }
            catch(Exception e){
                System.out.println("e");
            }        
     return resultList;
     
     }
     
       public ArrayList getAFaculty(String first, String last){
            
            resultList.clear();
            try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                String query = "select members.*, positions.posName, committees.cName from members INNER JOIN positions ON members.memberPK_id = positions.facultyFK_id INNER JOIN committees ON positions.positionFK_id = committees.id"
                        + "  WHERE fName = '" + first + "' AND lName = '" + last + "';";
                System.out.println(query);
                ResultSet rs = stmt.executeQuery(query);
                boolean finish = false;
                
             while(rs.next()){
                   resultList.add(rs.getString("fName"));
                   resultList.add(rs.getString("lName"));
                   resultList.add(rs.getString("department"));
                   resultList.add(rs.getString("active"));
                   resultList.add(rs.getString("previousPos"));
                   resultList.add(rs.getString("position"));
                   resultList.add(rs.getString("phone"));
                   resultList.add(rs.getString("email"));
                   resultList.add(rs.getString("dateActivity"));
                   resultList.add(rs.getString("positions.posName"));
                   resultList.add(rs.getString("committees.cName"));
                   finish = true;
             }
              if (!rs.next() && !finish){
                    System.out.println("asdf");
                     query = "select * from members WHERE fName = '" + first + "' AND lName = '" + last + "';";
                     System.out.println(query);
                     rs = stmt.executeQuery(query);
                     while(rs.next()){
                        resultList.add(rs.getString("fName"));
                        resultList.add(rs.getString("lName"));
                        resultList.add(rs.getString("department"));
                        resultList.add(rs.getString("active"));
                        resultList.add(rs.getString("previousPos"));
                        resultList.add(rs.getString("position"));
                        resultList.add(rs.getString("phone"));
                        resultList.add(rs.getString("email"));
                        resultList.add(rs.getString("dateActivity"));
                     }
                }
              
            }
             catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }
         
     
     public ArrayList getAllFaculty(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select fName,lName from members ORDER BY lName");
                while(rs.next()){
                    resultList.add(rs.getString("fName")+ " " + rs.getString("lName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }
     
     
     public boolean insertFaculty(String first, String last, String department, String position, String email, String phone){
       try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                PreparedStatement statement = conn1.prepareStatement("INSERT INTO members (fName,lName,department,position,email,phone) VALUES ( ?, ?,?,?,?,?)");
                statement.setString(1, first);
                statement.setString(2, last);
                statement.setString(3, department);
                statement.setString(4, position);
                statement.setString(5,email);
                statement.setString(6,phone);
                statement.execute();
               return true;          
                
       }      
       catch(Exception e){
                System.out.println(e);
                return false;
            }        
     }
  
     
}
