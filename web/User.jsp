<%-- 
    Document   : admin
    Created on : Oct 23, 2023, 1:32:00 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="database.AccountDB"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Azalea - Admin</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!-- Favicons -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">

        <!-- Vendor CSS Files -->
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
                    <h1>Manager User</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Manager User</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section dashboard">
                    <div class="row">
                        <!-- Top Selling -->
                        <div class="col-12">
                            <div class="card top-selling overflow-auto">

                                <div class="card-body pb-0">
                                    <h5 class="card-title">User </h5>

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">Preview</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Username</th>
                                                <th scope="col" style="width: 110px;">Address</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Role</th>
                                                <th scope="col" style="width: 50px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Account> account = AccountDB.getAll();
                                            for (Account item : account) {
                                                String urlImg;
                                                if (!item.getImage().equals("")) {
                                                    urlImg = item.getImage();
                                                } else {
                                                    urlImg = "https://www.lottemart.vn/asset/images/icon-default-avatar.svg";
                                                }
                                                out.print("<tr>"
                                                        + "<th scope=\"row\"><a href=\"#\"><img src=" + urlImg + " alt=\"\"></a></th>"
                                                        + "<td><a href=\"#\" class=\"text-primary fw-bold\">" + item.getName() + "</a></td>"
                                                        + "<td>" + item.getUsername() + "</td>"
                                                        + "<td class=\"fw-bold\" style=\"-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;height: 54px;\">" + item.getAddress() + "</td>"
                                                        + "<td>" + item.getEmail() + "</td>"
                                                        + "<td>" + item.getPhoneNumber() + "</td>"
                                                        + "<td>" + item.getRole() + "</td>"
                                                        + "<td><form action=\"AdminController\">"
                                                        +"<input type=\"hidden\" name=\"userName\" value="+item.getUsername()+">"
                                                        + "<button style=\"background:unset;border-color:transparent\" name=\"action\" value=\"Delete\"><i class=\"bi bi-trash\" style=\"display: flex;justify-content: center;\"></i></button>"
                                                        + "</form></td>"
                                                        + "</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>

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
    </body>
</html>