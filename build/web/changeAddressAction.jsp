<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>

<%@page import="java.sql.*" %>

<%
    User user1 = (User) session.getAttribute("currentUser");
    String email= user1.getEmail();
     System.out.print(email+"\n");
    String address = request.getParameter("address");
    System.out.print(address+"\n");
    String city = request.getParameter("city");
    System.out.print(city+"\n");
    String state = request.getParameter("state");
    System.out.print(state+"\n");
    String pin = request.getParameter("pin");
    
    System.out.print(email+"\n"+address+"\n"+city+"\n"+state+"\n"+pin+"\n");
    try
    {
        Connection con= DBConnect.getConn();
        PreparedStatement ps = con.prepareStatement("update user set address=?,city=?,state=?,pincode=? where email=?");
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, pin);
        ps.setString(5, email);
        ps.executeUpdate();
%>
<jsp:forward page="changeAddress.jsp?msg=valid" />
<%
    }catch(Exception e)
    {
%>
<jsp:forward page="changeAddress.jsp?msg=invalid" />

<%
        System.out.print(e);
    }
%>