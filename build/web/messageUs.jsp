
<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    User user1 = (User) session.getAttribute("currentUser");
    
    if(user1 == null)
    {
        response.sendRedirect("login.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Us</title>
        
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
        
        
    <div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<%
    String msg = request.getParameter("msg");
    if("valid".equals(msg))
    {
%>


<h3 style="text-align:center; font-style: italic; color: #990000;" class="pb-2" >Message successfully sent. Our team will contact you soon!</h3>

<%
    }
    else if("invalid".equals(msg))
    {
%>

<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>

<%
    }
%>

     
<h1 class="text-center mt-2" style="color:black;">Message Us</h1>
        
<div class="container-fluid mt-4">
            
    <div class="container">
                
        <div class="row">
                    
            <div class="col-md-12">
     
                
 <form action="messageServlet" method="post">
     
     
 <div class="form-group">

    <label for="exampleInputEmail1">Enter Subject</label>
    <input type="text" name="subject" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Subject" required>
   
  </div>
                    
  <div class="form-group">
    <label for="exampleInputPassword1" class="large">Enter Content</label>
    <textarea rows="10" name="body" class="form-control" placeholder="Enter Your Message" required></textarea>
  </div>
 
     <div class="container text-center mb-4">
     
  <button type="submit" class="btn btn-primary btn-lg text-center"> Send </button>
     </div>
     
     
</form>
                
                
             
            </div>
        
        </div>
                
    </div>
            
</div>






        
        <%@include file="all_component/footer.jsp" %>
        
        
    </body>
</html>
