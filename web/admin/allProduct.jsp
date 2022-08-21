
<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>
<%@page import="java.sql.*"%>


<%

    User user = (User) session.getAttribute("currentUser");
    
    if(user == null)
    {
        response.sendRedirect("../login.jsp");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin : All Products</title>
        
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
        
        <div class="pt-3 pb-3 border-bottom" style="color: black; text-align: center; font-size: 30px; font-weight: 50px">All Products <i class='fas fa-cart-arrow-down'></i></div>
        
        
        <br>
        <%
       String msg = request.getParameter("msg");
       System.out.print(msg);
       if("done".equals(msg))
       {
           msg="";
    %>
<h3 class="primary-background text-center text-white p-2">Product Edit Successfully!</h3>
    <%
           
       }
       else if("wrong".equals(msg)) 
       {
            msg="";
    %>
<h3 class="alert-danger text-center text-white">Some thing went wrong! Try Again!</h3>
    <% 
           
       }
    %>
        
        <table class="table table-striped ">
            
            <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
      
      <%
       addProductDao dao = new addProductDao(DBConnect.getConn());
       List<product> list = dao.getAllProductForAdmin();
       
       for(product p:list)
       {
       
      %>
      
    <tr>
      <th scope="row"> <%=p.getId()%> </th>
      <td> <img src="pImages/<%=p.getPhoto()%>" style="width:50px; height:50px;" > </td>
      <td> <%=p.getName()%> </td>
      <td><%=p.getCategory()%></td>
      <td><%=p.getPrice()%></td>
     <td><%=p.getActive()%></td>
      <td>
          <a href="editProduct.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-primary">Edit</a>
<!--          <a href="#" class="btn btn-sm btn-danger">Delete</a>-->
      </td>
      
    </tr>
   
    <%
              
       }
    %>
    
  </tbody>
</table>
        
        
    </body>
</html>
