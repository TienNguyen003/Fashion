/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import database.AccountDB;
import database.OrderDB;
import database.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ControllerCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();

            if (action.equals("btnUpdateAcc")) {
                String name = request.getParameter("name");
                String phone = request.getParameter("number");
                String address = request.getParameter("address");
                String date = request.getParameter("date");
                String acc = (String) session.getAttribute("userLog");
                AccountDB dbAcc = new AccountDB();
                dbAcc.updateSP(name , date, address, "", phone, "", acc);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else if (action.equals("View Product")) {
                request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
            } else if (action.equals("Delete Cart")) {
                String acc = (String) session.getAttribute("userLog");
                String id = request.getParameter("txtId");
                OrderDB orderDB = new OrderDB();
                orderDB.deleteSP(acc, id);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else if (action.equals("btnPay")) {
                String idPro = request.getParameter("idPro"); // id san pham
                String[] arrId = idPro.split(",");
                String quantityPro = request.getParameter("quantityPro"); // so luong san pham
                String[] arrQuanti = quantityPro.split(",");
                String pricePro = request.getParameter("pricePro"); // gia san pham
                String shopPro = request.getParameter("shopPro"); // shop
                request.setAttribute("priceBuy", pricePro);
                session.setAttribute("idPro", idPro);
                session.setAttribute("shopPro", shopPro);
                session.setAttribute("quantityPro", quantityPro);
                ProductDB proDB = new ProductDB();
                int count = 0;
                for (int i = 0; i < arrId.length; i++) {
                    if (proDB.checkQuantitySP(Integer.parseInt(arrQuanti[i]), arrId[i])) {
                        count++;                        
                    }
                }
                if(count == arrId.length){
                    request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
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
