
<%@page import="java.sql.*"%>
<%@page import="com.DB.DBConnect"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user1 = (User) session.getAttribute("currentUser");
    
    if(user1 == null)
    {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        
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
            hr{
                width : 70%;
            }
            
            
            h3{
	        text-align: center;
	        color: white;
            } 
            
        </style>
        
        
        
    </head>
    <body>
        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
        <%@include file="all_component/navbar_profile.jsp" %>
        
<!--            User user  = (User) session.getAttribute("user");
        %>-->



    <body style="background-color: #2196f3"  >
    
        
        
    
<h3 style="margin-top:100px;">Name: <%=user1.getName()%> </h3>
<hr>
 <h3>Email: <%=user1.getEmail()%>  </h3>
 <hr>
 <h3>Mobile Number: <%=user1.getPhno()%>  </h3>
 <hr>

      <br>
      <br>
      <br>
      
      <br>
      <br>
      
     

<%@include file="all_component/footer.jsp" %>
        
       
        
    </body>
</html>
