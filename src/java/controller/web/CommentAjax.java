/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import com.google.gson.Gson;
import database.AccountDB;
import database.CommentDB;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CommentAjax extends HttpServlet {

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
            
            
            HttpSession session = request.getSession();
            String acc = (String) session.getAttribute("userLog");
            String name = request.getParameter("name");
            String content = request.getParameter("message");
            String idPro = request.getParameter("idPro");
            LocalDate currentDate = LocalDate.now();
            AccountDB accDB = new AccountDB();
            Account getAcc = accDB.getProducts(acc);
            String urlImg;
            if (!getAcc.getImage().equals("")) {
                urlImg = getAcc.getImage();
            } else {
                urlImg = "https://www.lottemart.vn/asset/images/icon-default-avatar.svg";
            }
            CommentDB cmDB = new CommentDB();
            cmDB.insertCM(acc, idPro, content, name, currentDate.toString(), urlImg);
            List<CommentDB> comments = comment(idPro);
        
            Gson gson = new Gson();
            String json = gson.toJson(comments);

            response.getWriter().write(json);
        }
    }
    
    private List comment(String idPro){
        List<CommentDB> newB = (List)CommentDB.getIdProduct(idPro);        
        return newB;
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
