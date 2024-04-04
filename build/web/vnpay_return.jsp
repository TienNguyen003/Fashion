<%@page import="model.Invoice"%>
<%@page import="database.OrderDB"%>
<%@page import="database.ProductDB"%>
<%@page import="database.InvoiceDB"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="util.Config"%>
<%@page import="util.PassEndcodeSHA"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<% String acc = (String) session.getAttribute("userLog"); %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>KẾT QUẢ THANH TOÁN</title>
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
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <header class="header shop">
            <jsp:include page="header/header.jsp"></jsp:include>
            <jsp:include page="header/navigation.jsp"></jsp:include>
            </header>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container" style="margin-top: 40px">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <%
                        String price1 = PassEndcodeSHA.formatVnd(Float.parseFloat(request.getParameter("vnp_Amount")) / 100);
                        String price = price1.substring(0, price1.length() - 3);
                    %>
                    <label><%=price%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã sản phẩm:</label>
                    <label><%out.print(session.getAttribute("idPro"));%></label>
                </div> 
                <!--                <div class="form-group">
                                    <label >Mã lỗi thanh toán:</label>
                                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                                </div> 
                                <div class="form-group">
                                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                                </div> -->
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=PassEndcodeSHA.convertStringToDateTime(request.getParameter("vnp_PayDate"))%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");
                                    String idPro = session.getAttribute("idPro").toString(); // id san pham
                                    String[] arrId = idPro.split(",");
                                    String quantityPro = session.getAttribute("quantityPro").toString(); // so luong san pham
                                    String[] arrQuanti = quantityPro.split(",");
                                    ProductDB proDB = new ProductDB();
                                    OrderDB orDB = new OrderDB();
                                    for(int i = 0; i < arrId.length; i++){
                                        proDB.updateQuantitySP(Integer.parseInt(arrQuanti[i]), arrId[i]);
                                        orDB.deleteSP(acc, arrId[i]);
                                    }
                                    InvoiceDB iDB = new InvoiceDB();
                                    Invoice i = iDB.checkInvoice(request.getParameter("vnp_TxnRef"), request.getParameter("vnp_TransactionNo"));
                                    if (i.getCodeBill() == 0) {
                                        iDB.insertInvoice(acc, Integer.parseInt(request.getParameter("vnp_TxnRef")),
                                                 Integer.parseInt(request.getParameter("vnp_TransactionNo")),
                                                 price, String.valueOf(session.getAttribute("idPro")), 0,
                                                 (String)session.getAttribute("shopPro"),
                                                 acc, String.valueOf(PassEndcodeSHA.convertStringToDateTime(request.getParameter("vnp_PayDate"))),
                                                 "", "");
                                    }
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %>
                    </label>
                </div> 
            </div>            
        </div>
        <footer class="footer">
            <jsp:include page="footer/footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
