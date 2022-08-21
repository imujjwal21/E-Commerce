
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        
        <%@include file="all_component/allCss.jsp" %>
        
        <style>
            body{
                background-color: #f7f7f7;
            }
            .crd-ho:hover{
                background-color: #ffe6e6;
            }
            .brand{
                background: #2196f3!important;
                color: white;
                text-align: center;
                font-size: 70px; 
                margin:0;
                padding: 10px;
            }
            
        </style>
        
    </head>
    <body>
        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
        <%@include file="all_component/navbar.jsp" %>
        
        
<table class="table table-striped mt-4 ">
            
    <thead class="bg-primary text-white">
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Payment Method</th>
            <th scope="col">Status</th>
              
          </tr>
    </thead>
<tbody>
      
      <%
           User user1 = (User) session.getAttribute("currentUser");
           String email = user1.getEmail();
           
           int sno = 0;
       
           Connection con = DBConnect.getConn();
           Statement st = con.createStatement();
           ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id = product.id and cart.email = '"+email+"' and cart.orderDate is not NULL");
       
                    
           while(rs.next())
           {
               sno = sno+1;
      %>
      
        <tr>
            <td><%out.println(sno); %></td>
            <td> <img src="admin/pImages/<%=rs.getString(21)%>" style="width:50px; height:50px;" > </td>
                            
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(18) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(19) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(5) %> </td>
            <td><%=rs.getString(11) %></td>
            <td><%=rs.getString(12) %></td>
            <td><%=rs.getString(13) %></td>
            <td><%=rs.getString(15) %></td>
        </tr>
    
   
    <%
              
       }
    %>
    
    
    
    
  </tbody>
</table>
    
    <br>
    <br>
    <br>
    <br>
    
    
        <%@include file="all_component/footer.jsp" %>
        
    </body>
</html>
