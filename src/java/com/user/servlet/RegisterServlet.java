package com.user.servlet;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@MultipartConfig

public class RegisterServlet extends HttpServlet {
    private Object ConnectionProvider;

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            //fetch all data 
            
            //HttpSession session = request.getSession();
            
            UserDAO dao=new UserDAO(DBConnect.getConn());
            
            
            String check=request.getParameter("check");
            String useremail=request.getParameter("email");
            
            System.out.print(check);
            
            if(check==null)
            {
                out.print("Box not checked .");
//                session.setAttribute("msg", "box");
//                response.sendRedirect("register.jsp");
            }
            else if(dao.CheckUserExistency(useremail))
            {
                out.print("This E-mail Already Exit ! Please Enter Another . ");
//                session.setAttribute("msg", "exist");
//                response.sendRedirect("register.jsp");
            }
           
            
            else
            {
                String name = request.getParameter("fname");
                String email = request.getParameter("email");
                String phno = request.getParameter("phno");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                
               //System.out.print(name+"  "+email+"  "+phno+"  "+password+"  "+gender+"\n");

                //create user obj and set all data to that obj.
                User user =new User(name,email,password,phno,gender);
                
                // constructor banane ke jagah yeh bhi kar sakta tha
                
                //iske ander ke details ko replace karna hai naye wale se .
                
          //                User user = new User();
                
//            user.setEmail(name);
//            user.setName(email);
//            user.setPassword(password);
//            user.setAbout(phno);
//            user.setGender(gender);
                
                
                //create obj of user dao .
                
//                System.out.print(1+"\n");
                if(dao.UserRegister(user))
                {
                    out.println("done");
//                    session.setAttribute("msg", "done");
//                    response.sendRedirect("register.jsp");
                }
                else
                {
                    out.println("error");
//                    session.setAttribute("msg", "error");
//                    response.sendRedirect("register.jsp");
                }
            }
            
            
            
            
        }
    }

}
