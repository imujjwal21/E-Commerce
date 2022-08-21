
<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user12 = (User) session.getAttribute("currentUser");
    
    if(user12 == null)
    {
        response.sendRedirect("login.jsp");
    }
%>


<!DOCTYPE html>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart</title>
        
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
    <body style="background-color: #2196f3">
        
        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
        <%@include file="all_component/navbar.jsp" %>
        
    <div class="pt-3 pb-3 border-bottom" style="color: white; text-align: center; font-size: 30px; background-color: #2196f3">My Cart <i class='fas fa-cart-arrow-down'></i></div>
        
    
    <%
        
   String msg = request.getParameter("msg");
   if("notPossible".equals(msg))
   {
%>

<h3 class=" text-warning text-center mt-5 pb-3 font-italic">There is only one Quantity! So click on remove!</h3>

<%}%>

<%
   if("inc".equals(msg))
   {
%>

<h3 class="text-warning text-center mt-5 pb-3 font-italic">Quantity  Increased Successfully!</h3>

<%}%>

<%
   if("dec".equals(msg))
   {
%>

<h3 class="text-warning text-center mt-5 pb-3 font-italic">Quantity  Decreased Successfully!</h3>

<%}%>

<%
   if("removed".equals(msg))
   {
%>

<h3 class="text-warning text-center mt-5 pb-3 font-italic">Product Successfully Removed!</h3>

<%}%>

        
        
        <%
   User user1 = (User)session.getAttribute("currentUser");
//   User user = (User) session.getAttribute("currentUser"); variable user is arleady define in navbar
   
   String email = user.getEmail();
   %>
   

        
    <table class="table table-striped " style="background-color: #2196f3">
           
        <thead class="bg-primary text-white">
            
    <%
        int total=0;
        int sno=0;   
        try{
            Connection con = DBConnect.getConn();
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery("select sum(total) from cart where email="+"'"+email+"'"+" and address is NULL");
            
            while(rs1.next())
            {
                total=rs1.getInt(1);
            }
    %>
    
    <tr>
            <th scope="col" style="background-color: yellow; color: black;">Total:  <i class="fa fa-inr"></i> <%out.println(total);%> </th>
  
            <%
            if(total>0)
            {
            %>
            
            <th scope="col" style="background-color: white; text-color:blue" ><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
            
            <%
            }
            %>
          
          </tr>
          
        </thead>
        
        <thead  style="background-color: white">
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody style="background-color:white;">
        <%
            ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email="+"'"+email+"'"+" and cart.address is NULL");
            
            while(rs.next())
            {  
        %> 
          <tr>
           <%sno=sno+1; %>
           <td><%out.print(sno); %></td>
           <td> <img src="admin/pImages/<%=rs.getString(6)%>" style="width:50px; height:50px;" > </td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><a href="incDecRemove?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(9)%> <a href="incDecRemove?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(11) %> </td>
            <td><a href="incDecRemove?id=<%=rs.getString(1)%>&quantity=remove">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>

          <%
             }
            }catch(Exception e)
            {
            System.out.print(e);
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
