<%-- 
    Document   : Invoice
    Created on : Dec 5, 2023, 10:37:04 PM
    Author     : Admin
--%>

<%@page import="database.InvoiceDB"%>
<%@page import="model.Invoice"%>
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
        <link rel="icon" type="image/png" href="images/favicon.png">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <link href="https://fonts.gstatic.com" rel="preconnect">
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
                    <h1>Manager Invoice</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Manager Invoice</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section dashboard">
                    <div class="row">
                        <!-- Top Selling -->
                        <div class="col-12">
                            <div class="card top-selling overflow-auto">

                                <div class="card-body pb-0">
                                    <h5 class="card-title">Invoice </h5>

                                    <table class="table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col">Bill</th>
                                                <th scope="col">Own</th>                                                
                                                <th scope="col">Product</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            String idShop = String.valueOf(session.getAttribute("idShop"));
                                            List<Invoice> invoice = InvoiceDB.getAll();
                                            Account rtAcc = AccountDB.checkAd(acc);
                                            if (rtAcc.getRole().equals("shop")) {
                                                invoice = InvoiceDB.getInvoiceStore(idShop, 1);
                                            }
                                            for (Invoice item : invoice) {
                                                out.print("<tr>"
                                                        + "<td>" + item.getCodeBill() + "</td>"
                                                        + "<td>" + item.getOwn() + "</td>"
                                                        + "<td>" + item.getIdProduct() + "</td>"
                                                        + "<td>" + item.getCreateDate() + "</td>");
                                                if (item.getStatus() == 0) {
                                                    out.print("<td>Unconfimred</td>");
                                                } else {
                                                    out.print("<td>Confirmed</td>");
                                                }                                                
                                                out.print("<td><form action=\"AdminController\">"
                                                        +"<input type=\"hidden\" name=\"codeBill\" value="+item.getCodeBill()+">");
                                                if (rtAcc.getRole().equals("shop")) {
                                                    out.print("<button style=\"background:unset;border-color:transparent\" name=\"action\" value=\"DeleteBill\"><i class=\"bi bi-trash\" style=\"display: flex;justify-content: center;\"></i></button>");
                                                    if(item.getStatus() == 0)
                                                        out.print("<button style=\"background:unset;border-color:transparent\" name=\"action\" value=\"ConfirmBill\"><i class=\"bi bi-check2\" style=\"display: flex;justify-content: center;\"></i></button>");
                                                }
                                                        out.print("</form></td></tr>");
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
