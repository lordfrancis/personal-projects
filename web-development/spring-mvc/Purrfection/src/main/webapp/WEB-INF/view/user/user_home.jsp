<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 08/10/2022
  Time: 12:18 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Ninestars Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<c:url value="/resources/main-theme/img/favicon.png"/>" rel="icon">
  <link href="<c:url value="/resources/main-theme/img/apple-touch-icon.png"/>" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<c:url value="/resources/main-theme/vendor/aos/aos.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/main-theme/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/main-theme/vendor/bootstrap-icons/bootstrap-icons.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/main-theme/vendor/boxicons/css/boxicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/main-theme/vendor/glightbox/css/glightbox.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/main-theme/vendor/swiper/swiper-bundle.min.css"/>" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/main-theme/css/style.css"/>" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.html"><span>Purrfection</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="home">Home</a></li>
          <li><a class="nav-link scrollto" href="../user/user_myPets">My Pets</a></li>
          <li><a class="nav-link scrollto" href="../user/user_myAppointments">My Appointments</a></li>
          <li class="dropdown"><a href="#"><span>Account</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Account Settings</a></li>
              <li><a href="<%=request.getContextPath()%>/user/j_spring_security_logout">Logout</a></li>
            </ul>
          </li>
          <li><a class="getstarted scrollto" href="../user/user_bookAppointment">Book an Appointment</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h1>Bohol's Community Pet Store</h1>
          <h2>Purrfection provides the happiest, healthiest puppies to Bohol. From breed selection, pet training and pet products, Pet Express is your goto puppy expert!</h2>
          <div>
            <a href="#about" class="btn-get-started scrollto">Book an Appointment</a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img">
          <img src="<c:url value="/resources/main-theme/img/dogger.jpg"/>" class="img-fluid" alt="">
        </div>
      </div>
    </div>


  </section><!-- End Hero -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Purrfection 2022</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/ -->
        Website By <a href="https://bootstrapmade.com/">Lord Francis Navarro</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="<c:url value="/resources/main-theme/vendor/aos/aos.js"/>"></script>
  <script src="<c:url value="/resources/main-theme/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
  <script src="<c:url value="/resources/main-theme/vendor/glightbox/js/glightbox.min.js"/>"></script>
  <script src="<c:url value="/resources/main-theme/vendor/isotope-layout/isotope.pkgd.min.js"/>"></script>
  <script src="<c:url value="/resources/main-theme/vendor/swiper/swiper-bundle.min.js"/>"></script>
  <script src="<c:url value="/resources/main-theme/vendor/php-email-form/validate.js"/>"></script>
 

  <!-- Template Main JS File -->
  <script src="<c:url value="/resources/main-theme/js/main.js"/>"></script>

</body>

</html>