<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 02/11/2022
  Time: 12:31 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Display Prime</title>
    <style>
        .prime{
            font-weight: bold;
            color: red;
        }

        li{
            font-size: 2rem;
            display:inline;
            margin-right: 2rem;
        }
    </style>
</head>
<body>
<div style="margin-left: 2rem">
<h1> Display numbers from ${util.num1} to ${util.num2} and highlight(RED) PRIME numbers</h1>
<c:forEach items="${numbers}" var="number">
    <c:choose>
        <c:when test="${util.checkIfPrime(number)}">
            <li class="prime">${number}</li>
        </c:when>
        <c:otherwise>
            <li>${number}</li>
        </c:otherwise>
    </c:choose>
</c:forEach>
</div>
</body>
</html>
