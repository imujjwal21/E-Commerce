
package com.user.servlet;

import com.DAO.addProductDao;
import com.DB.DBConnect;
import com.DB.Helper;
import com.entity.product;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



@MultipartConfig
public class addProduct extends HttpServlet {
    private Object session;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
//            int id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String  price = request.getParameter("price");
            String active = request.getParameter("active");
            
            Part part = request.getPart("pic");    // all details of pic come into to the part 
            
            // getting current user id
          
            
            product p = new product( name , category , price , active , part.getSubmittedFileName());
            
        //(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, userId);
            
           //pid auto increment hai  and cid hai category id an userId session se nikal le and pDate = null kyuki wo apne aap le lega .
            
            addProductDao dao = new addProductDao(DBConnect.getConn());
//            System.out.print("Hey Bro\n");
            if(dao.savePost(p))
            {
//                System.out.print("Hey Bro1\n");
                String path = request.getRealPath("/")+"admin/pImages" + File.separator + part.getSubmittedFileName();
//                request.getRealPath hame web Page folder tak le aayega .  File.separator give /
                Helper.saveFile(part.getInputStream(), path);
//                System.out.print("Hey Bro3\n");
                out.println("done");
               
                
                response.sendRedirect("admin/addNewProduct.jsp?msg=done");
            }
            else
            {
                out.println("error");
                response.sendRedirect("addNewProduct.jsp?msg=wrong");
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
