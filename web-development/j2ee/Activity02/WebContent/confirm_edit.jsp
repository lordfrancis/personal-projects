<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Confirm Information</h1>
	<form action="EditPerson" method="post">
		<table>
			<tr>
				<td>Person ID: </td>
				<td>${person.id}</td>
			</tr>
			<tr>
				<td>Person Name: </td>
				<td>${person.name}</td>
			</tr>
			<tr>
				<td>Birthday: </td>
				<td>${person.birthday}</td>
			</tr>
			<tr>
				<td>Address: </td>
				<td>${person.address}</td>
			</tr>
			<tr><td  style="padding-top:.5rem;"><input type="submit" value="Save Person Data"></td></tr>
		</table>
	
	</form>

</body>
</html>