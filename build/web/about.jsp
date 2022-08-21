
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
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
            
            
            
            body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
.ppic{
    
    width:100%;
    
    
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
            
            
            
            
            </style>
        
    </head>
    
    
    
    <body>    
        
        
      <h1 class="brand" > <span class="fa fa-asterisk fa-spin"></span> Shopy.com</h1>
        <%@include file="all_component/navbar.jsp" %>
        
<div class="about-section mt-5">
  <h1>Hey Everyone!</h1>
<!--  <p style="font-size: 20px"></p>-->
<!--  <p>I</p>-->
</div>

<!--<h2 style="text-align:center">Our Team</h2>-->
<div class="row" style="background-color: #474e5d;">

  <div class="col-md-4 offset-md-4">
    <div class="card">
        <img class="ppic" src="admin/img/WhatsApp.jpeg" alt="John" >
      <div class="container">
        <h2>I am Ujjwal</h2>
        <h3 style="color:#2196f3"> Web Developer and a Coder .</h3>
        <h4>I am student of IIITU from 2nd year   (ECE Branch) .</h4>
       
        <h4>E-mail - 20248@gmail.com</h4>
    
         <a class="nav-link pl-2" href="messageUs.jsp"> <p><button class="button">Contact</button></p> </a>  <!--.getName()-->
    
      </div>
    </div>
  </div>
</div>

</body>
</html>