<%-- 
    Document   : header
    Created on : Sep 16, 2023, 4:08:34 PM
    Author     : Admin
--%>

<%@page import="database.OrderDB"%>
<%@page import="database.AccountDB"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String acc = (String) session.getAttribute("userLog"); %>
<!-- Topbar -->
<div class="topbar">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-12 col-12">
                <!-- Top Left -->
                <div class="top-left">
                    <ul class="list-main">
                        <li><i class="ti-headphone-alt"></i> +84 123-456</li>
                        <li><i class="ti-email"></i> dinhtien17082003@gmail.com</li>
                    </ul>
                </div>
                <!--/ End Top Left -->
            </div>
            <div class="col-lg-7 col-md-12 col-12">
                <!-- Top Right -->
                <div class="right-content">
                    <ul class="list-main">
                        <li><i class="ti-location-pin"></i> Store location</li>
                        <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>                               
                            <%  if (acc != null) {
                                    out.print("<li><i class=\"ti-user\"></i><a>Xin chào " + acc + "</a></li>");
                                } else {
                                    out.print("<li><i class=\"ti-user\"></i><a href=\"login.jsp#\">Login</a></li>");
                                }
                            %>
                        <li><i class="ti-power-off"></i><a href="res.jsp#">Register</a></li>                                
                    </ul>
                </div>
                <!-- End Top Right -->
            </div>
        </div>
    </div>
</div>
<!-- End Topbar -->
<div class="middle-inner">
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-12">
                <!-- Logo -->
                <div class="logo">
                    <a href="index.jsp"><img style="width: 100%" src="images/logo.png" alt="logo"></a>
                </div>
                <!--/ End Logo -->
                <!-- Search Form -->
                <div class="search-top">
                    <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                    <!-- Search Form -->
                    <div class="search-top">
                        <form class="search-form">
                            <input type="text" placeholder="Search here..." name="search">
                            <button value="search" type="submit"><i class="ti-search"></i></button>
                        </form>
                    </div>
                    <!--/ End Search Form -->
                </div>
                <!--/ End Search Form -->
                <div class="mobile-nav"></div>
            </div>
            <div class="col-lg-8 col-md-7 col-12">
                <div class="search-bar-top">
                    <div class="search-bar">
                        <select>
                            <option selected="selected">All Category</option>
                            <option>watch</option>
                            <option>mobile</option>
                            <option>kid’s item</option>
                        </select>
                        <form action="ChangePro">
                            <input name="search" placeholder="Search Products Here....." type="search">
                            <button name="action" value="searchProduct" class="btnn"><i class="ti-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-12">
                <div class="right-bar">
                    <!-- Search Form -->
                    <div class="sinlge-bar">
                        <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                    </div>
                    <div class="sinlge-bar">
                        <%
                            if (acc == null) {
                                out.print("<a href=\"profile.jsp\" class=\"single-icon\"><i class=\"fa fa-user-circle-o\" aria-hidden=\"true\"></i></a>");
                            } else {
                                Account rtAcc = AccountDB.checkAd(acc);
                                if (rtAcc.getRole().equals("admin") || rtAcc.getRole().equals("shop")) {
                                    out.print("<a href=\"admin.jsp\" class=\"single-icon\"><i class=\"fa fa-user-circle-o\" aria-hidden=\"true\"></i></a>");                                    
                                } else {
                                    out.print("<a href=\"profile.jsp\" class=\"single-icon\"><i class=\"fa fa-user-circle-o\" aria-hidden=\"true\"></i></a>");
                                }
                            }
                        %>                                
                    </div>
                    <div class="sinlge-bar shopping">
                        <a href="cart.jsp" class="single-icon"><i class="ti-bag"></i> <span class="total-count">
                                <% OrderDB odDB = new OrderDB();
                                            out.print(odDB.countProUser(acc));%></span></a>                                
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
