
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*" %>

<%
    
    User user = (User) session.getAttribute("currentUser");
    String email = user.getEmail();
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
   
    if(!confirmPassword.equals(newPassword))
    {
%>
<jsp:forward page="changePassword.jsp?msg=notMatch" />

<%
    //also by response.sendRedirect("changePassword.jsp?msg=notMatch");
    }
    int check=0;
    try{
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email="+"'"+email+"'"+" and password="+"'"+oldPassword+"'");
        while(rs.next())
        {
            check=1;
            st.executeUpdate("update user set password="+"'"+newPassword+"'"+" where email="+"'"+email+"'");
%>
<jsp:forward page="changePassword.jsp?msg=done" />
<%
        }//while
        
        if(check==0)
        {
%>
<jsp:forward page="changePassword.jsp?msg=wrong" />
<%
        }
    }catch(Exception e)
    {
        response.sendRedirect("changePassword.jsp?msg=invalid"); //we can also write by this .
        System.out.print(e);
    }
%>