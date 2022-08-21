<% 
    // no use at all .
    
   session.removeAttribute("user");    
   session.setAttribute("logout", "Logout Successfully .");
   response.sendRedirect("login.jsp");
   
%>