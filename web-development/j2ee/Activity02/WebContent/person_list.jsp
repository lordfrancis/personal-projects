<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Saved Person</title>
</head>
<body>
	<h1> Person List </h1>
	<table>
	<tr>
		<th> ID </th> <th> Name </th> <th> Birthday </th> <th> Address </th> <th> Edit </th>
	</tr>

	<c:forEach items="${personList}" var="person" varStatus="loop">
	<tr>
		
		<td>${person.id}</td>
		<td>${person.name}</td>
		<td>${person.birthday}</td>
		<td>${person.address}</td>
		<td><a href="edit_person.jsp?id=${person.id}&name=${person.name}&birthday=${person.birthday}&address=${person.address}&index=${loop.index}">Edit</a></td>
	</tr>
	</c:forEach>
	</table>
	<a href="index.jsp"> Add New person </a>
	
</body>
</html>