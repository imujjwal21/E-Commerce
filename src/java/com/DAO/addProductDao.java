/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class addProductDao {
    
    public Connection con;
    
    public addProductDao(Connection con) {
        this.con = con;
    }
    
    public boolean savePost(product p)
    {
         boolean f = false;
        
        try{
            String query = "insert into product(name,category,price,active,photo) values(?,?,?,?,?)";
            PreparedStatement psp = con.prepareStatement(query);
            
            psp.setString(1, p.getName());
            psp.setString(2, p.getCategory());
            psp.setString(3, p.getPrice());
            psp.setString(4, p.getActive());
            psp.setString(5, p.getPhoto());
            
            psp.executeUpdate();
            
            f=true;
            
        }catch(Exception e)
        {
            System.out.print(e);
        }
        
        return f;
    }
    
    public List<product> getAllProductForAdmin(){
        
        List<product> list = new ArrayList<>();
        
        try{
        
            String q = "select * from product";
            
            Statement st = this.con.createStatement();
            
            ResultSet rs = st.executeQuery(q);
            
            while(rs.next())
            {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String price = rs.getString("price");
                String active = rs.getString("active");
                String photo = rs.getString("photo");
                
                product c = new product(id , name, category , price , active , photo);
                
                list.add(c);
            }
        }catch(Exception e)
        {
            System.out.print(e);
        }
        return list;   
    }
    
    public List<product> getAllProduct(){
        
        List<product> list = new ArrayList<>();
        
        try{
        
            String q = "select * from product where active='Yes'";
            
            Statement st = this.con.createStatement();
            
            ResultSet rs = st.executeQuery(q);
            
            while(rs.next())
            {
            
//                String id = rs.getString("id");
//                String name = rs.getString("name");
//                String category = rs.getString("category");
//                String price = rs.getString("price");
//                String active = rs.getString("active");
//                String pic = rs.getString("pic");
//                
//                product c = new product(id , name, category , price , active , pic);
                
                String id = rs.getString("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String price = rs.getString("price");
                String active = rs.getString("active");
                String photo = rs.getString("photo");
                
                product c = new product(id , name, category , price , active , photo);
                
                list.add(c);
            }
        }catch(Exception e)
        {
            System.out.print(e);
        }
        return list;   
    }
    
    public List<product> getProductById(String iid)
    {
        List<product> list = new ArrayList<>();
        try
        {
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where id='"+iid+"'");
            
            while(rs.next())
            {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String price = rs.getString("price");
                String active = rs.getString("active");
                String photo = rs.getString("photo");
                
                product c = new product(id , name, category , price , active , photo);
                
                list.add(c);
            }
           
        }catch(Exception e)
        {
            System.out.print(e);
        }
         return list;
    }
    
    public List<product> getSerchProduct(String search)
    {
  
        List<product> list = new ArrayList<>();
    
        try
        {
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where ( name like '%"+search+"%' or category like '%"+search+"%' ) and active='Yes'");
                    
            while(rs.next())
            {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                String price = rs.getString("price");
                String active = rs.getString("active");
                String photo = rs.getString("photo");
                
                product c = new product(id , name, category , price , active , photo);
                
                list.add(c);
            }
           
        }catch(Exception e)
        {
            System.out.print(e);
        }
         return list;   
    }
    
    
    
}
