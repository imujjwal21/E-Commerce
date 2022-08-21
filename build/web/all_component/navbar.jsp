


  <%@page import="com.entity.User"%>
  <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #2196f3" >      <!-- bg-dark ke jagah primary-background -->
    
<!--    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> Shopy.com</a>-->
  
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        
      <%
          User user = (User) session.getAttribute("currentUser");
          if(user!=null)
          {
      %>
       
      <li class="nav-item">    <!--when user login-->
        <a class="nav-link pl-2" href="index.jsp"> <%=user.getEmail()%> <i class="fa-solid fa-user"></i> </a>  <!--.getName()-->
      </li>
      
       
      <li class="nav-item">
        <a class="nav-link pl-2" href="index.jsp"> Home <i class="fa-solid fa-house"></i></a>
      </li>

     
      
      <li class="nav-item">    <!--when user login-->
        <a class="nav-link pl-2" href="profile.jsp"> Profile <i class="fa-solid fa-user"></i> </a>  <!--.getName()-->
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="myCart.jsp"> My Cart <i class="fa-solid fa-cart-arrow-down"></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="myOrder.jsp"> My Order  <i class='fab fa-elementor'></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="messageUs.jsp"> Message Us <i class='fas fa-comment-alt'></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link pl-2" href="about.jsp"> About Us <i class="fa fa-address-book"></i></a>
      </li>
      
      <li class="nav-item">
            <a class="nav-link pl-2" href="LogoutServlet"> Logout <span class="fa fa-share-square"></span></a>
      </li>
      
      
      <%}%>
      
      <%
          if(user==null)
          {
       %>
              <li class="nav-item">
        <a class="nav-link pl-2" href="index.jsp"> Home <i class="fa-solid fa-house"></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="login.jsp"> Message Us <i class='fas fa-comment-alt'></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link pl-2" href="login.jsp"> About Us <i class="fa fa-address-book"></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="login.jsp"> Login <i class="fa fa-user-circle "></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link pl-2" href="register.jsp"> Sign Up <i class="fa fa-user-plus"></i> </a>
      </li>
      
      <%
          }
        %>
      

<!--    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle pl-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa-light fa-list-dropdown"></i> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>  -->
      
      
      
      
      
<!--       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa-light fa-list-dropdown pl-2"></i> Setting
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#"><i class="fa-solid fa-address-card"></i>&nbsp; About Us</a>
            <a class="dropdown-item" href="#"><i class="fa-solid fa-phone"></i> &nbsp; Contact Us</a>
        </div>
      </li>  -->
      
      
  
    </ul>
      
       <form action="searchHome.jsp" method="post" class="form-inline my-2 my-lg-0 pl-2 ">
          
           <input name="search" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
<!--      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>-->
<button type="submit" class="btn btn-outline-light my-2 my-sm-0"> <i class="fa fa-search"></i> </button>
    
      </form>
      
      </div>
</nav>
      
      
<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">new Product</a>
      </li>
      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Shoes</a>
          <a class="dropdown-item" href="#">Clothes</a>
          
          <a class="dropdown-item" href="#">Books</a>
        </div>
      </li>
      
      
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>-->
       
       
    
       
  