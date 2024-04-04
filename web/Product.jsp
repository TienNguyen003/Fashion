<%-- 
    Document   : Product
    Created on : Nov 2, 2023, 2:01:58 PM
    Author     : Admin
--%>

<%@page import="util.PassEndcodeSHA"%>
<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat" %>
<%@page import="database.AccountDB"%>
<%@page import="model.Account"%>
<%@page import="database.ProductDB"%>
<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Azalea - Admin</title>
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link rel="stylesheet" href="style.css"/>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <body>
        <%
            String acc = (String) session.getAttribute("userLog");
            if (acc == null) {
                response.sendRedirect("pages-error-404.jsp");
            } else {
                Account rtAcc = AccountDB.checkAd(acc);
                if (rtAcc.getRole().equals("")) {
                    response.sendRedirect("index.jsp");
                }
            }
        %>
        <jsp:include page="header/headerAdmin.jsp"></jsp:include>
            <main id="main" class="main">
                <div class="pagetitle">
                    <h1>Manager Product</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Manager Product</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section dashboard">
                    <div class="row">
                        <!-- Top Selling -->
                        <div class="col-12">
                            <div class="card top-selling overflow-auto">

                                <div class="card-body pb-0">
                                    <h5 class="card-title">Product</h5>

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">Preview</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Price</th>
                                                <th scope="col" style="width: 500px">Des</th>
                                                <th scope="col">Discount</th>
                                                <th scope="col" style="width: 50px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            ProductDB proDB = new ProductDB();
                                            String idP = request.getParameter("index");
                                            int indexPage = 0;
                                            if (idP != null) {
                                                indexPage = (Integer.parseInt(idP) - 1) * 9;
                                            }
                                            if (indexPage == 0) {
                                                indexPage = 0;
                                            }
                                            String idShop = String.valueOf(session.getAttribute("idShop"));
                                            List<Products> listProduct = proDB.getListPage(indexPage, "");
                                            Account rtAcc = AccountDB.checkAd(acc);
                                            if (rtAcc.getRole().equals("shop")) {
                                                listProduct = ProductDB.getListPage(indexPage, idShop);
                                            }                                            
                                            for (Products item : listProduct) {
                                                String price = PassEndcodeSHA.formatVnd(item.getPrice());
                                                String urlImg;
                                                if (!item.getImage().equals("")) {
                                                    urlImg = item.getImage();
                                                } else {
                                                    urlImg = "https://www.lottemart.vn/asset/images/icon-default-avatar.svg";
                                                }
                                                out.print("<tr>"
                                                        + "<th scope=\"row\"><a href=\"#\"><img src=" + urlImg + " alt=\"\"></a></th>"
                                                        + "<td><a href=\"#\" class=\"text-primary fw-bold\">" + item.getName() + "</a></td>"
                                                        + "<td>" + price.substring(0, price.indexOf(".") + 0) + "</td>"
                                                        + "<td class=\"fw-bold\" style=\"-webkit-line-clamp: 2;display: -webkit-box;-webkit-box-orient: vertical;overflow: hidden;height: 52px;\">" + item.getDes() + "</td>"
                                                        + "<td>" + (int) item.getDiscount() + "%</td>"
                                                        + "<td><form action=\"AdminController\">"
                                                        + "<input type=\"hidden\" name=\"idProduct\" value=" + item.getId() + ">"
                                                        + "<button style=\"background:unset;border-color:transparent\" name=\"action\" value=\"DeleteProduct\"><i class=\"bi bi-trash\" style=\"display: flex;justify-content: center;\"></i></button>"
                                                        + "</form></td>"
                                                        + "</tr>");
                                            }
                                        %>                                        
                                    </tbody>
                                </table>
                                <%
                                    ProductDB db = new ProductDB();
                                    int count = db.countProduct(idShop);
                                    int maxPage = count / 7;
                                    out.print("<div class=\"col-12\">"
                                            + "<div class=\"pagination\">"
                                            + "<ul class=\"pagination-list\">"
                                            + "<li><a href=\"#\"><i class=\"bi bi-arrow-left\"></i></a></li>");
                                    for (int i = 1; i <= Math.ceil(maxPage); i++) {
                                        out.print("<li class=\"pagination-item\"><a href=\"?index=" + i + "\">" + i + "</a></li>");
                                    }
                                    out.print("<li><a href=\"#\"><i class=\"bi bi-arrow-right\"></i></a></li>"
                                            + "</ul>"
                                            + "</div>"
                                            + "</div>");
                                %>
                            </div>

                        </div>
                    </div><!-- End Top Selling -->
                </div>
            </section>
        </main>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
            let pagination = document.querySelectorAll(".pagination-item");
            pagination[0].classList.add('active');
            let urlCurrent = window.location.href;
            let index = urlCurrent.replace("http://localhost:8080/NewFashion/Product.jsp?index=", '');
            if (urlCurrent.includes('index')) {
                for (i = 0; i < pagination.length; i++) {
                    pagination[i].classList.remove('active');
                }
            }
            if (!isNaN(Number(index))) {
                pagination[index - 1].classList.add('active')
            }
        </script>
    </body>
</html>
