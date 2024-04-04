<%-- 
    Document   : navigation.jsp
    Created on : Oct 1, 2023, 9:26:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Header Inner -->
<div class="header-inner">
    <div class="container">
        <div class="cat-nav-head">
            <div class="row">
                <div class="col-12">
                    <div class="menu-area">
                        <!-- Main Menu -->
                        <nav class="navbar navbar-expand-lg">
                            <div class="navbar-collapse">	
                                <div class="nav-inner">	
                                    <ul class="nav main-menu menu navbar-nav">
                                        <li class="active"><a href="#">Home</a></li>
                                        <li><a href="#">Product</a></li>												
                                        <li><a href="#">Service</a></li>
                                        <li><a href="#">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                            <ul class="dropdown">
                                                <li><a href="shopGrid.jsp">Shop</a></li>
                                                <li><a href="cart.jsp">Cart</a></li>
                                                <li><a href="checkout.jsp">Invoice</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Pages<i class="ti-angle-down"></i></a>
                                            <ul class="dropdown">
                                                <li><a href="aboutUs.html">About Us</a></li>
                                            </ul>
                                        </li>								
                                        <li><a href="#">Blog<i class="ti-angle-down"></i></a>
                                            <ul class="dropdown">
                                                <li><a href="blog-single-sidebar.jsp">Blog</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.jsp">Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
