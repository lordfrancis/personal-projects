<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 02/11/2022
  Time: 9:56 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Result</title>
    <style>
        li{
            font-size: 2rem;
            display:inline;
            margin-right: 2rem;
        }
    </style>
</head>
<body>
<div style="margin-left: 2rem">
<ul>
    <h1> Display numbers from ${util.num1} to ${util.num2}</h1>
<c:forEach items="${numbers}" var="number">
    <li>${number}</li>
</c:forEach>
</ul>
</div>
</body>
</html>
