
package com.DAO;

import com.entity.User;
import java.sql.*;

public class UserDAO {
    
    private Connection conn;
    
     public UserDAO(Connection conn) {
        this.conn = conn;
    }
     
     
    public boolean CheckUserExistency(String email)
    {
        boolean f = false;
        
        try{
            String query = "select * from user where email=?";
            
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
         
            while(rs.next())
            {
                f=true;
            }   
        }catch(Exception e)
        {
            System.out.print(e);
        }      
        return f;
    }
    
    //to insert user to database .     
     
     public boolean UserRegister(User user)
     {
         System.out.print(user.getName()+"  "+user.getEmail()+"  "+user.getPassword()+"  "+user.getPhno()+"  "+user.getGender()+"\n");
         boolean f = false;
         
         try{
             String query = "insert into user(name,email,phno,password,gender) values(?,?,?,?,?)";
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, user.getName() );
             ps.setString(2, user.getEmail() );
             ps.setString(3, user.getPhno() );
             ps.setString(4, user.getPassword());
             ps.setString(5, user.getGender() );
             ps.executeUpdate();
             
             f=true;
             
         }catch(Exception e)
         {
             System.out.print(e);
         }
         
         return f;
     }
     
     
     public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try{
            String query = "select * from user where email=? and password=?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs =  ps.executeQuery();
            
            if(rs.next())  //direct he kar diya kyuki 1 he user hoga .
            {
                user = new User();  // make new obj of User class which is present at User.java that why we import com.tech.blog.entities.User;
                String name = rs.getString("name"); //database se nikala  ( also like this  rs.getString(2); )
                user.setName(name);            //set to user obj
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhno(rs.getString("phno"));
                user.setAddress(rs.getString("address"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setPincode(rs.getString("pincode"));
                
                user.setGender(rs.getString("gender"));
                
                user.setProfile(rs.getString("profile"));
            }
            
            
        }catch(Exception e)
        {
            System.out.print(e);
        }
        return user;
    }
     
     
     public boolean addMessage(String subject,String body,String email)
     {
         boolean f = false;
         
         try{
             PreparedStatement ps = this.conn.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
             ps.setString(1, email);
             ps.setString(2, subject);
             ps.setString(3, body);
             
             ps.executeUpdate();
            
            f = true;
             
         }catch(Exception e)
         {
             System.out.print(e);
         }
         
         return f;
     }
     
     
    
}
