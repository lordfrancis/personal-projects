<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 08/10/2022
  Time: 2:51 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title> Conversion Result </title>
    <link href="<c:url value="/resources/main-theme/css/main.css" />" rel="stylesheet">
</head>
<body>
<div class="center">
    <h1> Conversion Result </h1>
    <h2> Conversion from ${convertDetails.numFrom} to ${convertDetails.numTo}</h2>
    <h2> Value: ${convertDetails.value}</h2>
    <h2> Result: ${result}</h2>
    <a href="converter"> <input type="button" value="Convert Again"></a>
</div>
</body>
</html>
