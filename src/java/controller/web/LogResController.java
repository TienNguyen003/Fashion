/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import database.AccountDB;
import database.StoreDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Store;
import util.Email;
import util.PassEndcodeSHA;

/**
 *
 * @author Admin
 */
public class LogResController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if (action.equals("Register")) {
                String userName = request.getParameter("txtUserName");
                String email = request.getParameter("txtEmail");
                String pass = request.getParameter("txtPass");
                Account acc = new Account(userName, pass, email, "", "", "", "", "", "");
                AccountDB accDB = new AccountDB();
                Account getAcc = (Account) AccountDB.checkRes(userName, email);
                if (getAcc.getUsername() == null || getAcc.getEmail() == null) {
                    if (userName.equals("") && pass.equals("") && email.equals("")) {
                        request.setAttribute("errorRes", "<div class=\"alert alert-danger\">Tài khoản, Email và mật khẩu không được bỏ trống</div>");
                    } else if (userName.equals("")) {
                        request.setAttribute("errorRes", "<div class=\"alert alert-danger\">Tài khoản không được bỏ trống</div>");
                    } else if (email.equals("")) {
                        request.setAttribute("errorRes", "<div class=\"alert alert-danger\">Email không được bỏ trống</div>");
                    } else if (pass.equals("")) {
                        request.setAttribute("errorRes", "<div class=\"alert alert-danger\">Mật khẩu không được bỏ trống</div>");
                    } else {
                        String hashedPass = PassEndcodeSHA.encodePassword(pass);
                        accDB.insertSP(userName, hashedPass, email, "", "", "", "", "", "");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    }
                    RequestDispatcher rd = request.getRequestDispatcher("res.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("errorRes", "<div class=\"alert alert-danger\">Tài khoản đã tồn tại</div>");
                    RequestDispatcher rd = request.getRequestDispatcher("res.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("Login")) {
                HttpSession session = request.getSession();
                String userName = request.getParameter("txtUserName");
                String pass = request.getParameter("txtPass");  
                String hashedPass = PassEndcodeSHA.encodePassword(pass);
                Account getAcc = AccountDB.checkLogin(userName, hashedPass);
                if (getAcc.getUsername() != null) {
                    if (getAcc.getUsername().equals(userName) && getAcc.getPassword().equals(hashedPass)) {
                        session.setAttribute("userLog", userName);
                        Account rtAcc = AccountDB.checkAd(userName);
                        if (rtAcc.getRole().equals("admin") || rtAcc.getRole().equals("shop")) {
                            if(rtAcc.getRole().equals("shop")){
                                StoreDB sDB = new StoreDB();
                                Store s = StoreDB.getProducts((String)session.getAttribute("userLog"));
                                session.setAttribute("idShop", s.getId());
                            }
                            response.sendRedirect("admin.jsp");
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                } else {
                    if (userName.equals("") && pass.equals("")) {
                        request.setAttribute("errorLog", "<div class=\"alert alert-danger\">Tài khoản và mật khẩu không được bỏ trống</div>");
                    } else if (userName.equals("")) {
                        request.setAttribute("errorLog", "<div class=\"alert alert-danger\">Tài khoản không được bỏ trống</div>");
                    } else if (pass.equals("")) {
                        request.setAttribute("errorLog", "<div class=\"alert alert-danger\">Mật khẩu không được bỏ trống</div>");
                    } else {
                        request.setAttribute("errorLog", "<div class=\"alert alert-danger\">Tài khoản hoặc mật khẩu không chính xác</div>");
                    }
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } else if (action.equals("Logout")) {
                HttpSession session = request.getSession();
                session.setAttribute("userLog", null);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                session.setAttribute("idShop", "");
                rd.forward(request, response);
            } else if (action.equals("Forgot")) {
                String username = request.getParameter("txtUserName");
                String email = request.getParameter("txtEmail");
                int code = (int) Math.floor(((Math.random() * 899999) + 100000));
                String newPass = String.valueOf(code);
                if (!username.equals("") && !email.equals("")) {
                    new Email().sendEmail(username, email, "Forgot Password", "New password: " + newPass);
                    AccountDB accDB = new AccountDB();
                    String hashedPass = PassEndcodeSHA.encodePassword(newPass);
                    accDB.changePass(username, hashedPass);
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("forgot_pass.jsp");
                    rd.forward(request, response);
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("pages-error-404.jsp");
                rd.forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
