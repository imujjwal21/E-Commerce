package com.DAO;

import java.sql.*;

public class canDel {
    
    private Connection con;
    
    public canDel(Connection conn)
    {
        this.con = conn;
    }
    
    public boolean cancelOrder(String id, String email)
    {
        boolean f = false;
        
        try
        {
        String status = "Cancel";
        Statement st = this.con.createStatement();
        st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
        f = true;               
        }
    catch(Exception e)
    {   
        System.out.print(e);
    } 
        return f;
        
    }
    
    public boolean deliveredOrder(String id, String email)
    {
        boolean f = false;
        
        try
        {
        String status = "Delivered";
        
        Statement st = this.con.createStatement();
        st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
        f = true;               
        }
    catch(Exception e)
    {   
        System.out.print(e);
    } 
        return f; 
    }
    
    
}
