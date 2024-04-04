/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import database.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Admin
 */
public class ChangePro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String action = request.getParameter("action");            
            ProductDB proDB = new ProductDB();
            HttpSession session = request.getSession();
            if(action.equals("changePro")){
                String idCate = request.getParameter("idCate");
                if(idCate.equals("")){
                    idCate = "1";
                }
                request.setAttribute("changeProducts", proDB.getAll(idCate));
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if(action.equals("searchProduct")){
                String search = request.getParameter("search");
                session.setAttribute("titleSearch", search);
                session.setAttribute("listSearch", proDB.showNProducts(search));
                RequestDispatcher rd = request.getRequestDispatcher("shopSearch.jsp");
                rd.forward(request, response);
            }          
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
