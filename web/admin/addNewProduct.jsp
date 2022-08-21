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
        <title>Add Product</title>
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
        

<% int id=1;
  try{
      Connection con = DBConnect.getConn();
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select max(id) from product");
      while(rs.next())
      {
          id = rs.getInt(1);
//          id= id+1;
      }
  }catch(Exception e)
  {
      System.out.print(e);
  }
%>

        
        <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
 
        <%@include file="admin_navbar.jsp" %>
        
        
        <main class="d-flex align-items-center banner-background primary-background" style="height: 140vh; ">
            
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3"> <!--total 12 grid hai col-md-4 se left se 4 shift ke fir offset-md-4 se right se 4 shift ke-->
                       
                        <div class="card">
                            
                            <div class="card-header primary-background text-white text-center">
                               <i class='fas fa-plus-square fa-2x'></i>  <br>
                                <h4>Add Product</h4>
                            </div>
                            
                            <%
       String msg = request.getParameter("msg");
       System.out.print(msg);
       if("done".equals(msg))
       {
           msg="";
    %>
<h3 class="primary-background text-center text-white">Product Added Successfully!</h3>
    <%
           
       }
       else if("wrong".equals(msg)) 
       {
            msg="";
    %>
<h3 class="alert-danger text-center text-white">Some thing went wrong! Try Again!</h3>
    <% 
           
       }
    %>
                
                            
        
                            <div class="card-body">
                                
                                <h3 class="text-center" style="color: black;">Product ID:  <%out.println(id+1);%></h3>

                               
                                
                                <form action="../addProduct" method="post" enctype="multipart/form-data">
                                    
<!--                                     <input type="hidden"  name="id" value="<">   %out.println(id);% > -->
                                    
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Enter Name</label>
                                        <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Category</label>
                                        <input name="category" type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Category" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Price</label>
                                        <input name="price" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter Price" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Active</label>
                                        <select id="inputState" name="active" class="form-control">
                                             <option value="Yes">Yes</option>
                                             <option value="No">No</option>
                                        </select>
                                   
                                   </div>
                                    
                                    
                                    
<!--                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Status</label>
                                        <select id="inputState" name="active" class="form-control">
                                            <option selected >---- Select ----</option>
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                   
                                   </div>
                                    -->
                                   
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Upload Pic</label>
                                        <input name="pic" type="file" class="form-control" id="exampleInputPassword1" required>
                                    </div>
                                    
                                    
                                    <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                    </div>
                                    
                                    
                                </form>
                                
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
            
        </main>
    
    </body>
</html>
