<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Edit Person</h1>
	<form method="GET" action="EditPerson">
	<input type="hidden" name="index" value="<c:out value="${param['index']}"></c:out>">
		<table>
			<tr>
				<td>Person ID: </td>
				<td><input type="text" name="person_id" value="<c:out value="${param['id']}"></c:out>"></td>
			</tr>
			<tr>
				<td>Person Name: </td>
				<td><input type="text" name="person_name" value="<c:out value="${param['name']}"></c:out>"></td>
			</tr>
			<tr>
				<td>Birthday: </td>
				<td><input type="date" name="person_date" value="<c:out value="${param['birthday']}"></c:out>"></td>
			</tr>
			<tr>
				<td>Address: </td>
				<td><input type="text" name="person_address" value="<c:out value="${param['address']}"></c:out>"></td>
			</tr>
			<tr><td><input type="submit" value="Edit Person"></td></tr>
		</table>
	</form>
	<a href="index.jsp"> Add New person </a><br>
	<a href="person_list.jsp"> View Person List </a>
	
	<c:if test="${not empty error}">
		<br><b style="color:red;">Error: ${error} </b>
	</c:if>
	
</body>
</html>