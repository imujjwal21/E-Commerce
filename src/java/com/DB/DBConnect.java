package com.DB;
import java.sql.*;

public class DBConnect {
    private static Connection conn;
    
    public static Connection getConn()
    {
       try{
           if(conn==null)
           {
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerceweb","root",null);
           }    
        }catch(Exception e)
        {
           System.out.print(e);
        }
       return conn;
    }  
    
}
