/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import database.OrderDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order_product;

/**
 *
 * @author Admin
 */
public class CartAddController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            String acc = (String) session.getAttribute("userLog");            
            if (acc == null) {
                out.print("""
                          <div style="text-align: center;" class="alert alert-warning">B\u1ea1n c\u1ea7n \u0111\u0103ng nh\u1eadp m\u1edbi d\u1eed d\u1ee5ng \u0111\u01b0\u1ee3c ch\u1ee9c n\u0103ng n\u00e0y
                          </div>""");
            } else {
                String name = request.getParameter("namePro");
                String image = request.getParameter("imagePro");
                String id = request.getParameter("idPro");
                String priceSt = request.getParameter("pricePro");
                String priceNew = (priceSt.replace("₫", ""));
                String shopName = request.getParameter("shopName");
                float price = Float.parseFloat((priceNew.replace(",", ".")).replace(".", ""));
                String quantityPro = request.getParameter("quantityPro");
                int quantityAll = Integer.parseInt(quantityPro);
                String des = request.getParameter("desPro");
                OrderDB orderDB = new OrderDB();
                List<Order_product> listOrder = OrderDB.getProducts(acc);
                int dem = 0;
                int quantity = 0;
                for (Order_product sp : listOrder) {                    
                    if (sp.getList_id().equals(id)) {                        
                        dem++;
                        quantity = Integer.parseInt(sp.getTotal_quantity());                        
                    }
                }
                if (dem == 0) {
                    orderDB.insertSP(acc, id, shopName, name, quantityPro, String.valueOf(price * quantityAll), image, des);
                } else {
                    orderDB.updateSP(acc, id, String.valueOf(quantity + quantityAll), String.valueOf(price * (quantity + quantityAll)));
                }
                out.print("<div class=\"alert alert-success\" role=\"alert\">\n" +
"                    Thêm thành công\n" +
"                </div>");
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
