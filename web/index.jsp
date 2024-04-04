<%--
    Document   : index.jsp
    Created on : Sep 16, 2023, 3:38:08 PM
    Author     : Admin
--%>

<%@page import="database.CategoryDB"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="database.ProductDB"%>
<%@page import="model.Products"%>
<%@page import="util.PassEndcodeSHA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Azalea</title>
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/niceselect.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/slicknav.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body class="js">

        <!-- Preloader -->
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- End Preloader -->

        <%
            if (session.getAttribute("userLog") == null) {
                if (request.getParameter("action") != null) {
                    if (request.getParameter("action").equals("Add to cart")) {
                        out.print("<div style=\"text-align: center;\" class=\"alert alert-warning\">"
                                + "Bạn cần đăng nhập mới dử dụng được chức năng này."
                                + "</div>");
                    }
                }
            }
        %>

        <!-- Header -->
        <header class="header shop">
            <jsp:include page="header/header.jsp"></jsp:include>
            <jsp:include page="header/navigation.jsp"></jsp:include>

                <!-- Slider Area -->
                <section class="hero-slider">
                    <!-- Single Slider -->
                    <div class="single-slider">
                        <div class="container">
                            <div class="row no-gutters">
                                <div class="col-lg-9 offset-lg-3 col-12">
                                    <div class="text-inner">
                                        <div class="row">
                                            <div class="col-lg-7 col-12">
                                                <div class="hero-text">
                                                    <h1><span>UP TO 50% OFF </span>Shirt For Man</h1>
                                                    <p>Maboriosam in a nesciung eget magnae <br> dapibus disting tloctio in the find it pereri <br> odiy maboriosm.</p>
                                                    <div class="button">
                                                        <a href="#" class="btn">Shop Now!</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ End Single Slider -->
                </section>
                <!--/ End Slider Area -->

                <!-- Start Small Banner  -->
                <section class="small-banner section">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- Single Banner  -->
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="single-banner">
                                    <img src="https://wpthemesgrid.com/themes/free/eshop/images/mini-banner1.jpg" alt="#">
                                    <div class="content">
                                        <p>Man's Collectons</p>
                                        <h3>Summer travel <br> collection</h3>
                                        <a href="#">Discover Now</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /End Single Banner  -->
                            <!-- Single Banner  -->
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="single-banner">
                                    <img src="https://wpthemesgrid.com/themes/free/eshop/images/mini-banner2.jpg" alt="#">
                                    <div class="content">
                                        <p>Bag Collectons</p>
                                        <h3>Awesome Bag <br> 2023</h3>
                                        <a href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /End Single Banner  -->
                            <!-- Single Banner  -->
                            <div class="col-lg-4 col-12">
                                <div class="single-banner tab-height">
                                    <img src="https://wpthemesgrid.com/themes/free/eshop/images/mini-banner3.jpg" alt="#">
                                    <div class="content">
                                        <p>Flash Sale</p>
                                        <h3>Mid Season <br> Up to <span>40%</span> Off</h3>
                                        <a href="#">Discover Now</a>
                                    </div>
                                </div>
                            </div>
                            <!-- /End Single Banner  -->
                        </div>
                    </div>
                </section>
                <!-- End Small Banner -->

                <!-- Start Product Area -->
                <div class="product-area section">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="section-title">
                                    <h2>Trending Item</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="product-info">
                                    <div class="nav-main" style="display: flex; justify-content: center">
                                    <%
                                        List<Category> c = CategoryDB.getAll(1);
                                        for (Category item : c) {
                                            out.print("<form action='ChangePro'><button class='btn typePro' name='action' value='changePro' style='background: #fff;'>" + item.getName() + "</button>"
                                                    + "<input type='hidden' name='idCate' value='" + item.getId() + "'></form>");
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <%
                                                List<Products> products = (List<Products>) (request.getAttribute("changeProducts"));
                                                List<Products> newList = new ArrayList<Products>();
                                                if (products != null) {
                                                    newList = products;

                                                } else {
                                                    List<Products> lists = ProductDB.getAll("1");
                                                    newList = lists;
                                                }
                                                for (Products sp : newList) {
                                                    String price = PassEndcodeSHA.formatVnd(sp.getPrice());
                                                    String priceDiscount = PassEndcodeSHA.formatVnd((sp.getPrice() - (sp.getPrice() * (sp.getDiscount() / 100))));
                                                    out.print("<div class=\"col-xl-3 col-lg-4 col-md-4 col-12\">"
                                                            + "<div class=\"single-product\">"
                                                            + "<div class=\"product-img\">"
                                                            + "<a href=\"#\">"
                                                            + "<img class=\"default-img\" src=" + sp.getImage() + " alt=\"#\">"
                                                            + "<img class=\"hover-img\" src=" + sp.getImage() + " alt=\"#\">"
                                                            + "<span class=\"price-dec\">" + (int) sp.getDiscount() + "% Off</span>"
                                                            + "</a>"
                                                            + "<div class=\"button-head\">"
                                                            + "<div class=\"product-action\" style=\"width:150px\">"
                                                            + "<a style=\"margin-right:50px\" title=\"Wishlist\" href=\"#\"><i class=\" ti-heart \"></i><span>Add to Wishlist</span></a>"
                                                            + "<a title=\"Compare\" href=\"#\"><i class=\"ti-bar-chart-alt\"></i><span>Add to Compare</span></a>"
                                                            + "</div>"
                                                            + "<div style=\"width:80px; position:unset\" class=\"product-action-2\">"
                                                            + "<form action=\"ControllerCart\">"
                                                            + "<tr>"
                                                            + "<button style=\"margin:17px 15px 0 0; float:right\" type=\"submit\" name=\"action\" value=\"View Product\" title=\"View Product\"><i class=\" ti-eye\"></i></button>"
                                                            + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                                            + "</tr>"
                                                            + "</form> "
                                                            + "</div>"
                                                            + "</div>"
                                                            + "</div>"
                                                            + "<div class=\"product-content\">"
                                                            + "<form action=\"ControllerCart\">"
                                                            + "<h3><a class=\"product-des\" href=\"#\">"
                                                            + "<button style=\"text-align:left;line-height: 1.5;font-weight:500\" name=\"action\" value=\"View Product\">" + sp.getName() + "</button>"
                                                            + "</a></h3>"
                                                            + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                                            + "</form> "
                                                            + "<div class=\"product-price\">"
                                                            + "<span class=\"old\">" + price.substring(0, price.indexOf(".") + 0) + "</span>"
                                                            + "<span style=\"color:#ed1b24\">&nbsp;&nbsp;" + priceDiscount.substring(0, priceDiscount.indexOf(".") + 0) + "</span>"
                                                            + "</div>"
                                                            + "</div>"
                                                            + "</div>"
                                                            + "</div>");
                                                }
                                            %>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Product Area -->

        <!-- Start Midium Banner  -->
        <section class="midium-banner">
            <div class="container">
                <div class="row">
                    <!-- Single Banner  -->
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner">
                            <img src="https://i.pinimg.com/564x/72/e1/1c/72e11ca280c09ad0e12c7118c09d6c04.jpg" alt="#">
                            <div class="content">
                                <p>Man's Collectons</p>
                                <h3>Man's items <br>Up to<span> 50%</span></h3>
                                <a href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- /End Single Banner  -->
                    <!-- Single Banner  -->
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner">
                            <img src="https://i.pinimg.com/564x/1d/fb/b4/1dfbb46d5c195ef92fca7bcf7d3f0f96.jpg" alt="#">
                            <div class="content">
                                <p>shoes women</p>
                                <h3>mid season <br> up to <span>70%</span></h3>
                                <a href="#" class="btn">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- /End Single Banner  -->
                </div>
            </div>
        </section>
        <!-- End Midium Banner -->

        <!-- Start Most Popular -->
        <div class="product-area most-popular section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Hot Item</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="owl-carousel popular-slider">
                            <%
                                List<Products> listItem = ProductDB.getAll("1");
                                for (Products sp : listItem) {
                                    String price = PassEndcodeSHA.formatVnd(sp.getPrice());
                                    String priceDiscount = PassEndcodeSHA.formatVnd((sp.getPrice() - (sp.getPrice() * (sp.getDiscount() / 100))));
                                    out.print("<div class=\"single-product\">"
                                            + "<div class=\"product-img\">"
                                            + "<a href=\"#\">"
                                            + "<img class=\"default-img\" src=" + sp.getImage() + " alt=\"#\">"
                                            + "<img class=\"hover-img\" src=" + sp.getImage() + " alt=\"#\">"
                                            + "<span class=\"out-of-stock\">" + (int) sp.getDiscount() + "% OFF</span>"
                                            + "</a>"
                                            + "<div class=\"button-head\">"
                                            + "<div class=\"product-action\" style=\"width:150px\">"
                                            + "<a style=\"margin-right:50px\" title=\"Wishlist\" href=\"#\"><i class=\" ti-heart \"></i><span>Add to Wishlist</span></a>"
                                            + "<a title=\"Compare\" href=\"#\"><i class=\"ti-bar-chart-alt\"></i><span>Add to Compare</span></a>"
                                            + "</div>"
                                            + "<div style=\"width:80px; position:unset\" class=\"product-action-2\">"
                                            + "<form action=\"ControllerCart\">"
                                            + "<tr>"
                                            + "<button style=\"margin:17px 15px 0 0; float:right\" type=\"submit\" name=\"action\" value=\"View Product\" title=\"View Product\"><i class=\" ti-eye\"></i></button>"
                                            + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                            + "</tr>"
                                            + "</form> "
                                            + "</div>"
                                            + "</div>"
                                            + "</div>"
                                            + "<div class=\"product-content\">"
                                            + "<form action=\"ControllerCart\">"
                                            + "<h3><a class=\"product-des\" href=\"#\">"
                                            + "<button style=\"text-align:left;line-height: 1.5;font-weight:500\" name=\"action\" value=\"View Product\">" + sp.getName() + "</button>"
                                            + "</a></h3>"
                                            + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                            + "</form> "
                                            + "<div class=\"product-price\">"
                                            + "<span class=\"old\">" + price.substring(0, price.indexOf(".") + 0) + "</span>"
                                            + "<span style=\"color:#ed1b24\">&nbsp;&nbsp;" + priceDiscount.substring(0, priceDiscount.indexOf(".") + 0) + "</span>"
                                            + "</div>"
                                            + "</div>"
                                            + "</div>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Most Popular Area -->

        <!-- Start Shop Home List  -->
        <section class="shop-home-list section">
            <div class="container">
                <div class="row">
                    <%
                        List<Category> cate = CategoryDB.getAll(0);
                        for (Category item : cate) {
                            out.print("<div class='col-lg-4 col-md-6 col-12'>");
                            out.print("<div class='row'>"
                                    + "<div class=\"col-12\">"
                                    + "<div class=\"shop-section-title\">"
                                    + "<h1>" + item.getName() + "</h1>"
                                    + "</div>"
                                    + "</div>");
                            List<Products> list = ProductDB.getAll(String.valueOf(item.getId()));
                            for (Products sp : list) {
                                String price = PassEndcodeSHA.formatVnd(sp.getPrice());
                                out.print("<div class=\"single-list\">"
                                        + "<div class=\"row\">"
                                        + "<div class=\"col-lg-6 col-md-6 col-12\">"
                                        + "<div class=\"list-image overlay\">"
                                        + "<img src=" + sp.getImage() + " alt=\"#\">"
                                        + "<a href=\'ControllerCart?action=View+Product&txtId=" + sp.getId() + "' class=\"buy\"><i class=\"fa fa-shopping-bag\"></i></a>"
                                        + "</div>"
                                        + "</div>"
                                        + "<div class=\"col-lg-6 col-md-6 col-12\">"
                                        + "<div class=\"content\">"
                                        + "<form action=\"ControllerCart\">"
                                        + "<h3><a class=\"product-des\" href=\"#\">"
                                        + "<button style=\"text-align:left;line-height: 1.5;font-weight:500\" name=\"action\" value=\"View Product\">" + sp.getName() + "</button>"
                                        + "</a></h3>"
                                        + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getId() + "'>"
                                        + "</form> "
                                        + "<p class=\"price with-discount\">" + price.substring(0, price.indexOf(".") + 0) + "</p>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>");
                            }
                            out.print("</div></div>");
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- End Shop Home List  -->

        <section class="cown-down">
            <div class="section-inner ">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 col-12 padding-right">
                            <div class="image">
                                <img src="https://wpthemesgrid.com/themes/eshop/images/count-down-image.jpg" alt="#">
                            </div>
                        </div>
                        <div class="col-lg-6 col-12 padding-left">
                            <div class="content">
                                <div class="heading-block">
                                    <p class="small-title">Deal of day</p>
                                    <h3 class="title">Beatutyful dress for women</h3>
                                    <p class="text">Suspendisse massa leo, vestibulum cursus nulla sit amet, frungilla placerat lorem. Cars fermentum, sapien. </p>
                                    <h1 class="price">$1200 <s>$1890</s></h1>
                                    <div class="coming-time">
                                        <div class="clearfix" data-countdown="2023/02/30"><div class="cdown"><span class="days"><strong>0</strong><p>Days.</p></span></div><div class="cdown"><span class="hour"><strong> 0</strong><p>Hours.</p></span></div> <div class="cdown"><span class="minutes"><strong>00</strong> <p>MINUTES.</p></span></div><div class="cdown"><span class="second"><strong> 00</strong><p>SECONDS.</p></span></div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Start Shop Blog  -->
        <section class="shop-blog section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>From Our Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Blog  -->
                        <div class="shop-single-blog">
                            <img src="https://wpthemesgrid.com/themes/free/eshop/images/blog1.jpg" alt="#">
                            <div class="content">
                                <p class="date">22 May , 2023. Monday</p>
                                <a href="#" class="title">Sed adipiscing ornare.</a>
                                <a href="#" class="more-btn">Continue Reading</a>
                            </div>
                        </div>
                        <!-- End Single Blog  -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Blog  -->
                        <div class="shop-single-blog">
                            <img src="https://wpthemesgrid.com/themes/free/eshop/images/blog2.jpg" alt="#">
                            <div class="content">
                                <p class="date">22 May, 2023. Monday</p>
                                <a href="#" class="title">Man’s Fashion Winter Sale</a>
                                <a href="#" class="more-btn">Continue Reading</a>
                            </div>
                        </div>
                        <!-- End Single Blog  -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Blog  -->
                        <div class="shop-single-blog">
                            <img src="https://wpthemesgrid.com/themes/free/eshop/images/blog3.jpg" alt="#">
                            <div class="content">
                                <p class="date">22 May, 2023. Monday</p>
                                <a href="#" class="title">Women Fashion Festive</a>
                                <a href="#" class="more-btn">Continue Reading</a>
                            </div>
                        </div>
                        <!-- End Single Blog  -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Blog  -->


        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row no-gutters">
                            <div class="col-lg-6 offset-lg-3 col-12">
                                <h4 style="margin-top:100px;font-size:14px; font-weight:500; color:#F7941D; display:block; margin-bottom:5px;">Eshop Free Lite</h4>
                                <h3 style="font-size:30px;color:#333;">Currently You are using free lite Version of Eshop.<h3>
                                        <p style="display:block; margin-top:20px; color:#888; font-size:14px; font-weight:400;">Please, purchase full version of the template to get all pages, features and commercial license</p>
                                        <div class="button" style="margin-top:30px;">
                                            <a href="https://wpthemesgrid.com/downloads/eshop-ecommerce-html5-template/" target="_blank" class="btn" style="color:#fff;">Buy Now!</a>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!-- Modal end -->

                                        <!-- Start Footer Area -->
                                        <footer>
                                            <jsp:include page="footer/footer.jsp"></jsp:include>
                                        </footer>
                                        <!-- /End Footer Area -->

                                        <script src="js/jquery.min.js"></script>
                                        <script src="js/jquery-migrate-3.0.0.js"></script>
                                        <script src="js/jquery-ui.min.js"></script>
                                        <script src="js/popper.min.js"></script>
                                        <script src="js/bootstrap.min.js"></script>
                                        <script src="js/slicknav.min.js"></script>
                                        <script src="js/owl-carousel.js"></script>
                                        <script src="js/magnific-popup.js"></script>
                                        <script src="js/waypoints.min.js"></script>
                                        <script src="js/finalcountdown.min.js"></script>
                                        <script src="js/nicesellect.js"></script>
                                        <script src="js/flex-slider.js"></script>
                                        <script src="js/scrollup.js"></script>
                                        <script src="js/onepage-nav.min.js"></script>
                                        <script src="js/easing.js"></script>
                                        <script src="js/active.js"></script>
                                        </body>
                                        <script>
                                            let typePro = document.querySelectorAll(".typePro");
                                            let urlCurrent = window.location.href;
                                            let index = urlCurrent.replace("http://localhost:8080/NewFashion/ChangePro?action=changePro&idCate=", '');
                                            if (!isNaN(Number(index))) {
                                                typePro[index - 1].style.background = "#F7941D";
                                            }
                                        </script>
                                        </html>