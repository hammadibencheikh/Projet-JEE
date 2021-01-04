/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;
import models.Article;

import dao.DAOUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author 21627
 */
@WebServlet(name = "Addarticle", urlPatterns = {"/Addarticle"})
@MultipartConfig
public class Addarticle extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addarticle</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addarticle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        try {
                   String titre=request.getParameter("titre");         
                   String bio=request.getParameter("bio");  
                   String img=request.getParameter("img");  
            Connection con=DAOUtil.getConnection();
            PreparedStatement ps=con.prepareStatement("INSERT INTO `article`(`titre`, `bio`, `img`) VALUES (?,?,?)");
     

         /* Part p=request.getPart("img");
            String filename= p.getHeader("content-disposition");
                    for(String s:filename.split(";")){
                        if(s.trim().startsWith("filename")){
                            filename=s.substring(s.indexOf("=")+1).trim().replace("\"","");
                            filename=filename.substring(filename.lastIndexOf('/')+1).substring(filename.lastIndexOf('\\')+1);
                        }
                    }
                    p.write(getServletContext().getRealPath("/img/"+filename));*/
                         ps.setString(1, titre);
            ps.setString(2, bio);
            ps.setString(3, img);
            ps.executeUpdate();
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
 } catch (Exception ex) {
            Logger.getLogger(Addarticle.class.getName()).log(Level.SEVERE, null, ex);
        }
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
