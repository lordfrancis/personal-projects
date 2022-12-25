<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 08/10/2022
  Time: 12:18 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <script src="<c:url value="/resources/main-theme/vendor/jquery/jquery.min.js"/>" ></script>

  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/main-theme/css/style.css"/>" rel="stylesheet">

  <!-- Datatables -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
  

  
  <style>
    button{
        background: #eb5d1e;
        color: #fff;
        padding: 10px 25px;
        margin-left: 30px;
        border-radius: 50px;
        border: 0px;
    }
    
    #main{
        margin-top: 120px;
    }

    form h4{
        text-align: center;
    }

    select{
        display: block;
        width: 100%;
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: .375rem;   
    }
    button{
        margin-top:1rem;
    }
  </style>
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
          <li><a class="nav-link scrollto" href="../user/home">Home</a></li>
          <li><a class="nav-link scrollto  active" href="../user/user_myPets">My Pets</a></li>
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

<main id="main">
  <div class="d-flex align-items-center justify-content-center align-items-center mt-10">

    <form:form class="w-50" action="../user/user_processAddAppointment" modelAttribute="appointment">
      <h4><strong> Appointment Booking Form</strong></h4>
      <form:hidden path="owner_id" class="form-control"/>
      <form:hidden path="status" class="form-control"/>

      <div class="form-group mt-3">
        <form:label path="type"> Booking Type </form:label>
        <form:select path="type" class="form-control">
            <form:option value="consultation" label="Consultation"/>
            <form:option value="vaccination" label="Vaccination"/>
        </form:select>
      </div>

      <div class="form-group mt-3">
          <form:label path="date">Date</form:label>
          <form:input type="date" path="date" class="form-control"/>
      </div>
      <div class="form-group mt-3">
          <form:label path="time_slot"> Time Slot </form:label>
          <form:select path="time_slot" class="form-control">
            <form:option value="8:00 AM - 9:00 AM" label="8:00 AM - 9:00 AM"/>
            <form:option value="9:00 AM - 10:00 AM" label="9:00 AM - 10:00 AM"/>
            <form:option value="10:00 AM - 11:00 AM" label="10:00 AM - 11:00 AM"/>
            <form:option value="11:00 AM - 12:00 NN" label="11:00 AM - 12:00 NN"/>
            <form:option value="1:00 PM - 2:00 PM" label="1:00 PM - 2:00 PM"/>
            <form:option value="2:00 PM - 3:00 PM" label="2:00 PM - 3:00 PM"/>
            <form:option value="3:00 PM - 4:00 PM" label="3:00 PM - 4:00 PM"/>
            <form:option value="4:00 PM - 5:00 PM" label="4:00 PM - 5:00 PM"/>
        </form:select>
      </div>
      <div class="text-center">
        <input type="submit" value="Book Appointment" class="btn btn-primary mt-3">
      </div>
      
      </form:form>
  
  </div>
</main>

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

  <!-- Datatables -->
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>


 <script>
      $(document).ready( function () {
        $('#pet_table').DataTable({
          responsive: true,
        });
      } );
    </script>

</body>

</html>