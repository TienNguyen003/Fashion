<%-- 
    Document   : cart
    Created on : Sep 16, 2023, 3:39:00 PM
    Author     : Admin
--%>

<%@page import="database.DiscountDB"%>
<%@page import="model.Discount"%>
<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.List"%>
<%@page import="database.OrderDB"%>
<%@page import="model.Account"%>
<%@page import="model.Order_product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String acc = (String) session.getAttribute("userLog"); %>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Azalea - Cart</title>
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
            NumberFormat format = NumberFormat.getCurrencyInstance();
            format.setCurrency(Currency.getInstance("VND"));
        %>

        <!-- Header -->
        <header class="header shop">
            <jsp:include page="header/header.jsp"></jsp:include>
            <jsp:include page="header/navigation.jsp"></jsp:include>
            </header>
            <!--/ End Header -->

            <!-- Breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="index.jsp">Home<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="cart.jsp">Cart</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumbs -->

        <%
            if (acc == null) {
                out.print("<div style=\"text-align: center;margin-top:16px;\" class=\"alert alert-danger\">Bạn cần phải đăng nhập để sử dụng tính năng này</div>");
            }
        %>
        <!-- Shopping Cart -->
        <div class="shopping-cart check-cart section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Shopping Summery -->
                        <table class="table shopping-summery">
                            <thead>
                                <tr class="main-hading">
                                    <th></th>
                                    <th>PRODUCT</th>
                                    <th>NAME</th>
                                    <th class="text-center">PRICE</th>
                                    <th class="text-center">QUANTITY</th>
                                    <th class="text-center">TOTAL</th> 
                                    <th class="text-center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (acc != null) {
                                        List<Order_product> listOrder = OrderDB.getProducts(acc);
                                        for (Order_product sp : listOrder) {
                                            String price = format.format(Float.parseFloat(sp.getTotal_amount()));
                                            String pricePro = format.format(Float.parseFloat(sp.getTotal_amount()) / Float.parseFloat(sp.getTotal_quantity()));
                                            out.print("<form action=\"ControllerCart\"><tr style='position: relative'>"
                                                    + "<input type='hidden' class='idPro' value='" + sp.getList_id() + "'>"
                                                    + "<input type='hidden' class='shopPro' value='"+sp.getShop()+"'>"
                                                    + "<td data-title=\"No\"><label class=\"custom-checkbox\">"
                                                    + "<input type=\"checkbox\" class=\"ipCheck\">"
                                                    + "<span class=\"checkmark\"></span>"
                                                    + "</label></td>"
                                                    + "<td class=\"image\" data-title=\"No\"><img src=" + sp.getImage() + " alt=\"#\"></td>"
                                                    + "<td class=\"product-des\" style=\"width:500px\" data-title=\"Description\">"
                                                    + "<p class=\"product-name\"><a href=\"#\">" + sp.getList_name() + "</a></p>"
                                                    + "<p class=\"product-des\">" + sp.getDes() + "</p>"
                                                    + "</td>"
                                                    + "<td class=\"price\" data-title=\"Price\"><span>" + pricePro.substring(0, pricePro.indexOf(".") + 0) + "</span></td>"
                                                    + "<td style=\"width:120px\" class=\"qty\" data-title=\"Qty\">"
                                                    + "<div style=\"width:100%\" class=\"input-group\">"
                                                    + "<input style=\"padding:unset;border:unset\" type=\"text\" name=\"quant[1]\" class=\"input-number\"  data-min=\"1\" data-max=\"100\" disabled  value=" + sp.getTotal_quantity() + ">"
                                                    + "</div>"
                                                    + "</td>"
                                                    + "<td class=\"total-amount\" data-title=\"Total\"><span style=\"color:#ed1b24\">" + price.substring(0, price.indexOf(".") + 0) + "</span></td>"
                                                    + "<input type=\"hidden\" name=\"txtId\" value='" + sp.getList_id() + "'>"
                                                    + "<td class=\"action\" data-title=\"Remove\"><button name=\"action\" value=\"Delete Cart\"><i class=\"ti-trash remove-icon\"></i></button></td>"
                                                    + "</tr></form>");
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <!--/ End Shopping Summery -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <!-- Total Amount -->
                        <div class="total-amount">
                            <div class="row">
                                <div class="col-lg-8 col-md-5 col-12">
                                    <div class="left">
                                        <div class="coupon">
                                            <p>Hãy chọn mã giãm giá (Chọn mã rồi mới chọn sản phẩm chỉ chọn mã 1 lần)</p>
                                            <select class="form-select form-select-lg">
                                                <%
                                                    List<Discount> listDC = DiscountDB.getAll();
                                                    for (Discount item : listDC) {
                                                        if (item.getQuantity() > 0) {
                                                            out.print("<option>" + item.getDscCode() + " (Giảm " + item.getDscPer() + "%) </option>");
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-7 col-12">
                                    <div class="right">
                                        <ul>
                                            <li>Cart Subtotal<span class="total-price">0 ₫</span></li>
                                            <li>Shipping<span class="fee-ship">₫25.000</span></li>
                                            <li class="last">You Pay<span class="last-price" style="color:red">0 ₫</span></li>
                                        </ul>
                                        <div class="button5">
                                            <form action="ControllerCart">
                                                <button class="btn" name="action" value="btnPay">Checkout</button>
                                                <input type="hidden" class="idSend" name="idPro" value="">
                                                <input type="hidden" class="priceSend" name="pricePro" value="">
                                                <input type="hidden" class="shopSend" name="shopPro" value="">
                                                <input type="hidden" class="quantitySend" name="quantityPro" value="">
                                            </form>
                                            <a href="#" class="btn">Continue shopping</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ End Total Amount -->
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Shopping Cart -->

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
        <script>
            var $ = document.querySelector.bind(document);
            var $$ = document.querySelectorAll.bind(document);
            let accLog = $(".alert-danger");
            if (accLog !== null) {
                $(".check-cart").style.display = "none";
            } else {
                let ttprice = $(".total-price");
                let fee = $(".fee-ship").innerHTML.substring(1).replace(/\./g, '');

                let shopPro = $$(".shopPro");
                let quantitySend = $(".quantitySend");
                let quantityPro = $$(".input-number");
                let idPro = $$(".idPro");
                let idSend = $(".idSend");
                let shopSend = $(".shopSend");
                let sum = +(ttprice.innerHTML.slice(0, -1));
                let arr = [];
                let arrQuanti = [];
                let arrShop = [];
                let cbBuy = $$(".checkmark");

                for (let j = 0; j < cbBuy.length; j++) {
                    cbBuy[j].onclick = function () {
                        let soTrichXuat = 0;
                        let myString = document.querySelector(".coupon").querySelector(".nice-select").querySelector(".current").innerHTML;
                        let viTriBatDau = myString.indexOf("Giảm ");
                        if (viTriBatDau !== -1) {
                            let chuoiCon = myString.substring(viTriBatDau + 5, myString.indexOf("%"));
                            soTrichXuat = parseInt(chuoiCon, 10) / 100;
                        }

                        if (!cbBuy[j].parentElement.querySelector(".ipCheck").checked) {
                            let price = cbBuy[j].parentElement.parentElement.parentElement.querySelector(".total-amount").querySelector("span").innerHTML.substring(1).replace(/,/g, '');
                            sum += +(price);
                            arr.push(idPro[j].value);
                            arrShop.push(shopPro[j].value);
                            arrQuanti.push(quantityPro[j].value);
                        } else {
                            let price = cbBuy[j].parentElement.parentElement.parentElement.querySelector(".total-amount").querySelector("span").innerHTML.substring(1).replace(/,/g, '');
                            sum -= +(price);
                            arr.splice(arr.indexOf(idPro[j].value), 1);
                            arrShop.splice(arrShop.indexOf(shopPro[j].value), 1);
                            arrQuanti.splice(arrQuanti.indexOf(quantityPro[j].value), 1);
                        }

                        let formattedAmount = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(sum);
                        if (sum < 0) {
                            sum = 0;
                            ttprice.innerHTML = "0 ₫";
                        } else {
                            ttprice.innerHTML = formattedAmount;
                        }
                        if (sum == 0) {
                            $(".last-price").innerHTML = "0 ₫";
                            $(".priceSend").value = 0;
                        } else {
                            $(".last-price").innerHTML = Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(sum + (+fee) - ((sum + (+fee)) * soTrichXuat));
                            $(".priceSend").value = Math.ceil(sum + (+fee) - ((sum + (+fee)) * soTrichXuat));
                        }
                        idSend.value = arr;
                        shopSend.value = arrShop;
                        quantitySend.value = arrQuanti;
                    };
                }
            }
        </script>
    </body>
</html>
