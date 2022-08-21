

<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
<link rel="stylesheet" href="all_component/addressPaymentForOrder.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style>
   .brand{
                
                color: white;
                text-align: center;
                font-size: 70px; 
                margin:0;
                padding: 10px;
            }
</style>

<title>Home</title>

<script>
    if(window.history.forward(1) != null)
        window.history.forward;
</script>

</head>

<body>
    
    <h1 class="brand" > <span class="fa fa-asterisk"></span> Shopy.com</h1>

<br>
<table>
<thead>
        <%
            User user = (User) session.getAttribute("currentUser");
            
            int total=0;
            int sno=0;
             
            try{
            Connection con = DBConnect.getConn();
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery("select sum(total) from cart where email="+"'"+user.getEmail()+"'"+" and address is NULL");
            
            while(rs1.next())
            {
                total=rs1.getInt(1);
            }
        %>

          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total);%> </th>
          </tr> 

        </thead>
        
        <thead>
          <tr>
              
            <th scope="col">S.No</th>
            <th scope="col">Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th> 
            
          </tr>
        </thead>
        
        <tbody>
        
            <%
            ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email="+"'"+user.getEmail()+"'"+" and cart.address is NULL");    
            
            while(rs.next())
            {  
           %>
           
          <tr>
            <%sno=sno+1; %>
            <td><%out.print(sno); %></td>
            <td> <img src="admin/pImages/<%=rs.getString(6)%>" style="width:50px; height:50px;" > </td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(9) %> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(11) %> </td>
            </tr>
            
            
         
            <%
            }
            ResultSet rs2 = st.executeQuery("select * from user where email="+"'"+user.getEmail()+"'");
            //("select * from user where email='"+email+"' "); also written as like this .
            while(rs2.next())
            {
            %>
        </tbody>
      </table>
      
<hr style="width: 100%">

<form action="addressPaymentForOrderAction.jsp" method="post">
    
 <div class="left-div">
 <h3>Enter Address</h3>
 <input  class="input-style" type="text" name="address" value="<%=rs2.getString(6)%>" placeholder="Enter Address" required>
 </div>
 
<div class="right-div">
<h3>Enter city</h3>
 <input class="input-style" type="text" name="city" value="<%=rs2.getString(7)%>" placeholder="Enter City" required>

</div> 

<div class="left-div">
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs2.getString(8)%>" placeholder="Enter State" required>

</div>

<div class="right-div">
<h3>Enter Pin Code</h3>
 <input  class="input-style" type="text" name="pincode" value="<%=rs2.getString(9)%>" placeholder="Enter Pin Code" required>

</div>

 <!--<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>-->

<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
    
<h3>Select way of Payment</h3>
    <select class="input-style" name="paymentMethod">
        <option values="Cash on delivery(COD)">Cash on delivery(COD)</option>
        <option values="Online Payment">Online Payment</option>
    </select>
</div>

<div class="right-div">
<h3>Pay online on this 9571324153@gpay.com</h3>
 
<input  class="input-style" type="text" name="transactionId"  placeholder="Enter Transaction Id">


<h3 style="color: red">*For online Payment then enter you transaction ID </h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
 <input  class="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(4)%>" placeholder="Enter Mobile Number" required>


<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>

<button class="button" type="submit">Proceed to Generate Bill & Save<i class='far fa-arrow-alt-circle-right'></i></button>

<h3 style="color: red">*Fill form correctly</h3>
</div>
    
    </form>

        <%
         
            }
            }catch(Exception e)
            {
            System.out.print(e);
            }  
          %>
      <br>
      <br>
      <br>

      
      <div class="footer">
          <p>Founder and Designer .</p>
      </div>
      
      </body>
      
      
</html>