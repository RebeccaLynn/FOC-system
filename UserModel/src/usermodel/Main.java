/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package usermodel;
import java.sql.*;
import java.util.ArrayList;
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
   
  ArrayList<String> getPost = new ArrayList<String>();

        
        Connect sample = new Connect ();
        
        
        
       //sample.insertCommittee("NewOne");
        
       //sample.upDate();

        
        //sample.editCommittee("Writing Intensive", "Bye Dude");
        
        getPost = sample.searchFaculty("Lee");
       
        for(int k=0; k<getPost.size(); k++)
        {
            System.out.println(getPost.get(k));
        
        }

    }
   
}