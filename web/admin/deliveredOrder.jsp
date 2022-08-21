
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>
<%@page import="java.sql.*"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivered Orders</title>
        
         <%@include file="admin_css.jsp" %>
        <style>
            .brand{
                background: #2196f3!important;
                color: white;
                text-align: center;
                font-size: 70px; 
                margin:0;
                padding: 10px;
            }
            
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0% 99%, 0 0);
            }
        </style>
        
    </head>
    <body>
        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
 
        <%@include file="admin_navbar.jsp" %>
        
        
        
        <div class="pt-3 pb-3 border-bottom" style="color: black; text-align: center; font-size: 30px; font-weight: 50px">Delivered Order <i class='fas fa-cart-arrow-down'></i></div>
        
        
        
         <table class="table table-striped mt-3">
            
            <thead class="bg-primary text-white">
    <tr>

      
            <th scope="col">Product ID</th>
            <th scope="col">Product Name</th>
            <th>Image</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col"> E-mail </th>
            <th scope="col">Address</th>
            <th scope="col">City</th>
            <th scope="col">State</th>
            <th scope="col">Pin Code</th>
            <th scope="col">Mobile Number</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Payment Method</th>
            <th scope="col">T-ID</th>
            <th scope="col">Status</th>
            
      
    </tr>
  </thead>
  
  <%     
          int sno=0;
          try
          {
              Connection con = DBConnect.getConn();
              Statement st = con.createStatement();
            
              ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered' ");
              
              while(rs.next())
              {
                  sno=sno+1;          
%>    
  
  <tbody>
      
      
      
      
    <tr>
        <td><%=rs.getString(2)%> </td>
        <td><%=rs.getString(17)%> </td>
        <td> <img src="pImages/<%=rs.getString(21) %>" style="width:50px; height:50px;" > </td>
        <td><%=rs.getString(3)%> </td>
        <td><i class="fa fa-inr"></i> <%=rs.getString(5)%> </td>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><%=rs.getString(9)%></td>
        <td><%=rs.getString(10)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(12)%></td>
        <td><%=rs.getString(13)%></td>
        <td><%=rs.getString(14)%></td>
        <td><%=rs.getString(15)%></td>
        
    </tr>
    
    
  </tbody>
  
  <%
}
  }
  catch(Exception e)
  {
  System.out.print(e);
  }
  
  %>
  
</table>
        
        
        
        
    </body>
</html>
