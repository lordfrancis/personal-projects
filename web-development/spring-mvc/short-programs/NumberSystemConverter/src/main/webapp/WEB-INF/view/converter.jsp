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

<html>
<head>
  <title>Number System Converter</title>
  <link href="<c:url value="/resources/main-theme/css/main.css" />" rel="stylesheet">
</head>
<body>
<div class="center">
  <h1> Number System Converter </h1>
  <form method="POST" action="convertNumber" id="convertNumberForm">
    <table>
      <tr>
        <td>
          <label for="numFrom">From: </label>
          <select name="numFrom" id="numFrom" form="convertNumberForm">
            <option value="decimal"> Decimal </option>
            <option value="binary"> Binary </option>
            <option value="octal"> Octal </option>
            <option value="hexadecimal"> Hexadecimal </option>
          </select>
        </td>
        <td>
          <label for="numTo">To: </label>
          <select name="numTo" id="numTo" form="convertNumberForm">
            <option value="decimal"> Decimal </option>
            <option value="binary"> Binary </option>
            <option value="octal"> Octal </option>
            <option value="hexadecimal"> Hexadecimal </option>
          </select>
        </td>
        </td>
      </tr>
      <tr>
        <td colspan="2"> <label for="numFromValue">Enter the Value:</label> <input type="text" name="numFromValue" id="numFromValue" required></td>
      </tr>
      <tr> <td colspan="2" style="text-align: center;"><input type="submit" value="Convert"> </td></tr>
    </table>
  </form>
</div>
</body>
</html>
