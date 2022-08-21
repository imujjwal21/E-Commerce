
<%@page import="java.util.List"%>
<%@page import="com.entity.product"%>
<%@page import="com.DAO.addProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page errorPage="../error_page.jsp" %>
<%@page import="com.entity.User"%>
<%@page import="java.sql.*"%>


<%
    
    User user12 = (User)session.getAttribute("currentUser");
    
    String email = user12.getEmail();
    
    String product_id = request.getParameter("id");
    
    int quantity=1;
    int product_price=0;
    int product_total=0;
    int cart_total=0;

    int z=0;
    
    try{
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product where id="+"'"+product_id+"'");
//    or we can write this    ("select * from product where id='"+product_id+"' ");
        
        while(rs.next())
        {
            product_price = rs.getInt(4);
//            product_price = rs.getInt(4);
            //rs.getString give error here b'coz it is int type .
            product_total=product_price;
        }
      
        ResultSet rs1 = st.executeQuery("select * from cart where product_id="+"'"+product_id+"'"+" and email="+"'"+email+"'"+" and address is NULL");
        while(rs1.next())
        {
            cart_total=rs1.getInt(5);
            cart_total=cart_total + product_total;
            quantity=rs1.getInt(3);
            quantity=quantity+1;
            z=1;
        }
        
        if(z==1)
        {
            st.executeUpdate("update cart set total ="+"'"+cart_total+"'" +",quantity="+"'"+quantity+"'"+" where product_id="+"'"+product_id+"'"+" and email="+"'"+email+"'"+" and address is NULL");
            // or by this st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id"' and email='"+email+"' address is NULL ");
            //response.sendRedirect("home.jsp?msg=exit");
            
            
//            jsp:forward page="home.jsp?msg=exist" />
              response.sendRedirect("index.jsp?msg=exist");
            
        }
        
        if(z==0)
        {
            PreparedStatement ps = con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, product_id);
            ps.setInt(3, quantity);
            ps.setInt(4, product_price);
            ps.setInt(5, product_total);
            ps.executeUpdate();
        
            response.sendRedirect("index.jsp?msg=added");
        }
        
    }catch(Exception e)
    {
        System.out.print(e);
        %>
        <jsp:forward page="home.jsp?msg=invalid" />
    <%
    }
%>