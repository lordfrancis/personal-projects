<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Multiplication Table Input</title>
</head>
<body>
<form action="MultiplicationTableServlet" method="GET">
Number of rows: <input type="text" name="row"><br>
Number of columns: <input type="text" name="col"><br>
<input type="submit" value="Generate Table">
</form>
</body>
</html>