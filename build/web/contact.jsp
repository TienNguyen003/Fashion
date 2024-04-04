<%-- 
    Document   : contact
    Created on : Sep 16, 2023, 3:38:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Azalea - Contact</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
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
                        <div class="col-12">
                            <div class="bread-inner">
                                <ul class="bread-list">
                                    <li><a href="index1.jsp">Home<i class="ti-arrow-right"></i></a></li>
                                    <li class="active"><a href="blog-single.jsp">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Breadcrumbs -->

            <!-- Start Contact -->
            <section id="contact-us" class="contact-us section">
                <div class="container">
                    <div class="contact-head">
                        <div class="row">
                            <div class="col-lg-8 col-12">
                                <div class="form-main">
                                    <div class="title">
                                        <h4>Get in touch</h4>
                                        <h3>Write us a message</h3>
                                    </div>
                                    <form class="form" method="post" action="mail/mail.php">
                                        <div class="row">
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>Your Name<span>*</span></label>
                                                    <input name="name" type="text" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>Your Subjects<span>*</span></label>
                                                    <input name="subject" type="text" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>Your Email<span>*</span></label>
                                                    <input name="email" type="email" placeholder="">
                                                </div>	
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>Your Phone<span>*</span></label>
                                                    <input name="company_name" type="text" placeholder="">
                                                </div>	
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group message">
                                                    <label>your message<span>*</span></label>
                                                    <textarea name="message" placeholder=""></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group button">
                                                    <button type="submit" class="btn ">Send Message</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="single-head">
                                    <div class="single-info">
                                        <i class="fa fa-phone"></i>
                                        <h4 class="title">Call us Now:</h4>
                                        <ul>
                                            <li>+123 456-789-1120</li>
                                            <li>+522 672-452-1120</li>
                                        </ul>
                                    </div>
                                    <div class="single-info">
                                        <i class="fa fa-envelope-open"></i>
                                        <h4 class="title">Email:</h4>
                                        <ul>
                                            <li><a href="mailto:info@yourwebsite.com">info@yourwebsite.com</a></li>
                                            <li><a href="mailto:info@yourwebsite.com">support@yourwebsite.com</a></li>
                                        </ul>
                                    </div>
                                    <div class="single-info">
                                        <i class="fa fa-location-arrow"></i>
                                        <h4 class="title">Our Address:</h4>
                                        <ul>
                                            <li>KA-62/1, Travel Agency, 45 Grand Central Terminal, New York.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--/ End Contact -->

            <!-- Map Section -->
            <div class="map-section">
                <div id="myMap"></div>
            </div>
            <!--/ End Map Section -->

            <!-- Start Footer Area -->
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
        <!-- Google Map JS -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM"></script>	
        <script src="js/gmap.min.js"></script>
        <script src="js/map-script.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
    </body>
</html>
