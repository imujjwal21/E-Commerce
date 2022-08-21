
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        
<!--        %@include file="all_component/allCss.jsp" %>-->

<!--        css-->
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

.branded{
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
        
<!--                navbar-->

<h1 class="branded" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>

             <%@include file="all_component/navbar.jsp" %>
             
             
         
 
        
        <main class="primary-background pt-5 " style="height: 125vh">
            <div class="container pb-3">
                <div class="col-md-6 offset-md-3">  <!--total 12 grid hai col-md-4 se left se 4 shift ke fir offset-md-4 se right se 4 shift ke-->
                   
                    <div class="card">
                        
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            <h4>Register Here</h4>    
                        </div>

<!--                        <
                            String msg = (String) session.getAttribute("msg");
                            if("exist".equals(msg))
                            {
                        %>
                             <div class="alert alert-danger" role="alert">This Email Already Exist .</div>
                        %
                            }
                            else if("done".equals(msg))
                            {
                        %>
                             <div class="alert alert-success" role="alert">Account Created Successfully .</div>
                        %
                            }
                            else if("error".equals(msg))
                            {
                        %>
                             <div class="alert alert-danger" role="alert">Something went Wrong .</div>
                        %
                            }
                            else if("box".equals(msg))
                            {
                        %>
                             <div class="alert alert-danger" role="alert">Box not Checked .</div>
                        %}
                           session.removeAttribute("msg");
                        %>
                        -->
                        <div class="card-body">
                            
                            <!--    Form    -->
                            
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                
                                
                                <div class="form-group">
                                    <label for="user_name">Enter Name</label>
                                    <input  name="fname" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Full Name" required>
                                </div>
                             
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email E-mail</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Enter Mobile Number</label>
                                    <input name="phno" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Mobile Number" required>
                                </div>
                               
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" value="male" name="gender" >Male
                                    <input type="radio" id="gender" value="female" name="gender" >Female
                                </div>
                                
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label  class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                </div>
<!--                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label  class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                </div>-->
                               
                                <br>
                                
                                
                                
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait</h4>
                                <br>
                                </div>
                                <div class="container text-center">
                                <button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
                                </div>
                                
                            </form>
                        
                        </div>

                        
                    </div>
                         
                    
                </div>  
                
            </div>
            <%@include file="all_component/footer.jsp" %>   
        </main>
        
        
         
        
<!--        javascript-->
        
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        
<!--my script -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>  <!--sweet alert cdn swal ke liye use kiya-->


<script>
    $(document).ready(function(){
        console.log("loaded.......")
        
        $('#reg-form').on('submit',function(event){    //form submit hote he yeh function apne aap chal jayrga .
            event.preventDefault();  // iss se yeh servlet pe nahi jayega  orr apan yahi se pura data submit kar degi servlet pe .
            
            let form=new FormData(this);   // yeh form ka pura data yaha aa jayega iss form mein or iss data ko RegisterServlet pe send karna hai.
            
            $("#submit-btn").hide();
            $("#loader").show();
            
            //send this form to registerServlet
            
            $.ajax({
               url: "RegisterServlet",
               type: 'POST',
               data: form,
               success: function(data,textStatus,jqXHR){
                   console.log(data)
                   
                   $("#submit-btn").show();
                   $("#loader").hide();
                   
                   if(data.trim()=='done')
                   {
                       
                    swal("Successfully Registered .. We are redirect to login page")
                    .then((value) => {
                      window.location="login.jsp"
                    });
               }else{
                 swal(data);
             }
             
               
                },
                
               error: function(jqXHR,textStatus,errorThrow){
                    $("#submit-btn").show();
                    $("#loader").hide();
                     swal("Something went wrong .. try again ");          
        
               },
               //imp
               processData: false,
               contentType: false
               
            });
            
        });
        
    });
</script>


        
    </body>
</html>
