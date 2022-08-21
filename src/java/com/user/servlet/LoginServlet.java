package com.user.servlet;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.Message;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession session = request.getSession();
            
            try{
               
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            System.out.print(email+" "+password+"\n");
            
            if("admin@gmail.com".equals(email) && "admin".equals(password))
            {
                
                User user = new User();
                user.setEmail(email);
                //         name of session , jis chej ko session mein daalna hai
                session.setAttribute("currentUser", user);System.out.print("hello bro");
                response.sendRedirect("admin/adminHome.jsp");
            }
            else
            {
                UserDAO dao=new UserDAO(DBConnect.getConn());
                
                User user = dao.getUserByEmailAndPassword(email, password);
                
                if(user!=null)
                {            //name of session , jis chej ko session mein daalna hai
                    session.setAttribute("currentUser", user);
//                    response.sendRedirect("profile.jsp");
                     response.sendRedirect("index.jsp");
                }
                else
                {
                     Message msg = new Message("Incorrect Email or Password ! Try Again","error","alert-danger");
                
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);   //"msg" yeh name hai get karne ke kaam aayega or , wala msg value hai (Message ka obj wala) .
               
                    response.sendRedirect("login.jsp");
                }
            }
            
            }catch(Exception e)
            {
                System.out.print(e);
            }
        }
    }
}
