<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Person Input Page</title>
</head>
<body>

	<h1>Person Information</h1>
	<form method="GET" action="ProcessPerson">
		<table>
			<tr>
				<td>Person ID: </td>
				<td><input type="text" name="person_id"></td>
			</tr>
			<tr>
				<td>Person Name: </td>
				<td><input type="text" name="person_name"></td>
			</tr>
			<tr>
				<td>Birthday: </td>
				<td><input type="date" name="person_date"></td>
			</tr>
			<tr>
				<td>Address: </td>
				<td><input type="text" name="person_address"></td>
			</tr>
			<tr><td><input type="submit" value="Submit"></td></tr>
		</table>
	</form>
	
	<a href="person_list.jsp"> View Person List </a>
	<c:if test="${not empty error}">
		<br><b style="color:red;">Error: ${error} </b>
	</c:if>
</body>
</html>