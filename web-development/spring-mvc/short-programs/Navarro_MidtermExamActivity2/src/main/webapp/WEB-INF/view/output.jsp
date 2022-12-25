<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 22/10/2022
  Time: 9:38 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Member Information</title>
</head>
<body>
<h1> Member Information </h1>
Name: ${member.firstname} ${member.lastname} <br>
Company: ${member.company} <br>
Business Phone: ${member.bphone} <br>
Home Phone: ${member.hphone} <br>
Email: ${member.email}<br>

</body>
</html>
