/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.User;
import java.sql.*;
import com.entity.product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class incDecRemDao {
    
    private Connection con;
    
    public incDecRemDao(Connection conn)
    {
        this.con = conn;
    }
    
    public String decQuantity(String id , String email)
    {
        int price = 0;
        int total = 0;
        int quantity = 0;
        int total_price = 0;
        
        String s = "possible";
        
        try{
            Statement st =  this.con.createStatement();
            ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id = '"+id+"' and address is NULL");
            
            
            while(rs.next())
            {
                price = rs.getInt("price");
                total = rs.getInt("total");
                quantity = rs.getInt("quantity");
            }
            if(quantity==1)
            {
                s = "notpossible";
            }
            else
            {
                
            total = total-price;
            quantity = quantity - 1;
            st.executeUpdate("update cart set total='"+total+"' ,quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL ");
            
            }
            
        }
        catch(Exception e)
        {
            System.out.print(e);
        }
        
        return s;
    }
    
    public void incQuantity(String id , String email)
    {
        int price = 0;
        int total = 0;
        int quantity = 0;
        int total_price = 0;
        
        String s = "possible";
        
        try{
            Statement st =  this.con.createStatement();
            ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id = '"+id+"' and address is NULL");
            
            while(rs.next())
            {
                price = rs.getInt("price");
                total = rs.getInt("total");
                quantity = rs.getInt("quantity");
            }
            
        total = total+price;
        quantity=quantity+1;
        st.executeUpdate("update cart set total='"+total+"' ,quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL ");
            
        }
        catch(Exception e)
        {
            System.out.print(e);
        }  
    }
    
    public void remove(String id , String email)
    {
        try{
        
            Statement st = this.con.createStatement();
            st.executeUpdate("delete from cart where email="+"'"+email+"'"+" and product_id="+"'"+id+"'"+" and address is NULL");
           //response.sendRedirect("myCart.jsp?ms=removed"); this is also correct to go on another page .
   
        }catch(Exception e)
        {
            System.out.print(e);
        }
        
    }
    
    
    
    
}
