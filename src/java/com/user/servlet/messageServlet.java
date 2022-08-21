/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.UserDAO;
import com.DAO.incDecRemDao;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class messageServlet extends HttpServlet {
    private Object DBConnection;

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            String subject = request.getParameter("subject");
            String body = request.getParameter("body");
            
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            
            String email = user.getEmail();
            
            UserDAO dao = new UserDAO(DBConnect.getConn());
            
            boolean f = dao.addMessage(subject , body , email);
            
            if(f)
            {
                response.sendRedirect("messageUs.jsp?msg=valid");
            }
            else
            {
                 response.sendRedirect("messageUs.jsp?msg=invalid");
            }
        }
    }

}
