<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page import="com.DB.DBConnect"%>
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>
<%@page import="java.sql.*"%>


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
        <title>Edit Product</title>
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
        </style>
        
    </head>
    <body>
        
       

        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
 
        <%@include file="admin_navbar.jsp" %>
        
        
        
        <main class="d-flex align-items-center banner-background primary-background" style="height: 140vh; ">
            
            <div class="container">
                
                
        <%
           String id = request.getParameter("id");
           addProductDao dao = new addProductDao(DBConnect.getConn());
           List<product> list = dao.getProductById(id);
           
           for(product p:list)
           {
       %>
                
                <div class="row">
                    <div class="col-md-6 offset-md-3"> <!--total 12 grid hai col-md-4 se left se 4 shift ke fir offset-md-4 se right se 4 shift ke-->
                       
                        <div class="card">
                            
                            <div class="card-header primary-background text-white text-center">
                               <i class='fas fa-plus-square fa-2x'></i>  <br>
                                <h4>Edit Product With Id : <%=p.getId()%> </h4>
                            </div>
                            
                          
                            <div class="card-body">
                                
<!--                                <h3 class="text-center" style="color: black;"></h3>-->

                               
                                
                                <form action="../editProductAction" method="post">
                                    
                                     <input type="hidden"  name="id" value="<%=p.getId()%> ">
                                    
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Name</label>
                                        <input name="name" type="text" value="<%=p.getName()%>" class="form-control" id="exampleInputPassword1"  required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Category</label>
                                        <input name="category" type="text" value="<%=p.getCategory()%>" class="form-control" id="exampleInputPassword1"  required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Price</label>
                                        <input name="price" type="number" value="<%=p.getPrice()%>" class="form-control" id="exampleInputPassword1" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Active</label>
                                        <select id="inputState" name="active" class="form-control">
                                             <option value="Yes">Yes</option>
                                             <option value="No">No</option>
                                        </select>
                                   
                                   </div>
                                    
                                   
<!--                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Upload Pic</label>
                                        <input name="pic" type="file" class="form-control" id="exampleInputPassword1" required>  
                                    </div> -->
                                    
                                    
                                    <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                    </div>
                                    
                                    
                                </form>
                                    
                        
                                    
                            
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    
                                  
        
                                    
                </div>
                                    
        <%
           }
        %>
                
            </div>
            
            
        </main>
        
        
    
    </body>
</html>
