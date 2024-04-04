<%-- 
    Document   : detailProduct
    Created on : Oct 8, 2023, 10:54:37 PM
    Author     : Admin
--%>

<%@page import="database.CommentDB"%>
<%@page import="model.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="database.ProductDB"%>
<%@page import="model.Products"%>
<%@page import="util.PassEndcodeSHA"%>
<%String acc = (String) session.getAttribute("userLog");%>
<!DOCTYPE html>
<html lang="zxx"><head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="copyright" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Azalea - Detail Product</title>   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;display=swap" rel="stylesheet">
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
        <link rel="stylesheet" href="#" id="colors">
    </head>
    <body class="js">
        <%
            String proId = request.getParameter("txtId");
            ProductDB db = new ProductDB();
            Products product = db.getProducts(proId);
        %>

        <div class="preloader" style="display: none;">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>


        <header class="header shop">
            <jsp:include page="header/header.jsp"></jsp:include>
            <jsp:include page="header/navigation.jsp"></jsp:include>
            </header>


            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="index.jsp">Home<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="detailProduct.jsp">Shop Details</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="shop single section">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                            <%
                                String price = PassEndcodeSHA.formatVnd(product.getPrice());
                                String priceDiscount = PassEndcodeSHA.formatVnd((product.getPrice() - (product.getPrice() * (product.getDiscount() / 100))));
                                String[] size = (product.getSize()).split(",");
                                String[] listImg = (product.getListImg()).split(",");
                                String[] color = (product.getColor()).split(",");
                                out.print("<div class=\"col-lg-6 col-12\">"
                                        + "<div class=\"product-gallery\">"
                                        + "<div class=\"flexslider-thumbnails\">"
                                        + "<div class=\"flex-viewport\" style=\"overflow: hidden; position: relative;\">"
                                        + "<ul class=\"slides\" style=\"width: 1200%; transition-duration: 0s; transform: translate3d(-1110px, 0px, 0px);\">");
                                for (String item : listImg) {
                                    out.print("<li data-thumb=" + item + " rel=\"adjustX:10, adjustY:\" class=\"flex-active-slide\" style=\"width: 555px;height:509px; float: left; display: block;\">"
                                            + "<img src=" + item + " alt=\"#\">");
                                }
                                out.print("<input type=\"hidden\" id=\"idPro\" value=" + proId + ">"
                                        + "</li>"
                                        + "</ul>"
                                        + "</div>"
                                        + "<ul class=\"flex-direction-nav\">"
                                        + "<li><a class=\"flex-prev\" href=\"#\"></a></li>"
                                        + "<li><a class=\"flex-next\" href=\"#\"></a></li>"
                                        + "</ul>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>");
                                out.print("<div class=\"col-lg-6 col-12\">"
                                        + "<div class=\"product-des\" style=\"-webkit-line-clamp: unset;\">"
                                        + "<div class=\"short\">"
                                        + "<h4>" + product.getName() + "</h4>"
                                        + "<div class=\"rating-main\">"
                                        + "<ul class=\"rating\">"
                                        + "<li><i class=\"fa fa-star\"></i></li>"
                                        + "<li><i class=\"fa fa-star\"></i></li>"
                                        + "<li><i class=\"fa fa-star\"></i></li>"
                                        + "<li><i class=\"fa fa-star-half-o\"></i></li>"
                                        + "<li class=\"dark\"><i class=\"fa fa-star-o\"></i></li>"
                                        + "</ul>"
                                        + "<a href=\"#\" class=\"total-review\">(102) Review</a>"
                                        + "</div>"
                                        + "<p class=\"price\"><span class=\"discount\">" + priceDiscount.substring(0, priceDiscount.indexOf(".") + 0) + "</span><s>" + price.substring(0, price.indexOf(".") + 0) + "</s> </p>"
                                        + "<p style=\"-webkit-line-clamp: 5;\" class=\"description product-des\"></p>"
                                        + "</div>"
                                        + "<div class=\"color\">"
                                        + "<h4>Available Options <span>Color</span></h4>"
                                        + "<ul>");
                                for (String item : color) {
                                    out.print("<li><a style='border: 1px solid;background:" + item + "'><i class=\"ti-check\"></i></a></li>");
                                }
                                out.print("</ul>"
                                        + "</div>"
                                        + "<div class=\"size\">"
                                        + "<h4>Size</h4>"
                                        + "<ul>");
                                for (String item : size) {
                                    out.print("<li><a href=\"#\" class=\"one\">" + item + "</a></li>");
                                }
                                out.print("</ul>"
                                        + "</div>"
                                        + "<div class=\"product-buy\">"
                                        + "<div class=\"quantity\">"
                                        + "<h6>Quantity :</h6>"
                                        + "<div class=\"input-group\">"
                                        + "<div class=\"button minus\">"
                                        + "<button type=\"button\" class=\"btn btn-primary btn-number\" disabled=\"disabled\" data-type=\"minus\" data-field=\"quant[1]\">"
                                        + "<i class=\"ti-minus\"></i>"
                                        + "</button>"
                                        + "</div>"
                                        + "<input type=\"text\" name=\"quant[1]\" class=\"input-number\" data-min=\"1\" data-max=\"1000\" value=\"1\">"
                                        + "<div class=\"button plus\">"
                                        + "<button type=\"button\" class=\"btn btn-primary btn-number\" data-type=\"plus\" data-field=\"quant[1]\">"
                                        + "<i class=\"ti-plus\"></i>"
                                        + "</button>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>"
                                        + "<div class=\"add-to-cart\">"
                                        + "<button onClick=\"AddCart()\" class=\"btn\">Add to cart</button>"
                                        + "<a href=\"#\" class=\"btn min\"><i class=\"ti-heart\"></i></a>"
                                        + "<a href=\"#\" class=\"btn min\"><i class=\"fa fa-compress\"></i></a>"
                                        + "</div>"
                                        + "<div style='display: flex;'><div class='cat' style='width: 50%;'>"
                                        + "<p class='availability'>Category : " + product.getNameCate() + "</p>"
                                        + "<p class='availability' >Shop : " + product.getNameStore() + "</p></div>"
                                        + "<div style='width: 50%;margin-top:30px'><p class='availability'>Quantiy : " + product.getQuantity() + "</p><p class='availability'>Sell : " + product.getSell() + "</p></div></div>"
                                        + "</div>"
                                        + "<input type='hidden' class='shopName' value='" + product.getIdStore() + "'>"
                                        + "</div>"
                                        + "</div>");
                            %>                                                         
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="product-info">
                                    <div class="nav-main">

                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#description" role="tab" aria-selected="false">Description</a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab" aria-selected="true">Reviews</a></li>
                                        </ul>

                                    </div>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade active show" id="description" role="tabpanel">
                                            <div class="tab-single">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="single-des">
                                                            <%out.print(product.getDes());%>
                                                        </div>
                                                        <div class="single-des">
                                                            <h4>Product Features:</h4>
                                                            <ul>
                                                                <li>long established fact.</li>
                                                                <li>has a more-or-less normal distribution. </li>
                                                                <li>lmany variations of passages of. </li>
                                                                <li>generators on the Interne.</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="reviews" role="tabpanel">
                                            <div class="tab-single review-panel">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="ratting-main" id="ratting-main">                                                            
                                                            <%
                                                                List<Comment> listCM = CommentDB.getIdProduct(proId);
                                                                for (Comment item : listCM) {
                                                                    out.print("<div class=\"single-rating\">"
                                                                            + "<div class=\"rating-author\">"
                                                                            + "<img src=" + item.getImgUser() + " alt=\"#\">"
                                                                            + "</div>"
                                                                            + "<div class=\"rating-des\">"
                                                                            + "<h6>" + item.getCreateBy() + "</h6>"
                                                                            + "<div class=\"ratings\">"
                                                                            + "<div class=\"rate-count\"><span>" + item.getCreateDate() + "</span></div>"
                                                                            + "</div>"
                                                                            + "<p>" + item.getContent() + "</p>"
                                                                            + "</div>"
                                                                            + "</div>");
                                                                }
                                                            %>                                                           

                                                        </div>

                                                        <%if (acc != null) {
                                                                out.print("<div class=\"comment-review\">"
                                                                        + "<div class=\"add-review\">"
                                                                        + "<h5>Add A Review</h5>"
                                                                        + "<p>Your email address will not be published. Required fields are marked</p>"
                                                                        + "</div>"
                                                                        + "</div>");
                                                                out.print("<div class=\"form\">"
                                                                        + "<div class=\"row\">"
                                                                        + "<input type=\"hidden\" class=\"idPro\" value=" + proId + ">"
                                                                        + "<div class=\"col-lg-6 col-12\">"
                                                                        + "<div class=\"form-group\">"
                                                                        + "<label>Your Name<span>*</span></label>"
                                                                        + "<input class=\"name\" type=\"text\" required=\"required\" placeholder=\"\">"
                                                                        + "</div>"
                                                                        + "</div>"
                                                                        + "<div class=\"col-lg-12 col-12\">"
                                                                        + "<div class=\"form-group\">"
                                                                        + "<label>Write a review<span>*</span></label>"
                                                                        + "<textarea class=\"message\" rows=\"6\" placeholder=\"\"></textarea>"
                                                                        + "</div>"
                                                                        + "</div>"
                                                                        + "<div class=\"col-lg-12 col-12\">"
                                                                        + "<div class=\"form-group button5\">"
                                                                        + "<button type=\"submit\" class=\"btn\" onClick=\"comment()\">Submit</button>"
                                                                        + "</div>"
                                                                        + "</div>"
                                                                        + "</div>"
                                                                        + "</div>");
                                                            }%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="product-area most-popular related-product section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Related Products</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="owl-carousel popular-slider owl-theme owl-loaded">
                            <%
                                List<Products> listItem = ProductDB.getAll("1");
                                for (Products sp : listItem) {
                                    String price1 = PassEndcodeSHA.formatVnd(sp.getPrice());
                                    String priceDiscount1 = PassEndcodeSHA.formatVnd((sp.getPrice() - (sp.getPrice() * (sp.getDiscount() / 100))));
                                    out.print("<div class=\"single-product\">"
                                            + "<div class=\"product-img\">"
                                            + "<a href=\"#\">"
                                            + "<img class=\"default-img\" src=" + sp.getImage() + " alt=\"#\">"
                                            + "<img class=\"hover-img\" src=" + sp.getImage() + " alt=\"#\">"
                                            + "<span class=\"out-of-stock\">" + (int) sp.getDiscount() + "% OFF</span>"
                                            + "</a>"
                                            + "<div class=\"button-head\">"
                                            + "<div class=\"product-action\">"
                                            + "<a data-toggle=\"modal\" data-target=\"#exampleModal\" title=\"View Product\" href=\"#\"><i class=\" ti-eye\"></i><span>View Product</span></a>"
                                            + "<a title=\"Wishlist\" href=\"#\"><i class=\" ti-heart\"></i><span>Add to Wishlist</span></a>"
                                            + "<a title=\"Compare\" href=\"#\"><i class=\"ti-bar-chart-alt\"></i><span>Add to Compare</span></a>"
                                            + "</div>"
                                            + "<div class=\"product-action-2\">"
                                            + "<a title=\"Add to cart\" href=\"#\">Add to cart</a>"
                                            + "</div>"
                                            + "</div>"
                                            + "</div>"
                                            + "<div class=\"product-content\">"
                                            + "<h3><a class=\"product-des\" href=\"#\">" + sp.getName() + "</a></h3>"
                                            + "<div class=\"product-price\">"
                                            + "<span class=\"old\">" + price1.substring(0, price1.indexOf(".") + 0) + "</span>"
                                            + "<span style=\"color:#ed1b24\">&nbsp;&nbsp;" + priceDiscount1.substring(0, priceDiscount1.indexOf(".") + 0) + "</span>"
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

        <jsp:include page="footer/footer.jsp"></jsp:include>

        <div class="toast" style="position: absolute;top: 60%;left: 50%;transform: translateX(-50%);">
            <div class="toast-header">
                <strong class="me-auto">Thông báo</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body"></div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            function comment() {
                const name = document.querySelector(".name").value;
                const idPro = document.querySelector(".idPro").value;
                const message = document.querySelector(".message").value;
                $.ajax({
                    type: "GET",
                    contentType : "application/json",
                    url: "/NewFashion/Comment",
                    data: {message: message, name: name, idPro: idPro},
                    success: function (data) {
                        var commentsArray = JSON.parse(data);
                        var result = "";
                        commentsArray.map(item => {
                            console.log(item)
                            result += '<div class="single-rating"><div class="rating-author">\n\
                                        <img src="'+item.imgUser+'" alt="#"></div><div class="rating-des"><h6>'+item.createBy+'</h6><div class="ratings"><div class="rate-count"><span>'+item.createDate+'</span></div></div><p>'+item.content+'</p></div></div>'
                        })
                        $("#ratting-main").html(result);
                    },
                    error: function () {
                        alert("Error occurred while making the request.");
                    }
                });
            }
            function AddCart() {
                const imagePro = document.querySelector(".flex-active-slide").querySelector("img").src;
                const idPro = document.querySelector("#idPro").value;
                const namePro = document.querySelector(".short").querySelector("h4").innerHTML;
                const pricePro = document.querySelector(".discount").innerHTML;
                const quantityPro = document.querySelector(".input-number").value;
                const desPro = document.querySelector(".single-des").innerHTML;
                const shopName = document.querySelector(".shopName").value;
                $.ajax({
                    type: "GET",
                    url: "/NewFashion/CartAddController",
                    data: {imagePro: imagePro, namePro: namePro, idPro: idPro, pricePro: pricePro, quantityPro: quantityPro, desPro: desPro, shopName: shopName},
                    success: function (data) {
                        document.querySelector(".toast").classList.add("show");
                        document.querySelector(".toast-body").innerHTML = data;
                    },
                    error: function () {
                        alert("Error occurred while making the request.");
                    }
                });
            }
        </script>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slicknav.min.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/magnific-popup.js"></script>
        <script src="js/facnybox.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/finalcountdown.min.js"></script>
        <script src="js/nicesellect.js"></script>
        <script src="js/ytplayer.min.js"></script>
        <script src="js/flex-slider.js"></script>
        <script src="js/scrollup.js"></script>
        <script src="js/onepage-nav.min.js"></script>
        <script src="js/easing.js"></script>
        <script src="js/active.js"></script>
        <script defer="" src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon="{&quot;rayId&quot;:&quot;80c89e5d9d1c108d&quot;,&quot;version&quot;:&quot;2023.8.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;3248e93e0d6447329c4d6bcc351d5700&quot;,&quot;si&quot;:100}" crossorigin="anonymous"></script>

        <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><span><i class="fa fa-angle-up"></i></span></a>
    </body>
</html>
