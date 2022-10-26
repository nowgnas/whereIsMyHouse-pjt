<%@ page contentType="text/html; utf-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="common/head.jsp" %>
    <title>Where is My House</title>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>WhereIsMyHome</title>

    <!-- Favicons -->
    <link href="/assets/img/favicon2.jpg" rel="icon"/>
    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet"/>
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet"/>
</head>
<body>
<!-- ======= 1. 맨위 연락처 바 =======
 <section id="topbar" class="d-flex align-items-center">
   <div class="container d-flex justify-content-center justify-content-md-between">
     <div class="contact-info d-flex align-items-center">
       <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
       <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
     </div>
     <div class="social-links d-none d-md-flex align-items-center">
       <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
       <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
       <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
       <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
     </div>
   </div>
 </section> -->

<!-- ======= 2. 헤더 ([로그인] -> 로그아웃, 회원관리뜨게, [시세보러가는 구간] -> 로그인 유무 경고창 , [회원가입]) ======= -->
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <h1 class="logo">
            <a href="/">whereIsMyHome<span>.</span></a>
        </h1>

        <!--2-1. 헤더 메뉴창 -->
        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto" href="deal.html">Deal Info</a></li>
                <li><a class="nav-link scrollto" href="#portfolio">Company</a></li>
                <li><a class="nav-link scrollto" href="user/login"
                       onclick="window.open(this.href, '_blank', 'width=600 height=800'); return false">Login</a></li>
                <li><a class="nav-link scrollto" href="#team">Logout</a></li>

                <li class="dropdown">
                    <a href="user/register"
                       onclick="window.open(this.href, '_blank', 'width=600 height=800'); return false"><span>Register</span>
                        <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="#">회원정보 삭제</a></li>
                        <li><a href="#">회원정보 수정</a></li>
                        <li><a href="#">회원정보 검색</a></li>
                    </ul>
                </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!--2-1. 헤더 메뉴창 end -->
    </div>
</header>
<!-- 2. 헤더 종료 -->

<!-- 3. 중간 메인광고 섹션-->
<section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
        <h1>Welcome to <span>whereIsMyHome</span></h1>
        <h2>Your home is my home, so Please give me your home.</h2>
        <div class="d-flex">
            <a href="#about" class="btn-get-started scrollto">Find Your Home</a>
            <a href="https://www.youtube.com/watch?v=jA0PiCWDc0Q" class="glightbox btn-watch-video"
            ><i class="bi bi-play-circle"></i><span id="video-ment">Check Video</span></a
            >
        </div>
    </div>
</section>
<!-- 3. 중간 메인광고 섹션 종료-->

<!-- 메인 섹션 시작 -->
<main id="main">
    <!-- ======= 4-1. 디자인 재료 파트 4구간 ======= -->
    <section id="featured-services" class="featured-services">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon"><i class="bx bxl-dribbble"></i></div>
                        <h4 class="title"><a href="">Lorem Ipsum</a></h4>
                        <p class="description">
                            Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
                        <div class="icon"><i class="bx bx-file"></i></div>
                        <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
                        <p class="description">
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
                        <div class="icon"><i class="bx bx-tachometer"></i></div>
                        <h4 class="title"><a href="">Magni Dolores</a></h4>
                        <p class="description">
                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
                        <div class="icon"><i class="bx bx-world"></i></div>
                        <h4 class="title"><a href="">Nemo Enim</a></h4>
                        <p class="description">
                            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======= 4-1. 디자인 재료 파트 4구간 종료 ======= -->

    <!-- ======= 4-2. 디자인 재료 파트 4구간 ======= -->
    <section id="counts" class="counts">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="count-box">
                        <i class="bi bi-emoji-smile"></i>
                        <span
                                data-purecounter-start="0"
                                data-purecounter-end="232"
                                data-purecounter-duration="1"
                                class="purecounter"
                        ></span>
                        <p>Happy Clients</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                    <div class="count-box">
                        <i class="bi bi-journal-richtext"></i>
                        <span
                                data-purecounter-start="0"
                                data-purecounter-end="521"
                                data-purecounter-duration="1"
                                class="purecounter"
                        ></span>
                        <p>Projects</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                    <div class="count-box">
                        <i class="bi bi-headset"></i>
                        <span
                                data-purecounter-start="0"
                                data-purecounter-end="1463"
                                data-purecounter-duration="1"
                                class="purecounter"
                        ></span>
                        <p>Hours Of Support</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                    <div class="count-box">
                        <i class="bi bi-people"></i>
                        <span
                                data-purecounter-start="0"
                                data-purecounter-end="15"
                                data-purecounter-duration="1"
                                class="purecounter"
                        ></span>
                        <p>Hard Workers</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ======= 4-2. 디자인 재료 파트 4구간 종료 ======= -->

    <!-- ======= 4-3. 참여기업사 로고 파트 ======= -->
    <section id="clients" class="clients section-bg">
        <div class="container" data-aos="zoom-in">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-1.png" class="img-fluid" alt=""/>
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-2.png" class="img-fluid" alt=""/>
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-3.png" class="img-fluid" alt=""/>
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-4.png" class="img-fluid" alt=""/>
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-5.png" class="img-fluid" alt=""/>
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-6.png" class="img-fluid" alt=""/>
                </div>
            </div>
        </div>
    </section>
    <!-- ======= 4-3. 참여기업사 로고 파트 종료 ======= -->
</main>
<!-- 메인 섹션 종료-->

<!-- Footer 시작 -->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 footer-contact">
                    <h3>BizLand<span>.</span></h3>
                    <p>
                        A108 Adam Street <br/>
                        New York, NY 535022<br/>
                        United States <br/><br/>
                        <strong>Phone:</strong> +1 5589 55488 55<br/>
                        <strong>Email:</strong> info@example.com<br/>
                    </p>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Social Networks</h4>
                    <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
                    <div class="social-links mt-3">
                        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container py-4">
        <div class="copyright">
            &copy; Copyright <strong><span>BizLand</span></strong
        >. All Rights Reserved
        </div>
        <div class="credits">
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
</footer>
<!-- Footer 종료 -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

<!--Javascript 설정-->
<!-- 벤더 자바스크립트 설정-->
<script src="/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/assets/vendor/aos/aos.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>

<!-- main.js 자바스크립트 설정 -->
<script src="/assets/js/main.js"></script>
</body>
</html>