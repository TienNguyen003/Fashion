<%-- 
    Document   : profile.jsp
    Created on : Oct 1, 2023, 9:24:40 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="database.AccountDB"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String acc = (String) session.getAttribute("userLog"); %>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Azalea - Profile</title>
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
                        <div class="col-9">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="index.jsp">Home<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="profile.jsp">My Account</a></li>
                                </ul>
                            </div>
                        </div>
                    <%
                        if (acc != null) {
                            out.print("<div class=\"col-3\">"
                                    + "<div class=\"bread-inner\">"
                                    + "<ul class=\"bread-list\">"
                                    + "<li>"
                                    + "<form action=\"LogResController\" method=\"POST\">"
                                    + "<i class=\"ti-close\"></i><a href=\"#\">"
                                    + "<input style=\"background-color: #F6F7FB;border: unset;height: 24px\" type=\"submit\" name=\"action\" value=\"Logout\">"
                                    + "</a></form>"
                                    + "</li>"
                                    + "</ul>"
                                    + "</div>"
                                    + "</div>");
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <%
            if (acc == null) {
                out.print("<div style=\"text-align: center;margin-top:16px;\" class=\"alert alert-danger\">Bạn cần phải <a style='color:blue' href='login.jsp'>đăng nhập</a> để sử dụng tính năng này</div>");
            }
        %>

        <!-- Start Checkout -->
        <section class="shop checkout section">
            <div class="container">
                <div class="row"> 
                    <div class="col-lg-8 col-12">
                        <div class="checkout-form">
                            <h2>Change your personal information</h2>
                            <p></p>
                            <!-- Form -->
                            <%
                                AccountDB accountDB = new AccountDB();
                                Account accUser = accountDB.getProducts(acc);
                                out.print("<form class='form' action='ControllerCart'>"
                                +"<div class='row'>"
                                    +"<div class='col-lg-6 col-md-6 col-12'>"
                                        +"<div class='form-group'>"
                                            +"<label>Name<span>*</span></label>"
                                            +"<input class='lname' type='text' name='name' placeholder='Last Name' required value='"+accUser.getName()+"'>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='col-lg-6 col-md-6 col-12'>"
                                        +"<div class='form-group'>"
                                            +"<label>Phone Number<span>*</span></label>"
                                            +"<input class=\"number\" type=\"number\" name=\"number\" placeholder=\"Phone Number\" required value='"+accUser.getPhoneNumber()+"'>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='col-lg-6 col-md-6 col-12'>"
                                        +"<div class='form-group'>"
                                            +"<label>Address<span>*</span></label>"
                                            +"<input class='address' type='text' name='address' placeholder='Address' required value='"+accUser.getAddress()+"'>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='col-lg-6 col-md-6 col-12'>"
                                        +"<div class='form-group'>"
                                            +"<label>Date<span>*</span></label>"
                                            +"<input class='date' type='date' name='date' value='"+accUser.getDate()+"' required>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='col-12'>"
                                        +"<div class='form-group create-account'>"
                                            +"<input id='cbox' class='checkbox' type='checkbox'>"
                                            +"<label>Update an account?</label>"
                                        +"</div>"
                                        +"<p class='showCB'></p>"
                                    +"</div>"   
                                    +"<div class='col-12'>"                   
                                        +"<button type='submit' name='action' value='btnUpdateAcc' class='btn btn-primary btnUpdateAcc'>Submit</button>"
                                    +"</div>"
                                +"</div>"
                            +"</form>");
                            %>                            
                            <!--/ End Form -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="order-details">                            
                            <div class="row" style="padding: 0 15px">                                
                                <div class="col-12">
                                    <h3>Thông tin khách hàng</h3>
                                    <div style="display: flex; justify-content: space-between;margin-top: 20px">
                                        <div style="display: flex;flex-direction: column">                                            
                                            <%
                                                if (acc != null) {
                                                    Account newAcc = accountDB.getProducts(acc);
                                                    if(!newAcc.getImage().equals("")){
                                                        out.print("<img style=\"height:75px;width:75px; border-radius:50%;\" src="+newAcc.getImage()+" alt=\"\"/>");
                                                    } else {
                                                        out.print("<img style=\"height:75px\" src=\"https://www.lottemart.vn/asset/images/icon-default-avatar.svg\" alt=\"\"/>");
                                                    }
                                                    if (!newAcc.getName().equals("")) {
                                                        out.print(newAcc.getName());
                                                    } else {
                                                        out.print(acc);
                                                    }
                                                }
                                            %>
                                        </div>
                                        <div>
                                            <button style="padding: 13px" type="submit" name="" value="btnUpdateAcc" class="btn btn-primary">Update Image</button>
                                            <p>Kích thước tệp tối đa 1 MB.<br>
                                                Định dạng: .JPEG, .PNG      </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        </form> 
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Checkout -->

        <footer>
            <jsp:include page="footer/footer.jsp"></jsp:include>
        </footer>
        <!-- /End Footer Area -->

        <!-- Jquery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/magnific-popup.js"></script>
        <!-- Fancybox JS -->
        <script src="js/facnybox.min.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Ytplayer JS -->
        <script src="js/ytplayer.min.js"></script>
        <!-- Flex Slider JS -->
        <script src="js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
    </body>
    <script>
        var $ = document.querySelector.bind(document);
        var $$ = document.querySelectorAll.bind(document);
        let accLog = $(".alert-danger");
        if (accLog !== null) {
            $(".checkout").style.display = "none";
        }

        let parentIp = $('.checkout-form');
        let inputTxt = parentIp.getElementsByTagName('input');
        let checkBox = $('.checkbox');
        let btnUpAcc = $('.btnUpdateAcc');
        btnUpAcc.onclick = () => {
            if (checkBox.checked) {
                $('.showCB').innerHTML = '';
                btnUpAcc;
            } else {
                $('.showCB').innerHTML = "<div style='text-align: center;margin-top:16px;' class='alert alert-danger'>Bạn cần phải xác nhận đồng ý</div>";

            }
            for (i = 0; i < inputTxt.length; i++) {
                if (inputTxt[i].value !== '') {
                    let parentIp = inputTxt[i].parentElement.getElementsByTagName('span');
                    if (parentIp.length > 0 && inputTxt[i].value !== '') {
                        parentIp[0].style.display = 'none';
                    }
                }
            }
        }
    </script>
</html>

