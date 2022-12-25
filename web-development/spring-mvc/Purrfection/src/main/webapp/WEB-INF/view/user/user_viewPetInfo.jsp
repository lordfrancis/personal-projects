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
  <script src="<c:url value="/resources/main-theme/vendor/jquery/jquery.min.js"/>" ></script>

  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/main-theme/css/style.css"/>" rel="stylesheet">

  <!-- Datatables -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
  

  <style>
    a.add-pet{
       background: #2ac95f;
       color: #fff;
       padding: 10px 25px;
       margin-top: 2rem;
       border: 0px;
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
  <div class="container mt-10">
      <h2> Pet Information </h2>
     <div class="container">
      <!-- Row For Pet Information -->
      <div class="row">
        <div class="col-sm">
          <div class="row">
            <p> <strong>Name:</strong> &nbsp&nbsp&nbsp${pet.name}</p>
          </div>
          <div class="row">
            <p> <strong> Type:</strong>&nbsp&nbsp&nbsp${pet.pet_type}</p>
          </div>
          <div class="row">
            <p> <strong>Breed</strong>&nbsp&nbsp&nbsp${pet.breed} </p>
          </div>
        </div>
        <hr>

        <!-- 2nd Row Tabbed Window for Pet Consultation and Vaccination Details -->
        <div id="tabs">
        
          <!-- Consultation Tab -->
          <div id="tab-consul" style="margin:2em 0;">
            <h3>Vaccination Details</h3>
            <table id="vacc_table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Date</th>
                  <th>Type</th>
                  <th>Remarks</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>Date</th>
                  <th>Type</th>
                  <th>Remarks</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${vaccList}" var="vacc">
                  <tr>
                    <td>${vacc.vaccination_id}</td>
                    <td>${vacc.vacc_date}</td>
                    <td>${vacc.type}</td>
                    <td>${vacc.remarks}</td>
                  </tr>
                </c:forEach>
                </tbody>
          </table> 
          </div>

          <div id="tab-vacc">
            <h3>Consultation Details</h3>
            <table id="consul_table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Date</th>
                  <th>Findings</th>
                  <th>recommendations</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                  <th>ID</th>
                  <th>Date</th>
                  <th>Findings</th>
                  <th>recommendations</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${consulList}" var="consul">
                  <tr>
                    <td>${consul.consultation_id}</td>
                    <td>${consul.consul_date}</td>
                    <td>${consul.findings}</td>
                    <td>${consul.recommendations}</td>
                  </tr>
                </c:forEach>
                </tbody>
          </table> 
          </div>
        </div>

      </div>
     </div>
      

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
        $('#consul_table').DataTable({
          responsive: true,
        });

        $('#vacc_table').DataTable({
          responsive:true,
        });
      } );
    </script>


</body>

</html>