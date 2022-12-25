<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 03/12/2022
  Time: 8:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Update Task</title>
</head>
<body>
  <h1> Update Task </h1>
  <form:form action="updateTask" modelAttribute="task">
    <form:hidden path="id"/>
    <form:label path="title"> Title: </form:label>
    <form:input path="title"/><br>

    <form:label path="description"> Description </form:label>
    <form:input path="description"/><br>

    <form:label path="due_date">Due Date: </form:label>
    <form:input type="date" path="due_date"/><br>

    <form:label path="remarks"> Remarks: </form:label>
    <form:input path="remarks"/><br>

    <form:label path="status">Status: </form:label>
    <form:select path="status">
      <form:option value="pending" label="Pending"/>
      <form:option value="inprogress" label="In-Progress"/>
      <form:option value="done" label="Done"/>
      <form:option value="rejected" label="Rejected"/>
    </form:select><br>

    <input type="submit" value="Update Task">
  </form:form>



</body>
</html>
