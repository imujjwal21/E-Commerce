<%@page import="com.entity.User"%>
<%@page import="com.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user1 = (User) session.getAttribute("currentUser");
    
    if(user1 == null)
    {
        response.sendRedirect("login.jsp");
    }
    
    String s = user1.getAddress();
     System.out.print( s );
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
<!--               %@include file="all_component/allCss.jsp" %>
          -->
          
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
          
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0% 99%, 0 0);
            }
            h1{
    color: green;
}


.primary-background{
    background: #2196f3!important;
}

.navbar .nav-item .nav-link{
    font-size: 20px;
    color: white;
}
.navbar .nav-item:hover .nav-link{
    background-color: white;
    color:#0d47a1;
    border-radius: 15px;
    font-weight: 30px;
}


            
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
        
<!--        navbar-->

<h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
        

 <%@include file="all_component/navbar_profile.jsp" %>
 

             

<%
    String msg = request.getParameter("msg");
    if("done".equals(msg))
    {
%>
<h3 class="text-warning text-center mt-5 pb-3 font-italic">Your Mobile Number successfully changed!</h3>
<%
    }
    else if("wrong".equals(msg))
    {
%>
<h3 class="text-warning text-center mt-5 pb-3 font-italic">Your Password is wrong!</h3>
<%
    }
%>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 90vh">
            
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4"> <!--total 12 grid hai col-md-4 se left se 4 shift ke fir offset-md-4 se right se 4 shift ke-->
                       
                        <div class="card">
                            
                            <div class="card-header primary-background text-white text-center">
<!--                                <i class='fas fa-key fa-3x'></i><br>-->
                                <h4>Change Address</h4>
                            </div>
                            
                            <div class="card-body">
                                
                                <form action="changeMobileAction.jsp" method="post">
                                    
                                   
                                    
                                     <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Mobile Number</label>
                                        <input name="mobile"  type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter new Number" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Enter Password</label>
                                        <input name="password"  type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" required>
                                    </div>
                                    
                                    
                                    <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
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
