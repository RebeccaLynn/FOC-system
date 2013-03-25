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
    public static boolean committee;
    public static int newCommitteID;
    public static int committeeID;
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
                   resultList.add(rs.getString("memberPK_id"));
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
                        resultList.add(rs.getString("memberPK_id"));
                     }
                }
              
            }
             catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }
       
     public ArrayList getAllOpen(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT committees.cName, positions.posName FROM committees INNER JOIN positions ON committees.id = positions.positionFK_id WHERE positions.facultyFK_id IS NULL ORDER BY cName;");
                while(rs.next()){
                    resultList.add(rs.getString("cName")+ " " + rs.getString("posName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }           
     
      public ArrayList getAllCurrent(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT committees.cName, positions.posName, members.fName, members.lName, positions.positionPK_id FROM committees INNER JOIN positions ON committees.id = positions.positionFK_id INNER JOIN members ON positions.facultyFK_id = members.memberPK_id  ORDER BY cName;");
                while(rs.next()){
                    resultList.add(rs.getInt("positionPK_id") + ": " + rs.getString("cName")+ " " + rs.getString("posName") + "-" + rs.getString("fName") + " " + rs.getString("lName"));
                    
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
     
        public boolean editFaculty(String query){
       try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                System.out.println(query);
                PreparedStatement statement = conn1.prepareStatement(query);
                statement.execute();
               return true;          
                
       }      
       catch(Exception e){
                System.out.println(e);
                return false;
            }        
     }
        
        
        //makes sure the name of a committee that will be added is be unique by 
        //checking for the existence first
        private  boolean checkCommittee (String cName){
            try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select cName from committees where cName = '"+cName+"'");                      
                if(rs.first()){
                    
                    committee = true;                
                }
                else{
                    committee = false;      
                }  
            }
            catch(Exception e){
                System.out.println("wrong statement");
            }
        return committee;
    }
    
    public void setNewCommitteID(int id){  
        newCommitteID = id;    
    }
    
    public int getNewCommitteID(){
        return newCommitteID;
    }
    
    
    //inserts a newCommitte
    public void insertCommitte(String cName){
        //check if committe is unique
        if(!checkCommittee(cName)){
            try{ 
                String newCommitteID;
            
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select max(id) as ID from committees;");
                
                while(rs.next()){
                    
                    newCommitteID = rs.getString("ID");
                    setNewCommitteID(Integer.parseInt(newCommitteID));
                }
            
                stmt.executeUpdate("insert into committees (id,cName) Values("+(getNewCommitteID()+1)+",'"+cName+"')");
            }
            
            catch(Exception e){
            System.out.println("Failed to insert Statement");
            }
        }
        //if not print message
        else{
            System.out.println("Committie Already Exists");
        }
    }
    
    
 
    private void setCommitteeID(int cID)
    {
        committeeID = cID;
    }  
    
    private int getCommitteeID()
    {
        return committeeID;
    }
 
    public void editCommittie(String oldName, String newName){
        
        if(checkCommittee(oldName)){
            try{
                String comID;
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("select id from committees where cName = '"+oldName+"'");
                
                while(rs.next()){
                    comID = rs.getString("id");
                    setCommitteeID(Integer.parseInt(comID));
                }
               
                stmt.executeUpdate("UPDATE committees SET cName = \""+newName+"\" WHERE id = "+getCommitteeID()+"");
            }
            catch(Exception e){
                System.out.println("CAN'T UPDATE COMMITTE");
            }
        }
        else{
            System.out.println("Committie does not exist");
        }
        
    
    }
  
     
}
