  

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
%>
        
      
     
              <li class="nav-item">
        <a class="nav-link pl-2" href="index.jsp"> Home <i class="fa-solid fa-house"></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="profile.jsp"> <%=user.getName()%> <i class='fas fa-user-alt'></i></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="changePassword.jsp"> Change Password <i class='fas fa-key'></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link pl-2" href="changeAddress.jsp"> Add or change Address <i class='fas fa-map-marker-alt'></i></a>
      </li>
      
      
      <li class="nav-item">
        <a class="nav-link pl-2" href="changeMobile.jsp"> Change Mobile Number <i class='fas fa-phone'></i> </a>
      </li>
      
     

      
  
    </ul>
      
       <form action="searchHome.jsp" method="post" class="form-inline my-2 my-lg-0 pl-2 ">
          
           <input name="search" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
<!--      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>-->
<button type="submit" class="btn btn-outline-light my-2 my-sm-0"> <i class="fa fa-search"></i> </button>
    
      </form>
      
      </div>
</nav>
  