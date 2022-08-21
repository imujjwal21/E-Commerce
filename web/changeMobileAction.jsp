<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>

<%@page import="java.sql.*" %>

<%
    User user = (User) session.getAttribute("currentUser");
   String email = user.getEmail();
   String mobileno = request.getParameter("mobile");
   String password = request.getParameter("password");
   int check=0;
   
   try{
       Connection con = DBConnect.getConn();
       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user where email="+"'"+email+"'"+" and password="+"'"+password+"'");
       
       while(rs.next())
       {
           check=1;
           st.executeUpdate("update user set phno="+"'"+mobileno+"'"+" where email="+"'"+email+"'");
%>
<jsp:forward page="changeMobile.jsp?msg=done" />
<%
       }
       
       if(check==0)
       {
%>
    
<jsp:forward page="changeMobile.jsp?msg=wrong" />
<%
       }
   }catch(Exception e)
   {
       System.out.print(e);
   }
%>