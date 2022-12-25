<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 22/10/2022
  Time: 9:10 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Member Information</title>
</head>
<body>
<h1> Member Information </h1>
<form:form action="memberInput" modelAttribute="member">
    <form:label path="lastname"> Lastname*: </form:label>
    <form:input path="lastname" required="true"/><br>
    <form:label path="firstname"> Firstname*: </form:label>
    <form:input path="firstname" required="true"/><br>
    <form:label path="company"> Company: </form:label>
    <form:input path="company"/><br>
    <form:label path="bphone"> Business Phone: </form:label>
    <form:input path="bphone"/><br>
    <form:label path="hphone"> Home Phone: </form:label>
    <form:input path="hphone"/><br>
    <form:label path="email" required="true"> Email*: </form:label>
    <form:input path="email"/><br>
    <input type="submit">

</form:form>

</body>
</html>
