
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>


<%

    User user = (User) session.getAttribute("currentUser");
    
    if(user == null)
    {
        response.sendRedirect("../login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin HomePage</title>
        <%@include file="admin_css.jsp" %>
        
        <style>
            
            h1
            {
                color: blue;
                text-align: center;
                font-size: 100px; 
                margin:160px;
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
        <%@include file="admin_navbar.jsp" %>
        
        <h1> Welcome Admin </h1>
        
        <%@include file="admin_footer.jsp" %>
    
    <body>
</html>
