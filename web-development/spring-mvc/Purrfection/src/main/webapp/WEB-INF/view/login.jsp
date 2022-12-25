<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 12/12/2022
  Time: 12:15 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Login</title>
    <jsp:include page="admin/admin_inc/head_styles.jsp"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9 ">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5 ">
                                <c:choose>
                                    <c:when test="${status == 'success'}">
                                        <div class="alert alert-success" role="alert">
                                                ${message}
                                        </div>
                                    </c:when>
                                    <c:when test="${status == 'fail'}">
                                        <div class="alert alert-danger" role="alert">
                                                ${message}
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>

                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <c:url value="/j_spring_security_check" var="loginUrl" />
                                <form class="user" action="${loginUrl}" method="POST">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                               id="j_username" name="j_username" aria-describedby="emailHelp"
                                               placeholder="Enter Username..." required="true" >
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="j_password" name="j_password" placeholder="Password">
                                    </div>
                                    <input  class="btn btn-primary btn-user btn-block" type="submit" value="Login">
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="register">Create an Account!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<jsp:include page="admin/admin_inc/footer_scripts.jsp"/>

</body>
</html>
