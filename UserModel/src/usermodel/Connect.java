/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package usermodel;
import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
/**
 *
 * @author KBrown
 */
public class Connect {
    public static Connection conn;
    public static Connection conn1;
    public static boolean committee;
    public static boolean position;
    public static boolean resultsVal;
    public static int newCommitteID;
    public static int positionID;
    public static int committeeID;
    public static int pID;
    public static int mID;
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
        
    
     public void upDate(){
            
            resultList.clear();
            try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                stmt.executeUpdate("UPDATE members SET active = 'Yes'");
                
            }
            catch(Exception e){
                System.out.println(e);
            }        
    
     
     }
     
     /**
      * 
      * @return list of all committees
      */
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
     
     /**
      * Gets information about faculty to populate EditForm
      * @param first first name of faculty
      * @param last last name of faculty
      * @return arraylist of all information
      */
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
      
       /**
        * 
        * @return list of all open positions on all committees
        */
     public ArrayList getAllOpen(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT positions.positionPK_id, committees.cName, positions.posName FROM committees INNER JOIN positions ON committees.id = positions.positionFK_id WHERE positions.facultyFK_id IS NULL ORDER BY cName;");
                while(rs.next()){
                    resultList.add(rs.getString("positionPK_id") + ": " + rs.getString("cName")+ " " + rs.getString("posName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }           
     
     /**
      *  
      * @return list of filled positions and faculty assigned to them
      */
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
     
      /**
       * 
       * @return list of all faculty
       */
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
     
     /**
      * Gets all faculty eligible to server on committee
      * Checks to see if they are active or if date of last activity is more than 1 year ago (or has not been set and is null)
      * @return arraylist of all eligible faculty
      */
      public ArrayList getEligibleFaculty(){
            
        resultList.clear();
        try{
                conn1 = DriverManager.getConnection(dbURL, "root", null);
                Statement stmt = conn1.createStatement();
                Calendar now = Calendar.getInstance();   // This gets the current date and time.
                int year = now.get(Calendar.YEAR);   
                ResultSet rs = stmt.executeQuery("select memberPK_id, fName,lName from members WHERE active = 'Yes' AND dateActivity + 1 < " + year + " OR dateActivity IS NULL ORDER BY lName");
                while(rs.next()){
                    resultList.add(rs.getString("memberPK_id")+": " + rs.getString("fName")+ " " + rs.getString("lName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }        
     return resultList;
     
     }
     
     /**
      * Add new faculty member 
      * @param first
      * @param last
      * @param department
      * @param position
      * @param email
      * @param phone
      * @return  true if insert successful, else false
      */
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
     
     /**
      * Executes query to edit faculty 
      * @param query 
      * @return true if edit successful
      */
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

        /**
         * This function remove a faculty member from the system including the positions that they held.
         * @param fname the faculty member's first name
         * @param lname the faculty member's last name
         * @return if true, then successful, else failed
         */
        public boolean removeFaculty (String fname, String lname){
            try{
                int link=-1;
                conn1=DriverManager.getConnection(dbURL,"root",null); // connect to the database
                //Find the requested faculty member's id
                Statement findStmnt=conn1.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                ResultSet findID= findStmnt.executeQuery("Select memberPK_id from members where fName='"+fname+"' AND lName='"+lname+"'");
                //The "link" between the tables:
                if(findID.next()){
                    link=findID.getInt("memberPK_id");
                }
                //Find the positions related to the desired faculty member
                Statement findPositions=conn1.createStatement();
                ResultSet positions=findPositions.executeQuery("Select positionPK_id from positions where facultyFK_id="+link);
                //iterate through the returned table and remove the related row(s)
                while (positions.next()){
                    //Set the facultyFK_id to NULL
                    int id=positions.getInt("positionPK_id");
                    Statement updatePostion=conn1.createStatement();
                    updatePostion.executeUpdate("UPDATE positions SET facultyFK_id=NULL where positionPK_id="+id);
                 }
                //Remove the previously selected faculty member:
                findID.deleteRow();
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
    public boolean insertCommittee(String cName){
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
               return true;
            }
            
            catch(Exception e){
            System.out.println("Failed to insert Statement");
            return false;
            }
        }
        //if not print message
        else{
            System.out.println("Committee Already Exists");
            return false;
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
 /**
  * 
  * @param oldName, old committee name
  * @param newName, new committee name
  */
   public void editCommittee(String oldName, String newName){
        
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
                System.out.println("CAN'T UPDATE COMMITTEE");
            }
        }
        else{
            System.out.println("Committee does not exist");
        }
    }

    /**Removes a committee from the system including the positions table
     * @pram name, the name of the selected committee
     * @return true, the removal was successful.
     * @return false, the removal failed because the information could not be found.
     */
    public boolean removeCommittee(String name){
        if(checkCommittee(name)){
            int link = -1;
            try{
                System.out.println(name);
                conn1=DriverManager.getConnection(dbURL,"root",null); // connect to the database
                //Find the requested committee's id
                Statement findStmnt=conn1.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet findID= findStmnt.executeQuery("Select id from committees where cName='"+name+"'");
                //The "link" between the tables:
                if(findID.next()){
                    link=findID.getInt("id");
                }
               //Find the positions related to the desired committee
                Statement findPositions=conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet positions=findPositions.executeQuery("Select positionPK_id from positions where positionFK_id="+link);
                //iterate through the returned table and remove the related rose
                while (positions.next()){
                    positions.deleteRow(); //This is a java function that remove the data from both the resulting and underlying table (http://docs.oracle.com/javase/7/docs/api/java/sql/ResultSet.html)
                }
                //Remove the previously selected committee:
                findID.deleteRow();
                return true;
            }
            catch(Exception x){
                System.out.println(x);
                x.printStackTrace();
                return false;
            }
        }
        else{
            System.out.println("Committee was not found");
            return false;
        }
    }
    

    /**checks to see if a position exists or not
     * @return true, if the position exists
     * @return false, if the position does not exists
    */
    public boolean checkPosition(String pName){
        try{
            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            ResultSet rs = stmt.executeQuery("select posName from positions where posName = '"+pName+"'");                      
            if(rs.first()){
                position = true;                
                }
                else{
                    position = false;      
                }  
            }
            catch(Exception e){
                System.out.println("Postion does not exits");
            }
        return position;
    }
    
     public ArrayList getCommitteePosition(String cName){
        try{
            resultList.clear();
            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            ResultSet rs = stmt.executeQuery("select posName,positionPK_id from positions INNER JOIN committees ON committees.id = positions.positionFK_id where committees.cName = '"+cName+"'");                      
            while(rs.next()){
                    resultList.add(rs.getString("positionPK_id")+ ": " + rs.getString("posName"));
                }    
            }
            catch(Exception e){
                System.out.println(e);
            }
        return resultList;
    }
    
    
    /**
     * mutator for for setting a position
     * @param pID 
     */
    public void setPositionID(int pID){
        positionID = pID;
    }
    
    /**
     * accessor for position
     * @return current position Id
     */
    public int getPositionID(){
        return positionID;
    }
    
    
    /**allows the client to insert a new position
     * 
     * @param posName
     * @return true, if position was added
     * @return false, if position was not added
     */
    public boolean insertPosition(String cName, String posName){
        try{ 
            String newPositionID;
            String commID = "-1";
            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            
            ResultSet r1 = stmt.executeQuery("select id from committees where committees.cName = '"+cName+"'");                      
            while(r1.next()){
                    commID = r1.getString("id");
                }    
      
            
            ResultSet rs = stmt.executeQuery("select max(positionPK_id) as ID from positions;");
                
            while(rs.next()){
                newPositionID = rs.getString("ID");
                setPositionID(Integer.parseInt(newPositionID));
                }
            
            stmt.executeUpdate("insert into positions (positionPK_id,posName,positionFK_id) Values("+(getPositionID()+1)+",'"+posName+"','"+ commID +"')");
            position = true;
            }
            
            catch(Exception e){
                System.out.println("Failed to add new Position");
                position = false;
            }
        return position;
    }
    /**
     * 
     * @param cName, committee name
     * @param firstName, member first name
     * @param lastName, member last name
     * @param pName, name of position
     * @return, true if position was removed, else it's false
     */
    public boolean removePosition(String cName, String firstName, String lastName,
            String pName){
        try{ 

            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            
            
            //get the committie pk id
            ResultSet rs = stmt.executeQuery("select id from committees where cName = '"+cName+"'");
            while(rs.next()){
                String posID = rs.getString("id");
                pID = Integer.parseInt(posID);
            }

            //get the falculty pk id
            rs = stmt.executeQuery("select memberPK_id from members where fName = '"+firstName+"' AND lName = '"+lastName+"'");
            while(rs.next()){
                String memberID = rs.getString("memberPK_id");
                mID = Integer.parseInt(memberID);
            }
            
            System.out.println("pID: "+pID+" fID: "+mID);
            if(pID <= 0 || mID <=0){
                resultsVal = false;
            }else{
                stmt.executeUpdate("Delete from positions where positionFK_id = '"+pID+"' AND facultyFK_id = '"+mID+"'"
                   + "AND posName = '"+pName+"'");
                resultsVal = true; 
            }
            
    
        }catch(Exception e){
        
            System.out.println("Couldn't Remove Pos");
        }

        return resultsVal;
    }
    /**
     * Remove position based on position primary key
     * @param id positions.positionPK_id
     */
     public void removePosition2(String id){
        try{ 

            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            Statement stmt1 = conn1.createStatement();
            
            
            //get the faculty pk id if one
         
            ResultSet rs = stmt.executeQuery("select memberPK_id from members INNER JOIN positions ON positions.facultyFK_id = members.memberPK_id WHERE positions.positionPK_id = " + id);
            while(rs.next()){
                String memberID = rs.getString("memberPK_id");
                mID = Integer.parseInt(memberID);
                Calendar now = Calendar.getInstance();   // This gets the current date and time.
                int year = now.get(Calendar.YEAR);                 // This returns the year as an int.
                //update faculty assigned to position to current year for last date served
                System.out.println("UPDATE members SET dateActivity =" + year + " WHERE memberPK_id = " + memberID);
                stmt1.executeUpdate("UPDATE members SET dateActivity =" + year + " WHERE memberPK_id = " + memberID);
            }
           
            stmt1.executeUpdate("Delete from positions where positionPK_id = "+id);
    
        }catch(Exception e){
        
            System.out.println(e);
        }
    
    }
     
     
      public boolean assignPosition(String posID, String facultyID, String year){
        try{ 
            conn1 = DriverManager.getConnection(dbURL, "root", null);
            Statement stmt = conn1.createStatement();
            stmt.executeUpdate("UPDATE positions SET positions.posVacancy = " + year + " , positions.facultyFK_id = " + facultyID + " WHERE positionPK_id =" + posID);
            stmt.executeUpdate("UPDATE members SET members.dateActivity = " + year + " WHERE members.memberPK_id =" + facultyID);
            return true;   
           
            }
            
            catch(Exception e){
                System.out.println(e);
                return false;
            }
      
    }
     
}
