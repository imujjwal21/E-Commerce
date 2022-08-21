<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.*" %>

<%
      
    User user = (User)session.getAttribute("currentUser");
    
    String email = user.getEmail();
    
    String address = request.getParameter("address");   
    String city = request.getParameter("city");         
    String state = request.getParameter("state");        
    String pincode = request.getParameter("pincode");    
    String mobileNumber = request.getParameter("mobileNumber");
    String paymentMethod = request.getParameter("paymentMethod");
    String transactionId="";
     
    transactionId = request.getParameter("transactionId");
     
    String status="bill";
         
    try{
         Connection con = DBConnect.getConn();
         PreparedStatement ps = con.prepareStatement("update user set address=?,city=?,state=?,pincode=?,phno=? where email=?");
         
         ps.setString(1, address);
         ps.setString(2, city);
         ps.setString(3, state);
         ps.setString(4, pincode);
         ps.setString(5, mobileNumber);
         ps.setString(6,email); 
         ps.executeUpdate();
         
        PreparedStatement ps1 = con.prepareStatement("update cart set address=?,city=?,state=?,pincode=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 1 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
        ps1.setString(1, address);
        ps1.setString(2, city);
        ps1.setString(3, state);
        ps1.setString(4, pincode);
        ps1.setString(5, mobileNumber);
        ps1.setString(6, paymentMethod);
        ps1.setString(7, transactionId);
        ps1.setString(8, status);
        ps1.setString(9, email);
        
        ps1.executeUpdate();
        
        response.sendRedirect("bill.jsp");
         
     }
     catch(Exception e)
     {
         System.out.print(e);
     }


%>