<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
     <h1 class="brand" > <span class="fa fa-asterisk "></span> Shopy.com</h1>
        <%@include file="all_component/navbar.jsp" %>
        
      
<!--           Connection co = DBConnect.getConn();
           out.print(co);-->

<%
   String msg = request.getParameter("msg");
   if("added".equals(msg))
   {
%>
<h3 class="bg-warning text-dark text-center mt-5 p-3 font-italic">Product added successfully!</h3>

<%}%>

<%
   if("exist".equals(msg))
   {
%>
<h3 class="bg-warning text-dark text-center mt-5 p-3 font-italic">Product already exist in you cart! Quantity  increased!</h3>

<%}%>

<%
   if("invalid".equals(msg))
   {
%>
<h3 class="bg-warning text-dark text-center mt-5 p-3 font-italic">Something Went Wrong! Try Again</h3>

<%}%>
       

<%
   User user1 = (User)session.getAttribute("currentUser");
//   User user = (User) session.getAttribute("currentUser"); variable user is arleady define in navbar 
   %>
   

        <div class="container pt-4">
            <h2 class="text-center">New Products</h2>
            
            <div class="row">
               
                
                <%
        addProductDao  dao = new addProductDao(DBConnect.getConn());
        List<product> list = dao.getAllProduct();
        
        for(product p:list)
        {
            
   %>
                
                
                <div class="col-md-3 mb-5">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="admin/pImages/<%=p.getPhoto()%>" style="width: 190px" height="200px" class="img-thumblin" >
                            <p class="mt-3">Name : <%=p.getName()%> </p>
                            <p>Category : <%=p.getCategory()%> </p>
                            <p>Price : <%=p.getPrice()%> </p>
                            
                            
                            <div class="row text-center " style="display:block">  <!-- for making a tag in center first make display:block because a tag is inline element -->
               
                                <%
                                if(user==null)
                                {
                                %>
                  <a href="login.jsp" class="btn btn-danger text-center btn-md ">Add to Cart <i class="fa-solid fa-cart-arrow-down"></i></a>
                  <%}%>
                  <%
                                if(user!=null)
                                {
                                %>
                  
                  
                  <a href="addToCartAction.jsp?id=<%=p.getId()%>" class="btn btn-danger text-center btn-md ">Add to Cart <i class="fa-solid fa-cart-arrow-down"></i></a>
                  <%}%>
<!--                                <a href="#" class="btn btn-success btn-sm mr-2">view details</a>-->
<!--                                <a href="#" class="btn btn-primary btn-sm">599</a>-->

                            </div>
                           
                        </div>
                    </div>    
                </div>
                            
    <%
        }
    %>
                                
                
            </div>
            
<!--            <div class="text-center mt-2">
                <a href="#!" class="btn btn-primary btn-md text-white">View all</a>
            </div>-->
            
        </div>
        
        <!--End of New Product-->
        
        <hr>
        
        
                
        <%@include file="all_component/footer.jsp" %>
        
    </body>
</html>

