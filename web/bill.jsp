
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="all_component/billcss.css">
        
    </head>
    <body>
        
        <%
            User user = (User) session.getAttribute("currentUser");
            String email = user.getEmail();
            
            try{
                
                int total=0;
            int sno=0;
            Connection con = DBConnect.getConn();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select sum(total) from cart where email="+"'"+email+"'"+" and status='bill' ");
            
            while(rs.next())
            {
                total = rs.getInt(1);
            }
           
            ResultSet rs2 = st.executeQuery("select * from user inner join cart where cart.email="+"'"+email+"' and user.email ='"+email+"'"+" and cart.status='bill' ");
            
            while(rs2.next())
            {
                
    %>
    
    
<h3>Online Shopping Bill ( Shopy.Com ) </h3>
<hr>
<div class="left-div"><h3>Name: <%=user.getName()%> </h3></div>
<div class="right-div-right"><h3>Email: <%out.print(email); %> </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString(4) %> </h3></div>  



<div class="left-div"><h3>Order Date: <%=rs2.getString(22) %> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs2.getString(24) %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs2.getString(23) %> </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs2.getString(25) %> </h3></div>
<div class="right-div-right"><h3>City: <%=rs2.getString(18) %> </h3></div> 
<div class="right-div"><h3>Address: <%=rs2.getString(17) %> </h3></div> 

<div class="left-div"><h3>State: <%=rs2.getString(19) %> </h3></div>
<div class="right-div-right"><h3>Pin Code: <%=rs2.getString(20) %> </h3></div>  

<hr>
     
    <% break;
            }
            //bcoz we want to run this loop only one time .
    %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
    
     <%
        ResultSet rs1 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email="+"'"+email+"'"+" and status='bill' ");
        while(rs1.next())
        {
            sno=sno+1;
    %>
  
  
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(17)%></td>
    <td><%=rs1.getString(18)%></td>
    <td><%=rs1.getString(19)%></td>
    <td><%=rs1.getString(3)%></td>
    <td><%=rs1.getString(5)%></td>
  </tr>
  <tr>
      <%
        }
      %>
</table>
      <h3>Total: <%out.println(total);%> </h3>
      
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

    <%
       
        }catch(Exception e)
        {
            System.out.print(e);
        }
            
            
          
        %>
        
    </body>
</html>
