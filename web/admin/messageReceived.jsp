<%@page import="com.DB.DBConnect"%>
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>
<%@page import="java.sql.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
        <title>Message Received</title>
        
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
            
            h3
            {
	        color: yellow;
            	text-align: center;
            }
            
        </style>
        
    </head>
    <body>
        
         <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
 
        <%@include file="admin_navbar.jsp" %>
        
        
    
        
    <div class="font-weight-bold pb-3 pt-3" style="color:#0000aa; text-align: center; font-size: 30px;">Messages Received </div>

        <table class="table table-striped pl-3 ">
            
        <thead style="background-color:white;" class="bg-primary text-white">
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        
    <tbody style="background-color:white;">
            
        <%
            try{  
                Connection con = DBConnect.getConn();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from message");
                while(rs.next())
                {
        %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
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
        
        
        
        
    </body>
</html>
