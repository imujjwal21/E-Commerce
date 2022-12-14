<%@page import="com.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
 

             <%@include file="all_component/navbar.jsp" %>


        <main class="d-flex align-items-center primary-background banner-background" style="height: 90vh">
            
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4"> <!--total 12 grid hai col-md-4 se left se 4 shift ke fir offset-md-4 se right se 4 shift ke-->
                       
                        <div class="card">
                            
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span><br>
                                <h4>Login Here</h4>
                            </div>
                
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                
                                if(m!=null)
                                {    
                            %>
                             
                            <div class="alert <%=m.getCssClass() %>" role="alert">
                                <%=m.getContent() %>
                            </div>
                            <%
                                    session.removeAttribute("msg");  // ab agar mein fir se msg get karu session se toh yeh wala na aaye .
                                }
                            %>
        
                            
       
                            
                            <div class="card-body">
                                
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
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
    
    
    
    
                                <!--        javascript-->
        
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
