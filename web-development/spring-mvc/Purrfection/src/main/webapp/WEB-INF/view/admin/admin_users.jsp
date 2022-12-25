<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 07/12/2022
  Time: 2:19 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Users</title>
    <jsp:include page="admin_inc/head_styles.jsp"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body id="page-top">

   
  <!-- Page Wrapper -->
  <div id="wrapper">

      <!-- Sidebar -->
      <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

          <!-- Sidebar - Brand -->
          <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
              <div class="sidebar-brand-icon rotate-n-15">
                  <i class="fas fa-laugh-wink"></i>
              </div>
              <div class="sidebar-brand-text mx-3">Purrfection</div>
          </a>

          <!-- Divider -->
          <hr class="sidebar-divider my-0">

          <!-- Nav Item - Dashboard -->
          <li class="nav-item">
              <a class="nav-link" href="../admin/">
                  <i class="fas fa-fw fa-tachometer-alt"></i>
                  <span>Dashboard</span></a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
              Account Administration
          </div>

          <!-- Nav Item - Pages Collapse Menu -->
          <li class="nav-item active">
              <a class="nav-link" href="../admin/admin_users">
                  <i class="fas fa-fw fa-cog"></i>
                  <span>Users</span>
              </a>
          </li>

          <!-- Nav Item - Utilities Collapse Menu -->
          <li class="nav-item">
              <a class="nav-link" href="../admin/admin_viewPets" >
                  <i class="fas fa-fw fa-wrench"></i>
                  <span>Pets</span>
              </a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
              Appointments
          </div>

          <!-- Nav Item - Utilities Collapse Menu -->
          <li class="nav-item">
              <a class="nav-link" href="../admin/admin_appointments" >
                  <i class="fas fa-fw fa-wrench"></i>
                  <span>Appointments</span>
              </a>
          </li>

           <!-- Nav Item - Utilities Collapse Menu -->
           <li class="nav-item">
            <a class="nav-link" href="../admin/admin_petServices">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Pet Services</span>
            </a>
            </li>
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

          <!-- Main Content -->
          <div id="content">

              <!-- Topbar -->
              <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                  <!-- Sidebar Toggle (Topbar) -->
                  <form class="form-inline">
                      <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                          <i class="fa fa-bars"></i>
                      </button>
                  </form>

                  <!-- Topbar Search -->

                  <div class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">
                      <h2> Admin - Users </h2>
                  </div>


                  <!-- Topbar Navbar -->
                  <ul class="navbar-nav ml-auto">

                      <div class="topbar-divider d-none d-sm-block"></div>

                      <!-- Nav Item - User Information -->
                      <li class="nav-item dropdown no-arrow">
                          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="mr-2 d-none d-lg-inline text-gray-600 small">${userInfo.fname} ${userInfo.lname}</span>
                          </a>
                          <!-- Dropdown - User Information -->
                          <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                              aria-labelledby="userDropdown">
                              <a class="dropdown-item" href="#">
                                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                  Profile
                              </a>
                              <a class="dropdown-item" href="#">
                                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                  Settings
                              </a>
                              <a class="dropdown-item" href="#">
                                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                  Activity Log
                              </a>
                              <div class="dropdown-divider"></div>
                              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                  Logout
                              </a>
                          </div>
                      </li>

                  </ul>

              </nav>
              <!-- End of Topbar -->

              <!-- Begin Page Content -->
              <div class="container-fluid">
                  <c:choose>
                      <c:when test="${status == 'success'}">
                          <div class="alert alert-primary" role="alert">
                              ${message}
                          </div>
                      </c:when>
                      <c:when test="${status = 'fail'}">
                          <div class="alert alert-danger" role="alert">
                              ${message}
                          </div>
                      </c:when>
                      <c:otherwise>
                      </c:otherwise>
                  </c:choose>

                  <!-- Page Heading -->
                  <h1 class="h3 mb-2 text-gray-800">Users</h1>

                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                      <div class="card-header py-3">
                          <h6 class="m-0 font-weight-bold text-primary">User Information</h6>
                      </div>
                      <div class="card-body">
                          <div class="table-responsive">
                              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                  <thead>
                                      <tr>
                                          <th>ID</th>
                                          <th>Lastname</th>
                                          <th>Firstname</th>
                                          <th>Middle Name</th>
                                          <th>Email</th>
                                          <th>Contact Number</th>
                                          <th>Access Level</th>
                                          <th>Edit</th>
                                          <th>Delete</th>
                                      </tr>
                                  </thead>
                                  <tfoot>
                                      <tr>
                                        <th>ID</th>
                                        <th>Lastname</th>
                                        <th>Firstname</th>
                                        <th>Middle Name</th>
                                        <th>Email</th>
                                        <th>Contact Number</th>
                                        <th>Access Level</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                      </tr>
                                  </tfoot>
                                  <tbody>
                                  <c:forEach items="${userList}" var="user">
                                      <tr>
                                          <td>${user.id}</td>
                                          <td>${user.lname}</td>
                                          <td>${user.fname}</td>
                                          <td>${user.mname}</td>
                                          <td>${user.email}</td>
                                          <td>${user.cnum}</td>
                                          <td>${user.access_level}</td>
                                          <td><a class="btn btn-warning" href='../admin/admin_updateUser?id=${user.id}'> Update </a></td>
                                          <td><a class="btn btn-danger" href='../admin/admin_deleteUser?id=${user.id}'> Delete </a></td>
                                      </tr>

                                  </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- /.container-fluid -->

              <!-- Modal Trigger -->
              <div class="container mt-0 d-flex flex-row-reverse">
                  <button type="button" class="btn-primary px-3 py-2" data-toggle="modal" data-target="#add_user_modal"> Add New User </button>
              </div>

                <!-- Modal -->
                <div class="modal fade" id="add_user_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <form:form action="../admin/admin_saveUser" modelAttribute="user">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>
                        <div class="modal-body">

                                <div class="form-group">
                                    <form:label path="fname"> First Name </form:label>
                                    <form:input path="fname" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="mname"> Middle name </form:label>
                                    <form:input path="mname" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="lname"> Last Name </form:label>
                                    <form:input path="lname" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="email"> Email </form:label>
                                    <form:input path="email" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="cnum"> Contact Number </form:label>
                                    <form:input path="cnum" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="access_level"> User Type </form:label>
                                    <form:select path="access_level" class="form-control">
                                        <form:option value="ROLE_USER" label="User"/>
                                        <form:option value="ROLE_USER" label="Veterinarian"/>
                                        <form:option value="ROLE_ADMIN" label="Admin"/>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <form:label path="id"> Username </form:label>
                                    <form:input path="id" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="password"> Password </form:label>
                                    <form:password path="password" class="form-control"/>
                                </div>

                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" value="Add New User" class="btn btn-primary">
                        </div>
                    </form:form>
                    </div>
                    </div>
                </div>    <!-- End Modal  -->

          </div>
          <!-- End of Main Content -->

          <!-- Footer -->
          <footer class="sticky-footer bg-white">
              <div class="container my-auto">
                  <div class="copyright text-center my-auto">
                      <span>Copyright &copy; Your Website 2020</span>
                  </div>
              </div>
          </footer>
          <!-- End of Footer -->

      </div>
      <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="sample"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="sample">Ready to Leave?</h5>
                  <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                  </button>
              </div>
              <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
              <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                  <a class="btn btn-primary" href="<%=request.getContextPath()%>/user/j_spring_security_logout">Logout</a>
              </div>
          </div>
      </div>
  </div>

    <!-- Bootstrap CDN for Modal -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <jsp:include page="admin_inc/footer_scripts.jsp"/>

</body>
</html>