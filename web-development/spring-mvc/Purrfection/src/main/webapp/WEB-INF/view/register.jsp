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
        
                        <div class="p-5 w-100">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Registration Form</h1>
                            </div>
                            <form:form action="saveUser" modelAttribute="user">
                            <form:hidden path="access_level"/>

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
                                <form:label path="id"> Username </form:label>
                                <form:input path="id" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <form:label path="password"> Password </form:label>
                                <form:password path="password" class="form-control"/>
                            </div>
                            <input  class="btn btn-primary btn-user btn-block" type="submit" value="Register">
                            </form:form>
                        </div>
                </div>
            </div>

        </div>

    </div>

</div>

<jsp:include page="admin/admin_inc/footer_scripts.jsp"/>

</body>
</html>
