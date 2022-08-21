package com.user.servlet;

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

public class incDecRemove extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            
             HttpSession s = request.getSession();
             User user = (User) s.getAttribute("currentUser");
            
             String email = user.getEmail();
             
                     
            incDecRemDao dao = new incDecRemDao(DBConnect.getConn());
            
            if(quantity.equals("dec"))
            {
                String ans = (String) dao.decQuantity(id, email);
                
                if(ans.equals("possible"))
                    response.sendRedirect("myCart.jsp?msg=dec");
                
                else if(ans.equals("notpossible"))
                    response.sendRedirect("myCart.jsp?msg=notPossible");
            }
            
            else if(quantity.equals("inc"))
            {
                
                dao.incQuantity(id, email);
                
                response.sendRedirect("myCart.jsp?msg=inc");
                
            }
            
            else if(quantity.equals("remove"))
            {
                dao.remove(id, email);
                response.sendRedirect("myCart.jsp?msg=removed");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
