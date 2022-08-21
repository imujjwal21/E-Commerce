
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.*" %>

<%
    
    User user = (User) session.getAttribute("currentUser");
    
    String email = user.getEmail();
        
        String status="processing";
        
        try{
            
        System.out.print("bcmc");
            Connection con = DBConnect.getConn();
            PreparedStatement ps = con.prepareStatement("update cart set status=? where email=? and status='bill' ");
            ps.setString(1,status);
            ps.setString(2,email);
            ps.executeUpdate();
            
            response.sendRedirect("index.jsp");
        
        }catch(Exception e)
        {
            System.out.print(e);
        }
        
%>