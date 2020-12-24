/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 21627
 */
public class DAOUtil {
    public static Connection getConnection() throws Exception{
        Connection conn=null;
    
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/journal", "root","");
        }catch(ClassNotFoundException ex){
            throw new Exception("imposible driver");
        }catch(SQLException e){
             throw new Exception("imposible connect");
        }
            
        
        
   
       
        return conn;
          
               
    }
    }
